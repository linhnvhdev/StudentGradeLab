/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.User;
import com.example.demo2.dao.UserRepository;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

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
    
    @PostMapping(value = "/login")
    public String access(@RequestParam(name = "username") String username, @RequestParam(name = "password") String password, Model model, HttpServletRequest request){
        User user = new User();
        user.setCode(username);
        user.setPassword(password);
        User userDb = userRepository.findById(user.getCode()).get();
        if(userDb.getPassword().equals(user.getPassword())){
            request.getSession().setAttribute("user", user);
            return "home";
        }else{
            model.addAttribute("error", "Please check your username and password!");
            return "login";
        }
    }
    
    @GetMapping("/accessdenied")
    public RedirectView accessdenied(){
        return new RedirectView("login");
    }
    
    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().setAttribute("user", null);
        return "login";
    }
}
