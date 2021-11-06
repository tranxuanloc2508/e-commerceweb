/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.pojos.Product;
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

    @Override
    public List<Object[]> listSaleUser() {
        return this.statsReponsitory.listSaleUser();   
    }

    @Override
    public List<Object[]> OrderStats() {
       return this.statsReponsitory.OrderStats();  
    }

    @Override
    public List<Product> listBestProduct(Date fromDate, Date toDate) {
        return this.statsReponsitory.listBestProduct(fromDate,toDate);
    }

    @Override
    public List<Object[]> productMonthStats(String kw, Date fromDate, Date toDate) {
       return this.statsReponsitory.productMonthStats(kw, fromDate, toDate);
    }

    @Override
    public List<Product> listBestProductOfUser() {
       return this.statsReponsitory.listBestProductOfUser();
    }
    
}