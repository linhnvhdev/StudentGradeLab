/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.example.demo2.DAO;

import com.example.demo2.Model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author linhnvhdev
 */
public interface CourseRepository extends JpaRepository<Course, Integer> {
    
}
