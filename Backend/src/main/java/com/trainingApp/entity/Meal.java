package com.trainingApp.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="meal")
public class Meal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "kcal")
    private Integer kcal;

    @Column(name = "protein")
    private Integer protein;

    @Column(name = "carbohydrates")
    private Integer carbohydrates;

    @Column(name = "fat")
    private Integer fat;


    public Meal() {
    }


}
