/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.controller;

import com.example.demo2.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author loidinhcap
 */
@RestController
public class AuthenticationController {
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String login(Model model){
        model.addAttribute("user", new User());
        return "login.jsp";
    }
    
//    @PostMapping(value = "login")
//    public String access(@ModelAttribute("user") User user, Model model){
//        if()
//    }
}
