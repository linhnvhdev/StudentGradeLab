/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Grade;
import com.example.demo2.Model.Student;
import com.example.demo2.Model.StudentAverageGrade;
import com.example.demo2.Model.StudentSemesterCourse;
import com.example.demo2.Repository.GradeRepository;
import com.example.demo2.Repository.StudentRepository;
import com.example.demo2.Service.GradeCalculatingService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author quang
 */
@Controller
public class GradeAdminController {

    @Autowired
    private GradeRepository gradeRepository;
    @Autowired
    private GradeCalculatingService service;

    @RequestMapping(value = "/admin/admin-grades-list", method = RequestMethod.GET)
    public String getGradesList(Model model) {
        Map<StudentSemesterCourse, StudentAverageGrade> gradeMap = new HashMap<>();
        List<Grade> gradeList = gradeRepository.findAll();
        for (int i = 0; i < gradeList.size(); i++) {
            StudentSemesterCourse key
                    = new StudentSemesterCourse(gradeList.get(i).getStudent(),
                            gradeList.get(i).getSemester(), gradeList.get(i).getCourse());
            if (!gradeMap.containsKey(key)) {
                float average = service.
                        AverageGradeStudentSemester(gradeList.get(i).getStudent_id(), gradeList.get(i).getSemester_id());
                gradeMap.put(key,
                        new StudentAverageGrade(gradeList.get(i).getStudent(),
                                gradeList.get(i).getSemester(), average));
            }
        }
        model.addAttribute("list", gradeMap);
        return "admin-grades-list";
    }

    @RequestMapping(value = "/admin/admin-grades-list/student", method = RequestMethod.GET)
    public String getStudentGradesList() {
        return "admin-student-grades-list";
    }
}
