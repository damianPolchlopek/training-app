package com.trainingApp.dao;

import com.trainingApp.entity.Meal;

import java.util.List;

public interface MealDAO {

    List<Meal> findAll();

    Meal findById(int theId);

    void save(Meal theMeal);

    void deleteById(int theId);

}
