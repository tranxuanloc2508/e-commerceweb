/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.service.StatsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author LocNe
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StatsService statsService;

    @GetMapping("/category-stats")
    public String catStats(Model model) {

        model.addAttribute("cateStats", this.statsService.cateStats());
        return "category-state";
    }
    
     @GetMapping("/user-stats")
    public String userStats(Model model) {

        model.addAttribute("userStats", this.statsService.userStats());
        return "user-stats";
    }
    
    @GetMapping("/product-stats")
    public String productStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);

        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);

            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);

            if (to != null) {
                toDate = f.parse(to);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        
        model.addAttribute("productStats", this.statsService.productStats(kw, fromDate, toDate));
//        model.addAttribute("listBestProduct",this.statsService.listBestProduct( fromDate, toDate));
   
        return "product-stats";
    }
    
    @GetMapping("/product-month-stats")
    public String productMonthStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);

        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);

            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);

            if (to != null) {
                toDate = f.parse(to);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        model.addAttribute("productMonthStats",this.statsService.productMonthStats(kw, fromDate, toDate));
        return "product-month-stats";
    }
    @GetMapping("/product-best-stats")
    public String productBestStats(Model model, @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");      

        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);

            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);

            if (to != null) {
                toDate = f.parse(to);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        model.addAttribute("listBestProduct",this.statsService.listBestProduct( fromDate, toDate));
   
        return "product-best-sale";
    }
     @GetMapping("/listproduct")
    public String listproductStats(Model model) {
        model.addAttribute("listproductStats", this.statsService.listProduct());
        return "listproduct";
    }
    
}
