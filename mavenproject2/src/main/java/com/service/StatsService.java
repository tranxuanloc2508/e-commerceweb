/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

<<<<<<< HEAD
import com.pojos.Product;
import com.pojos.User;
=======
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
import java.util.Date;
import java.util.List;

/**
 *
<<<<<<< HEAD
 * @author QUYENNGUYEN
 */
public interface StatsService {
     List<Object[]> cateStats();
      List<Object[]> productStats(String kw, Date begin, Date end);
      List<Object[]> listProduct();
=======
 * @author LocNe
 */
public interface StatsService {
      List<Object[]> cateStats();
       List<Object[]> userStats();
       List<Object[]> productStats(String kw, Date fromDate, Date toDate);
       List<Object[]> listProduct();
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
}
