/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.User;
import com.service.UserService;
import com.validator.UserValidator;
import com.validator.WebAppValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }
    @GetMapping("/login")
    public String login(Model model){
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
    
}
