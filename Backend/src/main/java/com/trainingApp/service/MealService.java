package com.trainingApp.service;

import com.trainingApp.entity.Meal;

import java.util.List;

public interface MealService {

    List<Meal> findAll();

    Meal findById(int theId);

    void save(Meal theMeal);

    void deleteById(int theId);

}
