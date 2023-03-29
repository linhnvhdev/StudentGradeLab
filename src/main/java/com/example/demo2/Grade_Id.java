/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author loidinhcap
 */
public class Grade_Id implements Serializable{
    private int student_id;
    private int semester_id;
    private int course_id;
    private String grade_type;

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getSemester_id() {
        return semester_id;
    }

    public void setSemester_id(int semester_id) {
        this.semester_id = semester_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
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
        if (!(o instanceof Grade_Id)) return false;
        Grade_Id that = (Grade_Id) o;
        return Objects.equals(student_id, that.student_id) &&
                Objects.equals(course_id, that.course_id) &&
                Objects.equals(semester_id, that.semester_id) &&
                Objects.equals(grade_type, that.grade_type);
    }

    @Override
    public int hashCode() {
        return Objects.hash(student_id, semester_id, course_id,grade_type);
    }
}
