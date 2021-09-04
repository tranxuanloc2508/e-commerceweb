/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Product;
import com.service.ProductService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author LocNe
 */
@Controller
public class ProductController {
      @Autowired
    private ProductService productService;

//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        binder.setValidator(productValidator);
//    }

    @GetMapping("/admin/products")
    public String list(Model model) {
        model.addAttribute("product", new Product());
        return "product";
    }

    @PostMapping("/admin/products")
    public String add(Model model, @ModelAttribute(value = "product")
                @Valid Product product, BindingResult result) {
        if (!result.hasErrors()) {
            if (this.productService.addOrUpdate(product) == true) {
                return "redirect:/"; // nếu đúng về trang chủ   
            } else {
                model.addAttribute("errMsg", "Someting wrong!!!");
            }
        }
        return "product"; // sai vè product
    }
}
