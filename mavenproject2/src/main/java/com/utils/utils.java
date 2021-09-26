/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utils;

import com.pojos.Cart;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LocNe
 */
public class utils {
        public static int countCart(Map<Integer,Cart> cart){
        int count = 0;
        if(cart != null){

            for(Cart c: cart.values())
                count += c.getCount();
        }
        return count;
        }
        public  static Map<String, String> cartStats(Map<Integer,Cart> cart){
           Long sum = 0l;
           int count = 0;
            if(cart != null){           
                for(Cart c: cart.values()){  
                     count += c.getCount();
                     sum +=  c.getCount()* c.getPrice();
                } 
            }

            Map<String, String> kq = new HashMap<>();
            kq.put("count", String.valueOf(count));
            kq.put("amount", String.valueOf(sum));
            return kq;
    }
}
