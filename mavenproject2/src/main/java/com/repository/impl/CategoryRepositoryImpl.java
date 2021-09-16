/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Category;
import com.pojos.Product;
import com.repository.CategoryRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LocNe
 */
@Repository
@Transactional
public class CategoryRepositoryImpl implements CategoryRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

  

    @Override
    public List<Category> getCategories(String kw) {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Category");
        return q.getResultList();
    }

    @Override
    public Category getCategoryById(int id) {
       Session s = sessionFactory.getObject().getCurrentSession();
       return s.get(Category.class,id);
    }

    @Override
    public List<Product> getProductsByCategory(int cateId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
