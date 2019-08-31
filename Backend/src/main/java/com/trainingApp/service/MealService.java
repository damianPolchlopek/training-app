package com.trainingApp.service;

import com.trainingApp.entity.Meal;

import java.util.List;

public interface MealService {

    public List<Meal> findAll();

    public Meal findById(int theId);

    public void save(Meal theMeal);

    public void deleteById(int theId);

}
