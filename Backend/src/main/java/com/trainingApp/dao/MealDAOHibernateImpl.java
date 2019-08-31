package com.trainingApp.dao;

import com.trainingApp.entity.Meal;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class MealDAOHibernateImpl implements MealDAO {

    private EntityManager entityManager;

    @Autowired
    public MealDAOHibernateImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public List<Meal> findAll() {

        Session currentSession = entityManager.unwrap(Session.class);

        Query<Meal> theQuery =
                currentSession.createQuery("from Meal", Meal.class);

        List<Meal> meals = theQuery.getResultList();

        return meals;

    }

    @Override
    public Meal findById(int theId) {
        Session currentSession = entityManager.unwrap(Session.class);
        Meal meal = currentSession.get(Meal.class, theId);
        return meal;
    }

    @Override
    public void save(Meal theMeal) {
        Session currentSession = entityManager.unwrap(Session.class);
        currentSession.saveOrUpdate(theMeal);
    }

    @Override
    public void deleteById(int theId) {
        Session currentSession = entityManager.unwrap(Session.class);
        Query query = currentSession.createQuery(
                "delete from Meal where id=:mealId");
        query.setParameter("mealId", theId);
        query.executeUpdate();
    }

}
