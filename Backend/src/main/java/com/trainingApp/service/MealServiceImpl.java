package com.trainingApp.service;

import com.trainingApp.dao.MealDAO;
import com.trainingApp.entity.Meal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MealServiceImpl implements MealService {

    private MealDAO wordDAO;

    @Autowired
    public MealServiceImpl(MealDAO wordDAO) {
        this.wordDAO = wordDAO;
    }

    @Override
    @Transactional
    public List<Meal> findAll() {
        return wordDAO.findAll();
    }

    @Override
    @Transactional
    public Meal findById(int theId) {
        return wordDAO.findById(theId);
    }

    @Override
    @Transactional
    public void save(Meal theMeal) {
        wordDAO.save(theMeal);
    }

    @Override
    @Transactional
    public void deleteById(int theId) {
        wordDAO.deleteById(theId);
    }

}
