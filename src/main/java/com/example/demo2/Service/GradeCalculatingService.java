/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Service;

import com.example.demo2.Model.Course;
import com.example.demo2.Model.CourseGradeType;
import com.example.demo2.Model.Grade;
import com.example.demo2.Model.Student;
import com.example.demo2.Repository.CourseGradeTypeRepository;
import com.example.demo2.Repository.CourseRepository;
import com.example.demo2.Repository.GradeRepository;
import com.example.demo2.Repository.GroupGradeRepository;
import com.example.demo2.Repository.StudentRepository;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author linhnvhdev
 */
@Service
public class GradeCalculatingService {
    @Autowired
    private CourseGradeTypeRepository courseGradeTypeRepository;
    @Autowired
    private GradeRepository gradeRepository;
    
    @Autowired
    private GroupGradeRepository groupRepository;
    
    @Autowired
    private CourseRepository courseRepository;
    
    public float AverageGradeStudentCourse(int student_id, int course_id)
    {
        List<Grade> grades = gradeRepository.findByStudent_idAndCourse_id(student_id, course_id);
        List<CourseGradeType> gradeTypes = courseGradeTypeRepository.findByCourse_id(course_id);
        
        HashMap<String, CourseGradeType> map = new HashMap<>();
        for(CourseGradeType t : gradeTypes){
            map.put(t.getGrade_type(), t);
        }
        float averageGrade = 0;
        for(Grade g : grades){
            averageGrade += g.getValue() * map.get(g.getGrade_type()).getWeight();
        }
        return averageGrade / 100;
    }
    
    public float AverageGradeStudentSemester(int student_id,int semester_id)
    {
        int totalCredit = 0;
        float averageGrade = 0;
        List<Grade> grades = gradeRepository.findByStudent_idAndSemester_id(student_id, semester_id);
        
        for(int i = 0;i < grades.size(); i ++){
            Grade grade = grades.get(i);
            if(i == 0 || grade.getCourse_id() != grades.get(i - 1).getCourse_id()){
                Course course = courseRepository.findById(grade.getCourse_id()).get();
                float avgScoreCourse = AverageGradeStudentCourse(student_id, course.getId());
                averageGrade += avgScoreCourse * course.getCredit();
                totalCredit += course.getCredit();
            }
        }
        
        return averageGrade = averageGrade /  totalCredit;
    }
    
    public boolean IsPassCourse(int studentId, int courseId)
    {
        List<Grade> grades = gradeRepository.findByStudent_idAndCourse_id(studentId, courseId);
        List<CourseGradeType> gradeTypes = courseGradeTypeRepository.findByCourse_id(courseId);
        
        HashMap<String, CourseGradeType> map = new HashMap<>();
        for(CourseGradeType t : gradeTypes){
            map.put(t.getGrade_type(), t);
        }
        float averageGrade = 0;
        for(Grade g : grades){
            CourseGradeType courseGradeType = map.get(g.getGrade_type());
            averageGrade += g.getValue() * courseGradeType.getWeight();
            if(g.getValue() < courseGradeType.getFailScore())
                return false;
        }
        return averageGrade >= 5;
    }
}
