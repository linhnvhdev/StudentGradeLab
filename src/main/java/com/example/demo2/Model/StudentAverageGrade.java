/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Model;

/**
 *
 * @author quang
 */
public class StudentAverageGrade {
    private Student student;
    private Semester semester;
    private float averageGrade;

    public StudentAverageGrade(Student student, Semester semester, float averageGrade) {
        this.student = student;
        this.semester = semester;
        this.averageGrade = averageGrade;
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

    public float getAverageGrade() {
        return averageGrade;
    }

    public void setAverageGrade(float averageGrade) {
        this.averageGrade = averageGrade;
    }


    
}
