/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository;

import java.util.Date;
import java.util.List;

/**
 *
 * @author LocNe
 */
public interface StatsReponsitory {

    List<Object[]> cateStats();
     List<Object[]> User();
    List<Object[]> productStats(String kw, Date fromDate, Date toDate);
    
    //USER STATS
     List<Object[]> listProduct();
     List<Object[]> listSaleUser();
//    List<Object[]> productMonthStats(String kw, Date fromDate, Date toDate);
}
