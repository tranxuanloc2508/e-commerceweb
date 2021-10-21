/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Comment;
import com.pojos.Product;
import com.pojos.User;
import com.repository.CommentRepository;
import com.repository.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
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
public class CommentRepositoryImpl  implements CommentRepository{
    @Autowired
       private LocalSessionFactoryBean sessionFactory;

     @Autowired
    private ProductRepository productRepository;
    @Override
    public  List<Comment> getCommentByProductId(int id) {
        Session  session = this.sessionFactory.getObject().getCurrentSession();
  
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root);/// cac buoc tao truyvan       
            Predicate p = builder.equal(root.get("productId"),productRepository.getProductByID(id).getId());
            query = query.where(p);
        
        query = query.orderBy(builder.desc(root.get("createdDate")));
        Query q = session.createQuery(query);
        return q.getResultList();
        
    }

    @Override
    public Comment addComment(Comment c) {
      Session  session = this.sessionFactory.getObject().getCurrentSession();
      try{
          session.save(c);

          return c;
    }catch(HibernateException ex){
        ex.printStackTrace();
    }
    return null;
    }
}
