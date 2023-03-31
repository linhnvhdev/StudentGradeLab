/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Grade;
import com.example.demo2.Model.User;
import com.example.demo2.Repository.GradeRepository;
import com.example.demo2.Repository.UserRepository;
import com.example.demo2.Service.ExcelExporter;
import com.example.demo2.Service.GradeCalculatingService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    
    @Autowired
    private GradeRepository gradeRepository;
    
    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/test")
    public String list(Model model, @RequestParam("studentId") int studentId,
             @RequestParam("semseterId") int semesterId) {
        float result = gradeService.AverageGradeStudentSemester(studentId, semesterId);
        model.addAttribute("test", "TestString");
        model.addAttribute("result", result);
        return "test";
    }

    @GetMapping("/test/excel")
    public void exportIntoExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=records_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        List<String> headers = new ArrayList<>();
        List<String> recordStrings = new ArrayList();
        
        List<User> users = userRepository.findAll();
        headers.add("Code");
        headers.add("password");
        headers.add("Role");
        
        for(User u : users)
        {
            recordStrings.add(u.getCode()+";"+
                              u.getPassword()+";"+
                              u.getRole().getName());
        }
        
        
        /**
         // test export grades
        
        List<Grade> grades = gradeRepository.findAll();
        headers.add("Course");
        headers.add("Student");
        headers.add("Semester");
        headers.add("Grade Type");
        headers.add("Grade");
        for(Grade g : grades)
        {
            recordStrings.add(g.getCourse().getName()+";"+
                              g.getStudent().getName()+";"+
                              g.getSemester().getName()+";"+
                              g.getGrade_type()+";"+
                              g.getValue());
        }
        * 
        **/
        
        

        ExcelExporter generator = new ExcelExporter(headers,recordStrings);

        generator.generate(response);
    }
}
