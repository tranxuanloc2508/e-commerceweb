/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.User;
import com.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author NGUYEN_NGUYEN
 */

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public boolean addUser(User user) {
            Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(user);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
      return false;
    }

    @Override
    public List<User> getUser(String username) {
         Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root r = query.from(User.class);
        query = query.select(r);
        
        if(!username.isEmpty()){
            Predicate q = builder.equal(r.get("username").as(String.class), username.trim());
            query = query.where(q);
            
        }
        
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public User getUserById(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        return s.get(User.class, id);
    }

 
    
}
