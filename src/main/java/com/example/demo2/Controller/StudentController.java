/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Course;
import com.example.demo2.Model.CourseGradeType;
import com.example.demo2.Model.Curriculum;
import com.example.demo2.Model.Curriculum_Course;
import com.example.demo2.Model.Grade;
import com.example.demo2.Model.Grade_Id;
import com.example.demo2.Model.Semester;
import com.example.demo2.Model.Student;
import com.example.demo2.Repository.CourseGradeTypeRepository;
import com.example.demo2.Repository.CurriculumRepository;
import com.example.demo2.Repository.GradeRepository;
import com.example.demo2.Repository.SemesterRepository;
import com.example.demo2.Repository.StudentRepository;
import com.example.demo2.Service.GradeCalculatingService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author loidinhcap
 */
@Controller
public class StudentController {
    @Autowired
    private SemesterRepository SemesterRepository;
    
    @Autowired
    private StudentRepository StudentRepository;
    
    @Autowired
    private CurriculumRepository CurriculumRepository;
    
    @Autowired
    private GradeRepository gradeRepository;
    
    @Autowired
    private CourseGradeTypeRepository courseGradeTypeRepository;
    
    @Autowired
    private GradeCalculatingService gradeService;
    
    @GetMapping("/student")
    public String home(){
        return "student";
    }
    
    @GetMapping("/student/viewgrade")
    public String viewGrade(Model model, 
            @RequestParam(name = "sem", defaultValue = "-1") int semid,
            @RequestParam(name = "courseId", defaultValue = "-1") int courseId){
        int stuid = 1;
        
        List<Semester> semesters = SemesterRepository.findAll();
        Student student = StudentRepository.findById(stuid).get();
        Curriculum curriculum = CurriculumRepository.findById(student.getCurriculum().getId()).get();
        
        if(semid == -1){
            semid = student.getSemester().getId();
        }
        
        List<Curriculum_Course> curriculemCourse = curriculum.getCurriculemCourse();
        List<Course> ccs = new ArrayList<>();
        for(Curriculum_Course cc: curriculemCourse){
            if(cc.getTerm()==semid){
                ccs.add(cc.getCourse());
            }
        }
        
        if(courseId == -1){
            if(ccs.size() > 0)
                courseId = ccs.get(0).getId();
        }
        
        List<CourseGradeType> gradeTypes = courseGradeTypeRepository.findByCourse_id(courseId);
        HashMap<CourseGradeType, Grade> grades = new HashMap<>();
        
        for(Course course : ccs){
            
            Grade_Id id = new Grade_Id();
            id.setStudent_id(stuid);
            id.setCourse_id(course.getId());
            id.setSemester_id(semid);
            
            for(CourseGradeType gradeType : gradeTypes){
                id.setGrade_type(gradeType.getGrade_type());
                List<Grade> findAll = gradeRepository.findAll();
                Optional<Grade> grade = gradeRepository.findById(id);
                if (!grade.isEmpty()) {
                    grades.put(gradeType,grade.get());
                } else {
                    grades.put(gradeType,new Grade(id.getStudent_id(), id.getSemester_id(),
                            id.getCourse_id(), gradeType.getGrade_type(),
                            0));
                }
            }
        }
        
        model.addAttribute("semId",semid);
        model.addAttribute("courseId",courseId);
        model.addAttribute("grades",grades);
        model.addAttribute("semesters", semesters);
        model.addAttribute("sem", semid);
        model.addAttribute("courses", ccs);
        return "studentviewgrade";
    }
    
    @GetMapping("/student/transcript")
    public String viewGrade(Model model){
        int stuid = 1;
        Student student = StudentRepository.findById(stuid).get();
        Curriculum curriculum = CurriculumRepository.findById(student.getCurriculum().getId()).get();
        
        List<Curriculum_Course> curriculemCourse = curriculum.getCurriculemCourse();
        List<Course> ccs = new ArrayList<>();
        HashMap<Curriculum_Course, Course> courses = new HashMap<>();
        for(Curriculum_Course cc: curriculemCourse){
            ccs.add(cc.getCourse());
        }
        
        HashMap<Integer, Float> averageGrades = new HashMap<>();
        HashMap<Integer, Boolean> isPass = new HashMap<>();
        
        for(Course course : ccs){
            averageGrades.put(course.getId(),gradeService.AverageGradeStudentCourse(student.getId(), course.getId()));
            isPass.put(course.getId(),gradeService.IsPassCourse(student.getId(), course.getId()));
        }
        
        model.addAttribute("curriculum",curriculum);
        model.addAttribute("curriculemCourse",curriculemCourse);
        model.addAttribute("student",student);
        model.addAttribute("courses",ccs);
        model.addAttribute("averageGrades",averageGrades);
        model.addAttribute("isPass",isPass);
        
        return "student-transcript";
    }
    
}
