/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Service.GradeCalculatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author linhnvhdev
 */
@Controller
public class TestController {
    
    @Autowired
    private GradeCalculatingService gradeService;
    
    @RequestMapping("/test")
    public String list(Model model,@RequestParam("studentId") int studentId
                                  ,@RequestParam("semseterId") int semesterId) {
        float result = gradeService.AverageGradeStudentSemester(studentId, semesterId);
        model.addAttribute("test","TestString");
        model.addAttribute("result",result);
        return "test";
    }
}
