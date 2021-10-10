/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Cart;
import com.pojos.Order;
import com.pojos.OrderDetail;
import static com.pojos.Order_.id;
import com.pojos.User;
import com.repository.OrderRepository;
import com.repository.ProductRepository;
import com.repository.UserRepository;
import com.service.UserService;
import com.utils.utils;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author QUYENNGUYEN
 */
@Repository

public class OrderRepositoryImpl implements OrderRepository{

    @Autowired
    private UserService userService;

     @Autowired
    private ProductRepository productRepository;
    
     @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<Integer, Cart> cart) {
        Session  s = this.sessionFactory.getObject().getCurrentSession();
        try {
            Order d = new Order();
        d.setCreatedDate(new Date());
        
        Map<String ,String> stats = utils.cartStats(cart);
        d.setAmount(Long.parseLong( stats.get("amount")));    
          // thiiet lap usder id nguoi mua
           String username = SecurityContextHolder.getContext().getAuthentication().getName();
            User user = userService.getUserByUsername(username);
            d.setUser(user);
            s.save(d);
            //System.out.println(d.getUser().getId());
        
        for(Cart c: cart.values()){
            OrderDetail od = new OrderDetail();
             od.setOrder(d);
             od.setProduct(this.productRepository.getProductByID(c.getProductId()));
             od.setUnitPrice(c.getPrice());
             od.setNum(String.valueOf(c.getCount()));
             
             s.save(od);
        }
        return true;
        } catch (HibernateException e) {
            System.out.print("findUserId->id: " + id);
            throw e;
        }
    }
    
}
