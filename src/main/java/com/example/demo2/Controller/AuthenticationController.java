/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.User;
import com.example.demo2.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author loidinhcap
 */
@Controller
public class AuthenticationController {
    @Autowired
    private UserRepository userRepository;
    
    @RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
    public String login(Model model){
        model.addAttribute("user", new User());
        return "login";
    }
    
    @PostMapping(value = "login")
    public String access(@ModelAttribute("user") User user, Model model){
        User userDb = userRepository.findById(user.getCode()).get();
//        if(userDb.getPassword().equals(user.getPassword())){
//            
//            return "home";
//        }else{
//            model.addAttribute("error", "Please check your username and password!");
//            return "login";
//        }
        model.addAttribute("user", userDb);
        return "home";
    }
}
