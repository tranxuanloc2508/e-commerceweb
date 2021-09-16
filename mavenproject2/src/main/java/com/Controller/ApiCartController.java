/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Cart;
import com.pojos.Product;
import com.service.ProductService;
import com.utils.utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LocNe
 */
@RestController
@RequestMapping(value = "/api/cart")
public class ApiCartController {
    @Autowired
    private ProductService productService;

    @GetMapping("/api/products")
    public ResponseEntity<List<Product>> listProduct() {
        List<Product> products = this.productService.getProducts("");
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @GetMapping("/api/cart/{productId}")
    public ResponseEntity<Integer> cart(@PathVariable(value = "productId") Integer productId,
            HttpSession session) {
        Map<Integer,Cart> cart = (Map<Integer,Cart>) session.getAttribute("cart");

        if(cart == null)
            cart = new HashMap<>();
        if(cart.containsKey(productId)==true){
            //san pham da co trong gio
            Cart c = cart.get(productId);
            c.setCount(c.getCount()+1);
        }
        else{
            // san pham chua co trong gio
                    Product p = this.productService.getProductByID(productId);

            Cart c = new Cart();
            c.setProductId(p.getId());
            c.setName(p.getName());
            c.setPrice(p.getPrice());
            c.setCount(1);
            cart.put(productId, c); // sau khi tnag reset
        }
        
        session.setAttribute("cart", cart);
        
        return new ResponseEntity<>(utils.countCart(cart),HttpStatus.OK);
//        System.out.println("=== CART ===" + Utils.countCart(cart));
    }
//    @PostMapping(value = "/pay")
//    @ResponseStatus(value = HttpStatus.OK)
//    public void payCart(HttpSession session) {   
//        Map<Integer, Cart> carts 
//                = (Map<Integer, Cart>) session.getAttribute("cart");
//        orderService.addOrder(carts.values());
//        
//        session.removeAttribute("cart");
//    }
}
 
