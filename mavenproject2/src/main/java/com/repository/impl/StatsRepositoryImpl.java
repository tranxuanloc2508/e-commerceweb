/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Category;
import com.pojos.Order;
import com.pojos.OrderDetail;
import com.pojos.Product;
import com.pojos.User;
import com.repository.StatsRepository;
import com.repository.UserRepository;
import com.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author QUYENNGUYEN
 */
@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository{

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
     @Autowired
    private UserService userService;
      @Autowired
    private UserRepository userRepository;
    @Override
    public List<Object[]> cateStats() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootP = query.from(Product.class); 
        Root rootC = query.from(Category.class); 
        
        query.where(builder.equal(rootP.get("category"), rootC.get("id")));
        query.multiselect(rootC.get("id"),rootC.get("name"),builder.count(rootP.get("id")));
        query.groupBy(rootC.get("id"));
        
        Query q = session.createQuery(query);
        
        return q.getResultList();
        
    }

    @Override
    public List<Object[]> productStats(String kw, Date begin, Date end) {
         Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootP = query.from(Product.class); 
        Root rootO = query.from(Order.class); 
        Root rootD = query.from(OrderDetail.class); 
        
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootD.get("product"), rootP.get("id")));
        predicates.add(builder.equal(rootD.get("order"), rootO.get("id")));
        
        query.multiselect(rootP.get("id"),rootP.get("name"),
                builder.sum(builder.prod(rootD.get("unitPrice"), rootD.get("num"))));
        
        if(kw != null && !kw.isEmpty())
            predicates.add(builder.like(rootP.get("name"), kw));
        if(begin != null)
            predicates.add(builder.greaterThanOrEqualTo(rootO.get("createdDate"), begin));
       if(end != null)
            predicates.add(builder.lessThanOrEqualTo(rootO.get("createdDate"), end));
        
       query.where(predicates.toArray(new Predicate[]{}));
       
       query.groupBy(rootP.get("id"));
       
       Query q = session.createQuery(query);
       
      return q.getResultList();
    }

    @Override
    public List<Object[]> listProduct() {
         Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootP = query.from(Product.class); 
        Root rootU = query.from(User.class); 
      
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
            User user = userService.getUserById(2);
            
            
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootP.get("user"), userRepository.getUserById(2)));
//        predicates.add(builder.equal(rootP.get("user"), user ));  
         query.multiselect(rootP.get("id"),rootP.get("name"),rootP.get("price")); 
         query.where(predicates.toArray(new Predicate[]{}));
       
        Query q = session.createQuery(query);

        return q.getResultList();       
       }
    
}
