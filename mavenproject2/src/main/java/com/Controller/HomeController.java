/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.service.CategoryService;
import com.service.ProductService;
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

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
//        model.addAttribute("cartCounter",Utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
    }

    @RequestMapping("/")/// HTTP GET
    public String index(Model model, @RequestParam(value = "kw", required = false, defaultValue = "") String kw) {
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));// getOrdefault neu co lay ko co de mac dinh

        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("products", this.productService.getProducts(kw));

        return "index";// timf gía trị đầu tiên tên này
    }

//    @RequestMapping(path = "/")
//    public String home() {
//        return "index";
//    }
//    @ModelAttribute // đính kèm all các trang trên web
//    public void addAttribute(Model model) {
//        model.addAttribute("categories", this.categoryService.getCategories());
//
//    }
}
