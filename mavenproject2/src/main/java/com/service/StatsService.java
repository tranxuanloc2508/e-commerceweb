/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.Product;
import com.pojos.User;
import java.util.Date;
import java.util.List;

/**
 *

 * @author LocNe
 */
public interface StatsService {
      List<Object[]> cateStats();
       List<Object[]> userStats();
       List<Object[]> productStats(String kw, Date fromDate, Date toDate);
       List<Object[]> listProduct();
}
