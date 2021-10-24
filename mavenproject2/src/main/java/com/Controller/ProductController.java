/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Product;
import com.pojos.User;
import com.service.CommentService;
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
    @Autowired
    private CommentService commentService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(productValidator);
    }

    @GetMapping("/user/add-products")
    public String list(Model model) {
        model.addAttribute("product", new Product());
        return "product";
    }

    @PostMapping("/user/add-products")
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

//    <-Detail product->
//    @GetMapping(value = "/products/{product_id}")
//    public ModelAndView detail(@PathVariable(value = "product_id") int productId) {
//        ModelAndView view = new ModelAndView();
//        view.setViewName("detail");
//        view.addObject("product", productService.getProductByID(productId));
//         view.addObject("comments",commentService.getCommentByProductId(productId));
//
//        return view;
//    }
      @GetMapping(value = "/products/{product_id}")
    public String detail(Model model,@PathVariable(value = "product_id") int productId) {
    
        model.addAttribute("product", productService.getProductByID(productId));
         model.addAttribute("comments",commentService.getCommentByProductId(productId));

        return "detail";
    }
    @GetMapping(value = "/user/product-stats/{product_id}")
    public String editProduct(Model model, @PathVariable(value = "product_id") int productId) {  
            Product u = this.productService.getProductByID(productId);
            model.addAttribute("product", u);
            return "edit-product";   
    }

    @PostMapping("/user/product-stats/{product_id}")
    public String edit(Model model, @ModelAttribute(value = "product_id") @Valid Product product, BindingResult result) {
        if (!result.hasErrors()) {
            this.productService.updateProduct(product);
//        model.addAttribute("product",product);
            return "redirect:/";
        } else {
            model.addAttribute("errMsg", "Có lỗi rồi!!!");
        }
        return "user";
    }
    @GetMapping("/user/remove/{product_id}")
    public String delete(Model model, @PathVariable(value = "product_id") int a) {
       
            Product u = this.productService.getProductByID(a);
            this.productService.deleteProduct(u);
//        model.addAttribute("product",product);
            return "redirect:/";
  
 
    }
}
