/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Cart;
import com.pojos.Category;
import com.service.CategoryService;
import com.service.ProductService;
import com.service.UserService;
import com.utils.utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author LocNe
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

    @ModelAttribute
    public void commonAttr(Model model, HttpSession session, @RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("cartCounter", utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
        model.addAttribute("users", this.userService.getUser(kw));
    }

    @RequestMapping("/")/// HTTP GET
    public String index(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        String kw = params.getOrDefault("kw", null);
        int page = Integer.parseInt(params.getOrDefault("page", "1"));// getOrdefault neu co lay ko co de mac dinh
        String cateId = params.get("CateId");
        if (cateId == null) {
            model.addAttribute("products", this.productService.getProducts(kw, page));
            model.addAttribute("counter", this.productService.countProduct());

        } else {
            Category c =this.categoryService.getCategoryById(Integer.parseInt(cateId));
            model.addAttribute("products", c.getProductCollection());
        }

        //        model.addAttribute("users", this.userService.getUser(userID));
        return "index";// timf gía trị đầu tiên tên này

//        
    }

    @RequestMapping(path = "/cart")
    public String testRedirect(Model model) {
        return "cart";
    }
     @RequestMapping(path = "/category")
    public String Category(Model model) {
        return "category";
    }

    @ModelAttribute // đính kèm all các trang trên web
    public void addAttribute(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("users", this.userService.getUser(""));

    }    
}
