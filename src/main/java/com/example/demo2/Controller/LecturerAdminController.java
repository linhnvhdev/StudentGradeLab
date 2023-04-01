/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Curriculum;
import com.example.demo2.Model.Lecturer;
import com.example.demo2.Model.Role;
import com.example.demo2.Model.Semester;
import com.example.demo2.Model.Student;
import com.example.demo2.Model.User;
import com.example.demo2.Repository.LecturerRepository;
import com.example.demo2.Repository.RoleRepository;
import com.example.demo2.Repository.UserRepository;
import java.sql.Date;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author quang
 */
@Controller
public class LecturerAdminController {

    @Autowired
    public UserRepository userRepository;
    @Autowired
    public LecturerRepository lecturerRepository;
    @Autowired
    public RoleRepository roleRepository;

    @RequestMapping(value = "/admin/admin-lecturer-list", method = RequestMethod.GET)
    public String getLecturerList(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getRole().getId() != 1) {
            return "redirect:/login";
        }
        model.addAttribute("lec", lecturerRepository.findAll());
        return "admin-lecturer-list";
    }

    @RequestMapping(value = "/admin/admin-lecturer-list/delete", method = RequestMethod.GET)
    public String deleteLecturer(@RequestParam("id") int id, Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getRole().getId() != 1) {
            return "redirect:/login";
        }
        Lecturer s = lecturerRepository.findById(id).get();
        lecturerRepository.deleteById(id);
        userRepository.delete(s.getUser());
        return "redirect:/admin/admin-lecturer-list";
    }

    @RequestMapping(value = "/admin/admin-lecturer-list/create", method = RequestMethod.GET)
    public String createLecturer(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getRole().getId() != 1) {
            return "redirect:/login";
        }
        return "create-lecturer";
    }

    @RequestMapping(value = "/admin/admin-lecturer-list/create", method = RequestMethod.POST)
    public String createNewLecturer(
            @RequestParam("name") String name,
            @RequestParam("dob") Date dob,
            @RequestParam("gender") String gender,
            @RequestParam("code") String code,
            @RequestParam("pass") String pass,
            Model model,
            HttpServletRequest request) {
        User userx = (User) request.getSession().getAttribute("user");
        if (userx == null || userx.getRole().getId() != 1) {
            return "redirect:/login";
        }
        User user = new User();
        user.setCode(code);
        user.setPassword(pass);
        Optional<Role> studentRole = roleRepository.findById(2);
        user.setRole(studentRole.get());

        Lecturer lecturer = new Lecturer();
        lecturer.setName(name);
        lecturer.setDob(dob);
        if (gender.equals("male")) {
            lecturer.setGender(true);
        } else {
            lecturer.setGender(false);
        }

        lecturer.setUser(user);

        lecturerRepository.save(lecturer);

        return "redirect:/admin/admin-lecturer-list";
    }

    @RequestMapping(value = "/admin/admin-lecturer-list/edit", method = RequestMethod.GET)
    public String editLecturer(@RequestParam("id") int id, Model model, HttpServletRequest request) {
        model.addAttribute("lec", lecturerRepository.getById(id));

        return "update-lecturer";
    }

    @RequestMapping(value = "/admin/admin-lecturer-list/edit", method = RequestMethod.POST)
    public String updateLecturer(
            @RequestParam("lid") int lid,
            @RequestParam("name") String name,
            @RequestParam("dob") Date dob,
            @RequestParam("gender") String gender,
            @RequestParam("code") String code,
            @RequestParam("pass") String pass,
            Model model,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getRole().getId() != 1) {
            return "redirect:/login";
        }
        Lecturer lecturer = lecturerRepository.findById(lid).get();
        lecturer.setName(name);
        lecturer.setDob(dob);
        if (gender.equals("male")) {
            lecturer.setGender(true);
        } else {
            lecturer.setGender(false);
        }

        User lecturerUser = userRepository.findById(lecturer.getUser().getCode()).get();
        lecturerUser.setPassword(pass);
        userRepository.save(lecturerUser);
        lecturerRepository.save(lecturer);
        return "redirect:/admin/admin-lecturer-list";
    }
}
