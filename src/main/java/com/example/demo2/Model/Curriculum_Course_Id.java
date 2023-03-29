/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2.Model;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author loidinhcap
 */
public class Curriculum_Course_Id implements Serializable{
    private int curriculum_id;
    private int course_id;

    public int getCurriculum_id() {
        return curriculum_id;
    }

    public void setCurriculum_id(int curriculum_id) {
        this.curriculum_id = curriculum_id;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Curriculum_Course_Id)) return false;
        Curriculum_Course_Id that = (Curriculum_Course_Id) o;
        return Objects.equals(curriculum_id, that.curriculum_id) &&
                Objects.equals(course_id, that.course_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(curriculum_id, course_id);
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
    
}
