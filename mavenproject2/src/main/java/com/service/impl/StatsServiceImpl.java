/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.repository.StatsReponsitory;
import com.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LocNe
 */
@Service
public class StatsServiceImpl implements StatsService{
    @Autowired
    private StatsReponsitory statsReponsitory;
    @Override
    public List<Object[]> cateStats() {
        return this.statsReponsitory.cateStats();
    }

    @Override
    public List<Object[]> productStats(String kw, Date fromDate, Date toDate) {
         return this.statsReponsitory.productStats(kw, fromDate, toDate);
    }

    @Override
    public List<Object[]> userStats() {
        return this.statsReponsitory.User();
    }

    @Override
    public List<Object[]> listProduct() {
        return this.statsReponsitory.listProduct();
    }
    
}