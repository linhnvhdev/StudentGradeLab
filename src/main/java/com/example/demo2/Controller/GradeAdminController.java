/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Controller;

import com.example.demo2.Model.Grade;
import com.example.demo2.Model.Major;
import com.example.demo2.Model.Student;
import com.example.demo2.Model.StudentAverageGrade;
import com.example.demo2.Model.StudentSemesterCourse;
import com.example.demo2.Model.User;
import com.example.demo2.Repository.GradeRepository;
import com.example.demo2.Repository.MajorRepository;
import com.example.demo2.Repository.SemesterRepository;
import com.example.demo2.Repository.StudentRepository;
import com.example.demo2.Service.GradeCalculatingService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
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
public class GradeAdminController {

    @Autowired
    private GradeRepository gradeRepository;
    @Autowired
    private MajorRepository majorRepository;
    @Autowired
    private SemesterRepository semesterRepository;
    @Autowired
    private GradeCalculatingService service;

    @RequestMapping(value = "/admin/admin-grades-list", method = RequestMethod.GET)
    public String getGradesList(
            @RequestParam(name = "s_sort", defaultValue = "0") int s_sort,
            @RequestParam(name = "g_sort", defaultValue = "none") String g_sort,
            @RequestParam(name = "m_sort", defaultValue = "0") int m_sort,
            Model model) {
        Map<StudentSemesterCourse, StudentAverageGrade> gradeMap = new HashMap<>();
        List<Grade> gradeList = gradeRepository.findAll();
        for (int i = 0; i < gradeList.size(); i++) {
            StudentSemesterCourse key
                    = new StudentSemesterCourse(gradeList.get(i).getStudent(),
                            gradeList.get(i).getSemester(), gradeList.get(i).getCourse());
            if (gradeMap.containsKey(key)) {
                continue;
            }
            float average = service.
                    AverageGradeStudentSemester(gradeList.get(i).getStudent_id(), gradeList.get(i).getSemester_id());
            if (s_sort == 0 && m_sort == 0) {
                gradeMap.put(key,
                        new StudentAverageGrade(gradeList.get(i).getStudent(),
                                gradeList.get(i).getSemester(), average));
            } else if (s_sort != 0 && m_sort == 0) {
                if (gradeList.get(i).getSemester().getId() == s_sort) {
                    gradeMap.put(key,
                            new StudentAverageGrade(gradeList.get(i).getStudent(),
                                    gradeList.get(i).getSemester(), average));
                }
            } else if (s_sort == 0 && m_sort != 0) {
                if (gradeList.get(i).getStudent().getCurriculum().getDept().getMajor().getId() == m_sort) {
                    gradeMap.put(key,
                            new StudentAverageGrade(gradeList.get(i).getStudent(),
                                    gradeList.get(i).getSemester(), average));
                }
            } else {
                if (gradeList.get(i).getStudent().getCurriculum().getDept().getMajor().getId() == m_sort
                        && gradeList.get(i).getSemester().getId() == s_sort) {
                    gradeMap.put(key,
                            new StudentAverageGrade(gradeList.get(i).getStudent(),
                                    gradeList.get(i).getSemester(), average));
                }
            }
        }

        if (g_sort.equalsIgnoreCase("none")) {
            model.addAttribute("list", gradeMap);
        } else {
            List<Map.Entry<StudentSemesterCourse, StudentAverageGrade>> sortedList = new ArrayList<>(gradeMap.entrySet());
            Collections.sort(sortedList, new Comparator<Map.Entry<StudentSemesterCourse, StudentAverageGrade>>() {
                @Override
                public int compare(Map.Entry<StudentSemesterCourse, StudentAverageGrade> o1, Map.Entry<StudentSemesterCourse, StudentAverageGrade> o2) {
                    int compareResult = Float.compare(o2.getValue().getAverageGrade(), o1.getValue().getAverageGrade());
                    if (g_sort.equalsIgnoreCase("asc")) {
                        return -compareResult;
                    } else if (g_sort.equalsIgnoreCase("desc")) {
                        return compareResult;
                    }
                    return 0;
                }
            });
            Map<StudentSemesterCourse, StudentAverageGrade> sortedMap = new LinkedHashMap<>();
            for (Map.Entry<StudentSemesterCourse, StudentAverageGrade> entry : sortedList) {
                sortedMap.put(entry.getKey(), entry.getValue());
            }
            model.addAttribute("list", sortedMap);
        }

        model.addAttribute("s_sort", s_sort);
        model.addAttribute("g_sort", g_sort);
        model.addAttribute("m_sort", m_sort);
        model.addAttribute("semesters", semesterRepository.findAll());
        model.addAttribute("majors", majorRepository.findAll());

        return "admin-grades-list";
    }

    @RequestMapping(value = "/admin/admin-grades-list/student", method = RequestMethod.GET)
    public String getStudentGradesList() {
        return "admin-student-grades-list";
    }
}
