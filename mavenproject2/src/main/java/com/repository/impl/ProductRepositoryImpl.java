/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Product;
import com.repository.ProductRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Product> getProducts(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root root = query.from(Product.class);
        query = query.select(root);/// cac buoc tao truyvan

        if (!kw.isEmpty() && kw != null) {

            Predicate p = builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Product product) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(product);

            return true;
        } catch (Exception ex) {
            System.err.println("=== ADD PRODUCT ERRER ===" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public long countProduct() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query  q = session.createQuery("select count(*) from Product");  
        return Long.parseLong(q.getSingleResult().toString());//
 }

    @Override
    public Product getProductByID(int id) {
       
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Product.class, id);
    }

}
