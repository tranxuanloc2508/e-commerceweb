/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

<<<<<<< HEAD
import com.pojos.Product;
import com.pojos.User;
import com.repository.StatsRepository;
=======
import com.repository.StatsReponsitory;
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
import com.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
<<<<<<< HEAD
 * @author QUYENNGUYEN
=======
 * @author LocNe
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
 */
@Service
public class StatsServiceImpl implements StatsService{
    @Autowired
<<<<<<< HEAD
    private StatsRepository statsRepository;
    @Override
    public List<Object[]> cateStats() {
        return this.statsRepository.cateStats();
    }

    @Override
    public List<Object[]> productStats(String kw, Date begin, Date end) {
        return this.statsRepository.productStats(kw, begin, end);
=======
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
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
    }

    @Override
    public List<Object[]> listProduct() {
<<<<<<< HEAD
    return this.statsRepository.listProduct();
=======
        return this.statsReponsitory.listProduct();
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
    }
    
}
