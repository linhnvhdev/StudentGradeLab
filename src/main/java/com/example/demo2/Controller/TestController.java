/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author linhnvhdev
 */
@Controller
public class TestController {
    @RequestMapping("/test")
    public String list(Model model) {
        model.addAttribute("test","TestString");
        return "test";
    }
}
