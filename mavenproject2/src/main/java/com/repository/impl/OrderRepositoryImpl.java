/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Cart;
import com.pojos.Order;
import com.pojos.OrderDetail;
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
@Transactional(propagation = Propagation.REQUIRED)
public class OrderRepositoryImpl implements OrderRepository{

    @Autowired
    private UserService userService;
     @Autowired
    private ProductRepository productRepository;
    
     @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addReceipt(Map<Integer, Cart> cart) {
        Session  s = this.sessionFactory.getObject().getCurrentSession();
        try {
            Order d = new Order();
//            User u  = this.userRepository.getUserById(6);
//           String id = String.valueOf(u.getId());   
        d.setCreatedDate(new Date());
        
        Map<String ,String> stats = utils.cartStats(cart);
        d.setAmount(Long.parseLong( stats.get("amount")));    
          // thiiet lap usder id nguoi mua
           String username = SecurityContextHolder.getContext().getAuthentication().getName();
            User user = userService.getUserByUsername(username);
        d.setUser(user);
        
        s.save(d);
        
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
            e.printStackTrace();
        }
        return false;
    }
    
}
