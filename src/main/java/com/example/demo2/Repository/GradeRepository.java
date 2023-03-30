/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.example.demo2.Repository;

import com.example.demo2.Model.Grade;
import com.example.demo2.Model.Grade_Id;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author linhnvhdev
 */
@Repository
public interface GradeRepository extends JpaRepository<Grade, Grade_Id> {
    List<Grade> findByStudent_id(int id);
}
