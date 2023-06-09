/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.example.demo2.Repository;

import com.example.demo2.Model.Grade;
import com.example.demo2.Model.LearnGroup;
import com.example.demo2.Model.Lecturer;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author linhnvhdev
 */
@Repository
public interface GroupGradeRepository extends JpaRepository<LearnGroup, Integer> {
    List<LearnGroup> findByLecturer(Lecturer lecturer);
}
