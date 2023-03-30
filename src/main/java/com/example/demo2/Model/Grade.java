/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author loidinhcap
 */
@Entity
@IdClass(Grade_Id.class)
public class Grade {
    @Id
    private int student_id;
    
    @Id
    private int semester_id;
    
    @Id
    private int course_id;
    
    @Id
    private String grade_type;
    
    @ManyToOne
    @JoinColumn(name = "student_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Student student;
    
    @ManyToOne
    @JoinColumn(name = "semester_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Semester semester;
    
    @ManyToOne
    @JoinColumn(name = "course_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Course course;
    
    private float value;

    public Grade() {
    }
    
    

    public Grade(int student_id, int semester_id, int course_id, String grade_type, float value) {
        this.student_id = student_id;
        this.semester_id = semester_id;
        this.course_id = course_id;
        this.grade_type = grade_type;
        this.value = value;
    }

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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public String getGrade_type() {
        return grade_type;
    }

    public void setGrade_type(String grade_type) {
        this.grade_type = grade_type;
    }
}
