package com.trainingApp.dao;

import com.trainingApp.entity.Meal;

import java.util.List;

public interface MealDAO {

    public List<Meal> findAll();

    public Meal findById(int theId);

    public void save(Meal theMeal);

    public void deleteById(int theId);

}
