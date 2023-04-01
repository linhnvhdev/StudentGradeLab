/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Model;

import java.util.Objects;

/**
 *
 * @author quang
 */
public class StudentSemesterCourse {
    private Student student;
    private Semester semester;
    private Course course;

    public StudentSemesterCourse(Student student, Semester semester, Course course) {
        this.student = student;
        this.semester = semester;
        this.course = course;
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



    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }

        StudentSemesterCourse other = (StudentSemesterCourse) obj;
        return (this.course.getId() == other.course.getId()) 
                && (this.student.getId() == other.student.getId()) 
                && (this.semester.getId() == other.semester.getId());
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + Objects.hashCode(this.student);
        hash = 47 * hash + Objects.hashCode(this.semester);
        hash = 47 * hash + Objects.hashCode(this.course);
        return hash;
    }
    
}
