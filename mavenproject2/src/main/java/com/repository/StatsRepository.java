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
 * @author QUYENNGUYEN
 */
public interface StatsRepository {
     List<Object[]> cateStats();
      List<Object[]> productStats(String kw, Date begin, Date end);
      List<Object[]> listProduct(int id);
}
