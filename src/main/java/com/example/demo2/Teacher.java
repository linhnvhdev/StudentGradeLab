/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.demo2;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author linhnvhdev
 */
//hello comment
@Entity
public class Teacher {
    @Id
    private String id;
    
    private String name;
    // Some fancy comment here
}
