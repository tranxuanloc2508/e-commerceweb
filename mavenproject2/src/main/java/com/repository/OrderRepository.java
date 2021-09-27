/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository;

import com.pojos.Cart;
import java.util.Map;

/**
 *
 * @author LocNe
 */
public interface OrderRepository {
    boolean addReceipt(Map<Integer,Cart> cart);
}
