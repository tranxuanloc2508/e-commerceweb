/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Cart;
import com.utils.utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author LocNe
 */
@Controller
public class CartController {
    
     @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("carts", cart.values());
        } else {
            model.addAttribute("carts", null);
        }
        
         model.addAttribute("cartStats", utils.cartStats(cart));
        return "cart";  
    }
        
//    @GetMapping(value = "/cart")
//    public String cart(Model model, HttpSession session) {
//        if (session.getAttribute("cart") != null) {
//            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("cart");
//
//            BigDecimal sum = new BigDecimal(0);
//            
//            for (Cart c: carts.values())
//                sum = sum.add(c.getProduct()
//                               .getPrice()
//                               .multiply(new BigDecimal(c.getNum())));
//
//            model.addAttribute("carts", carts.values());
//            model.addAttribute("sum", sum);
//        }
//
//        return "cart";
//    }
}
