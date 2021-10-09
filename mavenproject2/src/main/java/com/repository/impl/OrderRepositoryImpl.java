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

public class OrderRepositoryImpl implements OrderRepository{

    @Autowired
<<<<<<< HEAD
    private UserService userService;
=======
    private UserService userRepository;
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
     @Autowired
    private ProductRepository productRepository;
    
     @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<Integer, Cart> cart) {
        Session  s = this.sessionFactory.getObject().getCurrentSession();
<<<<<<< HEAD
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
=======
        Map<String ,String> stats = utils.cartStats(cart);
        int id = this.userRepository.getUserById(2).getId();
//         String username = SecurityContextHolder.getContext().getAuthentication().getName();
//         User user = userRepository.getUserByUsername(username);
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
        
        try {
            Order d = new Order();
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
         User user = userRepository.getUserByUsername(username);
            User u  = this.userRepository.getUserById(2);
            //System.out.println(u.getId());
            //System.out.println(u.getUsername());
            d.setAmount(Long.parseLong( stats.get("amount")));    
            // thiiet lap usder id nguoi mua
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
