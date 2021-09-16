/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Product;
import com.pojos.User;
import com.service.ProductService;
import com.service.UserService;
import com.validator.WebAppValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author LocNe
 */
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private WebAppValidator productValidator;
    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(productValidator);
    }

    @GetMapping("/admin/products")
    public String list(Model model) {
        model.addAttribute("product", new Product());
        return "product";
    }

    @PostMapping("/admin/products")
    public String add(Model model, @ModelAttribute(value = "product")
            @Valid Product product, @Valid User user, BindingResult result) {
       if (!result.hasErrors()) {
           if (this.productService.addOrUpdate(product)==true) {
               
               return "redirect:/"; // nếu đúng về trang chủ   
           } else {
               model.addAttribute("errMsg", "Someting wrong!!!");
           }
       }
       return "product"; // sai vè product
   }
        
//        if (result.hasErrors()) {
//            return "product";
//        }
//
//        if (!this.productService.addOrUpdate(product)) {
//            model.addAttribute("errMsg", "Hệ thóng đang có lỗi! Vui lòng quay lại sau!");
//            return "product";
//        }
//
//        return "redirect:/";
    

    @GetMapping(value = "/products/{product_id}")
    public ModelAndView detail(@PathVariable(value = "product_id") int productId) {
        ModelAndView view = new ModelAndView();
        view.setViewName("detail");
        view.addObject("product", productService.getProductByID(productId));
        
        return view;
    }

}
