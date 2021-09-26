/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.pojos.Cart;
import com.repository.OrderRepository;
import com.service.OrderService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author QUYENNGUYEN
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired 
    private OrderRepository orderRepository;
    @Override
    public boolean addReceipt(Map<Integer, Cart> cart) {
        if(cart != null)
            return this.orderRepository.addReceipt(cart); //To change body of generated methods, choose Tools | Templates.
        
        return false;
    }
    
}
