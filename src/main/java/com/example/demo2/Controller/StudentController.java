/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Course;
import com.example.demo2.Model.Curriculum;
import com.example.demo2.Model.Curriculum_Course;
import com.example.demo2.Model.Semester;
import com.example.demo2.Model.Student;
import com.example.demo2.Repository.CurriculumRepository;
import com.example.demo2.Repository.SemesterRepository;
import com.example.demo2.Repository.StudentRepository;
import java.util.ArrayList;
import java.util.List;
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
    
    @GetMapping("/student")
    public String home(){
        return "student";
    }
    
    @GetMapping("/student/viewgrade")
    public String viewGrade(Model model, 
            @RequestParam(name = "sem", defaultValue = "1") String semid){
//        int stuid = 1;
        List<Semester> semesters = SemesterRepository.findAll();
        model.addAttribute("semesters", semesters);
        int semid1 = Integer.parseInt(semid);
        Student student = StudentRepository.findById(1).get();
        Curriculum curriculum = CurriculumRepository.findById(student.getCurriculum().getId()).get();
        List<Curriculum_Course> curriculemCourse = curriculum.getCurriculemCourse();
        List<Course> ccs = new ArrayList<>();
        for(Curriculum_Course cc: curriculemCourse){
            if(cc.getTerm()==semid1){
                ccs.add(cc.getCourse());
            }
        }
        model.addAttribute("sem", semid);
        model.addAttribute("courses", ccs);
        return "studentviewgrade";
    }
    
}
