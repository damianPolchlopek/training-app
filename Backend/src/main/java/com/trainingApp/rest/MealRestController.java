package com.trainingApp.rest;

import com.trainingApp.entity.Meal;
import com.trainingApp.service.MealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class MealRestController {

    private MealService mealService;

    @Autowired
    public MealRestController(MealService mealService) {
        this.mealService = mealService;
    }

    @GetMapping("/meals")
    public List<Meal> findAll(){
        return mealService.findAll();
    }

    @PostMapping("/meal")
    public Meal addMeal(@RequestBody Meal theMeal){
        theMeal.setId(0);
        mealService.save(theMeal);
        return theMeal;
    }

    @GetMapping("/meals/{mealId}")
    public Meal getMeal(@PathVariable int mealId){

        Meal theMeal = mealService.findById(mealId);
        if (theMeal == null) {
//            throw  new RuntimeException("Meal id not found - " + wordId);
        }

        return theMeal;
    }

    @PutMapping("/meals")
    public Meal updateMeal(@RequestBody Meal theMeal){
        mealService.save(theMeal);
        return theMeal;
    }

    @DeleteMapping("/meals/{mealId}")
    public String deleteMeal(@PathVariable int mealId){
        Meal tempMeal = mealService.findById(mealId);

        if (tempMeal == null) {
            throw new RuntimeException("This Meal do not exist in database id - " + mealId);
        }

        mealService.deleteById(mealId);

        return "Deleted meal id - " + mealId;
    }

}
