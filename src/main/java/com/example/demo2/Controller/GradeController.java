/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Repository.CourseGradeTypeRepository;
import com.example.demo2.Repository.CourseRepository;
import com.example.demo2.Repository.GradeRepository;
import com.example.demo2.Repository.GroupGradeRepository;
import com.example.demo2.Model.Course;
import com.example.demo2.Model.CourseGradeType;
import com.example.demo2.Model.CourseGradeType_Id;
import com.example.demo2.Model.Grade;
import com.example.demo2.Model.GradeList;
import com.example.demo2.Model.Grade_Id;
import com.example.demo2.Model.LearnGroup;
import com.example.demo2.Model.Student;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author linhnvhdev
 */
@Controller
public class GradeController {

    @Autowired
    private CourseGradeTypeRepository courseGradeTypeRepository;
    @Autowired
    private GradeRepository gradeRepository;
    @Autowired
    private GroupGradeRepository groupRepository;
    
    @Autowired
    private CourseRepository CourseRepository;

    @RequestMapping(path = "grade/edit")
    public String GetEditGroupGrade(Model model, @RequestParam("id") int groupId) {
        HashMap<Student, List<Grade>> studentGrades = new HashMap<>();
        LearnGroup group = groupRepository.findById(groupId).get();
        List<Student> students = group.getStudents();
        List<CourseGradeType> gradeTypes = courseGradeTypeRepository
                .findByCourse_id(group.getCourse().getId());
        GradeList gradesList = new GradeList();
        for (Student s : students) {
            List<Grade> grades = new ArrayList<Grade>();

            Grade_Id id = new Grade_Id();
            id.setStudent_id(s.getId());
            id.setCourse_id(group.getCourse().getId());
            id.setSemester_id(s.getSemester().getId());

            for (CourseGradeType t : gradeTypes) {
                id.setGrade_type(t.getGrade_type());
                List<Grade> findAll = gradeRepository.findAll();
                Optional<Grade> grade = gradeRepository.findById(id);
                if (!grade.isEmpty()) {
                    grades.add(grade.get());
                } else {
                    grades.add(new Grade(id.getStudent_id(), id.getSemester_id(),
                            id.getCourse_id(), t.getGrade_type(),
                            0));
                }
            }
            studentGrades.put(s, grades);
            gradesList.getGrades().addAll(grades);
        }
        model.addAttribute("studentGrades", studentGrades);
        model.addAttribute("group", group);
        model.addAttribute("gradeTypes", gradeTypes);
        model.addAttribute("gradeList", gradesList);
        return "Grade/edit";
    }

    @RequestMapping(path = "grade/group")
    public String GetGroupGrade(Model model, @RequestParam("id") int groupId) {
        HashMap<Student, List<Grade>> studentGrades = new HashMap<>();
        LearnGroup group = groupRepository.findById(groupId).get();
        List<Student> students = group.getStudents();
        List<CourseGradeType> gradeTypes = courseGradeTypeRepository
                .findByCourse_id(group.getCourse().getId());
        for (Student s : students) {
            List<Grade> grades = new ArrayList<Grade>();

            Grade_Id id = new Grade_Id();
            id.setStudent_id(s.getId());
            id.setCourse_id(group.getCourse().getId());
            id.setSemester_id(s.getSemester().getId());

            for (CourseGradeType t : gradeTypes) {
                id.setGrade_type(t.getGrade_type());
                List<Grade> findAll = gradeRepository.findAll();
                Optional<Grade> grade = gradeRepository.findById(id);
                if (!grade.isEmpty()) {
                    grades.add(grade.get());
                } else {
                    grades.add(new Grade(id.getStudent_id(), id.getSemester_id(),
                            id.getCourse_id(), t.getGrade_type(),
                            0));
                }
            }
            studentGrades.put(s, grades);
        }
        
        model.addAttribute("studentGrades", studentGrades);
        model.addAttribute("group", group);
        model.addAttribute("gradeTypes", gradeTypes);
        
        return "Grade/index";
    }

    @RequestMapping(path = "/grade/save",method=RequestMethod.POST)
    public String SaveGrade(@ModelAttribute("gradeList") GradeList grades) {
        List<Grade> gradesList = grades.getGrades();
        gradeRepository.saveAll(grades.getGrades());
        //gradeRepository.saveAll(gradeList.getGrades);
        return "redirect:group?id=1";
    }
    
    @RequestMapping(path = "/grade/groups",method=RequestMethod.GET)
    public String GetAllGroup(Model model) {
        List<LearnGroup> groups =  groupRepository.findAll();
        model.addAttribute("groups",groups);
        //gradeRepository.saveAll(gradeList.getGrades);
        return "Grade/groups";
    }
    
    @RequestMapping(path = "/grade/type", method=RequestMethod.GET)
    public String GetGradeType(Model model, @RequestParam("id") int courseId)
    {
        List<CourseGradeType> gradeTypes = courseGradeTypeRepository.findByCourse_id(courseId);
        model.addAttribute("gradeTypes", gradeTypes);
        Course course = CourseRepository.findById(courseId).get();
        model.addAttribute("course",course);
        return "Grade/type";
    }
    
    @RequestMapping(path = "/grade/addType", method=RequestMethod.GET)
    public String GetAddGradeType(Model model, @RequestParam("id") int courseId)
    {
        model.addAttribute("courseId",courseId);
        return "Grade/addType";
    }
    
    @RequestMapping(path = "/grade/addType", method=RequestMethod.POST)
    public String AddGradeType(Model model, @RequestParam("courseId") int courseId,
                                            @RequestParam("gradeType") String gradeType,
                                            @RequestParam("weight") float weight,
                                            @RequestParam("failScore") float failScore)
    {
        CourseGradeType type = new CourseGradeType();
        type.setCourse_id(courseId);
        type.setGrade_type(gradeType);
        type.setWeight(weight);
        type.setFailScore(failScore);
        courseGradeTypeRepository.save(type);
        return "redirect:/grade/type?id="+courseId;
    }
    
    @RequestMapping(path = "/grade/deleteType", method=RequestMethod.GET)
    public String DeleteGradeType(Model model, @RequestParam("id") int courseId,
                                            @RequestParam("type") String gradeType)
    {
        CourseGradeType_Id type = new CourseGradeType_Id();
        type.setCourseId(courseId);
        type.setGrade_type(gradeType);
        courseGradeTypeRepository.deleteById(type);
        return "redirect:/grade/type?id="+courseId;
    }
    
    @RequestMapping(path = "/grade/editType", method=RequestMethod.GET)
    public String GetEditGradeType(Model model, @RequestParam("id") int courseId,
                                               @RequestParam("type") String gradeType)
    {
        CourseGradeType_Id typeId = new CourseGradeType_Id();
        typeId.setCourseId(courseId);
        typeId.setGrade_type(gradeType);
        
        CourseGradeType type = courseGradeTypeRepository.findById(typeId).get();
        
        model.addAttribute("gradeType",type);
        model.addAttribute("courseId",courseId);
        return "Grade/editType";
    }
    
    @RequestMapping(path = "/grade/editType", method=RequestMethod.POST)
    public String EditGradeType(Model model, @RequestParam("courseId") int courseId,
                                            @RequestParam("gradeType") String gradeType,
                                            @RequestParam("oldGradeType") String oldGradeType,
                                            @RequestParam("weight") float weight,
                                            @RequestParam("failScore") float failScore)
    {
        CourseGradeType type = new CourseGradeType();
        type.setCourse_id(courseId);
        type.setGrade_type(gradeType);
        type.setWeight(weight);
        type.setFailScore(failScore);
        if(gradeType == oldGradeType)
        {
            courseGradeTypeRepository.save(type);
        }
        else{
            type.setGrade_type(oldGradeType);
            courseGradeTypeRepository.delete(type);
            type.setGrade_type(gradeType);
            courseGradeTypeRepository.save(type);
        }
        return "redirect:/grade/type?id="+courseId;
    }
    
}