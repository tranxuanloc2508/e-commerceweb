/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.User;
import com.service.StatsService;
import com.service.UserService;
import com.validator.UserValidator;
import com.validator.WebAppValidator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.validation.Valid;
import javax.xml.crypto.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author NGUYEN_NGUYEN
 */
@Controller

public class UserController {
    
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private WebAppValidator userValidator;
    
    @Autowired
    private StatsService statsService;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }
    @GetMapping("/login")
    public String login(){
//       model.addAttribute(userDetailsService.getUserByUsername(username).getUsername(), username);
        return "login";
    }
    @GetMapping("/register")
    public String registerView(Model model){
        model.addAttribute("user",new User());
        return "register";
        
    }
    @PostMapping("/register")
    public String register (Model model,@ModelAttribute(value = "user") @Valid User user){
        String errMsg="";
        if(user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user)== true){
                return "redirect:/login";
            }
                
            else errMsg="Da xay ra loi!";
        }else
            errMsg ="mat khau khong dung";
        
        model.addAttribute("errMsg",errMsg);
        return "register";
    }
    @GetMapping("/user")
    public String loadState(Model model){
        model.addAttribute("statsList", this.statsService.cateStats());
        return "userLayout";
    }
    @GetMapping("/user/producttt-stats")
    public String productState(Model model,@RequestParam(required = false)Map<String, String> param) throws ParseException{
        String kw = param.getOrDefault("kw", null);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date begin = null;
        String f = param.getOrDefault("begin", null);
        if(f != null){
            begin = format.parse(f);
        }
         Date end = null;
        String to = param.getOrDefault("end", null);
        if(to != null){
           end = format.parse(to);
        }
        model.addAttribute("productStats", this.statsService.productStats(kw, begin, end));       
       
              
        return "product-stats";
        
    }
    @GetMapping("/user/product-stats")
    public String listState(Model model,@PathVariable Map<String, String> path){   
        model.addAttribute("listproductStats", this.statsService.listProduct());
        return "product-user-stats";
    }
    
    
}
