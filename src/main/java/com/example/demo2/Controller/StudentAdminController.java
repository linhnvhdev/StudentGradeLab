/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Curriculum;
import com.example.demo2.Model.Role;
import com.example.demo2.Model.Semester;
import com.example.demo2.Model.Student;
import com.example.demo2.Model.User;
import com.example.demo2.Repository.CurriculumRepository;
import com.example.demo2.Repository.RoleRepository;
import com.example.demo2.Repository.SemesterRepository;
import com.example.demo2.Repository.StudentRepository;
import com.example.demo2.Repository.UserRepository;
import java.sql.Date;
import java.util.Optional;
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
public class StudentAdminController {

    @Autowired
    public StudentRepository studentRepository;
    @Autowired
    public UserRepository userRepository;
    @Autowired
    public RoleRepository roleRepository;
    @Autowired
    public CurriculumRepository curriculumRepository;
    @Autowired
    public SemesterRepository semesterRepository;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String get(Model model) {
        return "admin";
    }

    @RequestMapping(value = "/admin/admin-student-list", method = RequestMethod.GET)
    public String getStudentList(Model model) {
        model.addAttribute("stud", studentRepository.findAll());
        return "admin-student-list";
    }

    @RequestMapping(value = "/admin/admin-student-list/delete", method = RequestMethod.GET)
    public String deleteStudent(@RequestParam("id") int id, Model model) {
        Student s = studentRepository.findById(id).get();
        studentRepository.deleteById(id);
        userRepository.delete(s.getUser());
        System.out.println("Delete " + id);
        return "redirect:/admin/admin-student-list";
    }

    @RequestMapping(value = "/admin/admin-student-list/create", method = RequestMethod.GET)
    public String createStudent(Model model) {
        model.addAttribute("curriculums", curriculumRepository.findAll());
        model.addAttribute("semesters", semesterRepository.findAll());
        return "create-student";
    }

    @RequestMapping(value = "/admin/admin-student-list/create", method = RequestMethod.POST)
    public String createNewStudent(
            @RequestParam("name") String name,
            @RequestParam("dob") Date dob,
            @RequestParam("gender") String gender,
            @RequestParam("curriculum") int curriculum,
            @RequestParam("semester") int semester,
            @RequestParam("term") int term,
            @RequestParam("code") String code,
            @RequestParam("pass") String pass,
            Model model) {
        User user = new User();
        user.setCode(code);
        user.setPassword(pass);
        Optional<Role> studentRole = roleRepository.findById(3);
        user.setRole(studentRole.get());
        Optional<Curriculum> studentCurriculum = curriculumRepository.findById(curriculum);
        Optional<Semester> studentSemester = semesterRepository.findById(semester);
        Student student = new Student();
        student.setName(name);
        student.setDob(dob);
        if (gender.equals("male")) {
            student.setGender(true);
        } else {
            student.setGender(false);
        }
        student.setCurriculum(studentCurriculum.get());
        student.setSemester(studentSemester.get());
        student.setTerm(term);
        student.setUser(user);

        studentRepository.save(student);

        return "redirect:/admin/admin-student-list";
    }

    @RequestMapping(value = "/admin/admin-student-list/edit", method = RequestMethod.GET)
    public String editStudent(@RequestParam("id") int id, Model model) {
        model.addAttribute("stud", studentRepository.getById(id));
        model.addAttribute("curriculums", curriculumRepository.findAll());
        model.addAttribute("semesters", semesterRepository.findAll());
        return "update-student";
    }

    @RequestMapping(value = "/admin/admin-student-list/edit", method = RequestMethod.POST)
    public String updateStudent(
            @RequestParam("sid") int sid,
            @RequestParam("name") String name,
            @RequestParam("dob") Date dob,
            @RequestParam("gender") String gender,
            @RequestParam("curriculum") int curriculum,
            @RequestParam("semester") int semester,
            @RequestParam("term") int term,
            @RequestParam("code") String code,
            @RequestParam("pass") String pass,
            Model model) {
        Curriculum studentCurriculum = curriculumRepository.findById(curriculum).get();
        Semester studentSemester = semesterRepository.findById(semester).get();
        Student student = studentRepository.findById(sid).get();
        student.setName(name);
        student.setDob(dob);
        if (gender.equals("male")) {
            student.setGender(true);
        } else {
            student.setGender(false);
        }
        student.setCurriculum(studentCurriculum);
        student.setSemester(studentSemester);
        student.setTerm(term);
        User studentUser = userRepository.findById(student.getUser().getCode()).get();
        studentUser.setPassword(pass);
        userRepository.save(studentUser);
        studentRepository.save(student);
        return "redirect:/admin/admin-student-list";
    }
}
