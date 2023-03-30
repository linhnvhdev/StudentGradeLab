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
 * @author linhnvhdev
 */
@Entity
@IdClass(CourseGradeType_Id.class)
public class CourseGradeType {
    @Id
    private int course_id;
    @Id
    private String grade_type;
    
    private float failScore;
    
    private float weight;

    @ManyToOne
    @JoinColumn(name = "course_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Course course;
    
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

    public float getFailScore() {
        return failScore;
    }

    public void setFailScore(float failScore) {
        this.failScore = failScore;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
    
}
