/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.example.demo2.DAO;
import com.example.demo2.Model.*;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author linhnvhdev
 */
@Repository
public interface CourseGradeTypeRepository extends JpaRepository<CourseGradeType, CourseGradeType_Id> 
{
    List<CourseGradeType> findByCourse_id(int id);
}
