/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Model;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author linhnvhdev
 */
public class CourseGradeType_Id implements Serializable {

    private int course_id;

    private String grade_type;

    public int getCourseId() {
        return course_id;
    }

    public void setCourseId(int courseId) {
        this.course_id = courseId;
    }

    public String getGrade_type() {
        return grade_type;
    }

    public void setGrade_type(String grade_type) {
        this.grade_type = grade_type;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CourseGradeType_Id)) return false;
        Curriculum_Course_Id that = (Curriculum_Course_Id) o;
        return Objects.equals(course_id, that.getCourse_id()) &&
                Objects.equals(grade_type, that.getCurriculum_id());
    }

    @Override
    public int hashCode() {
        return Objects.hash(course_id, grade_type);
    }
}
