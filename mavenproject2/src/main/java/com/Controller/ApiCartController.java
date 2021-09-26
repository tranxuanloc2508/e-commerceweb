/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Cart;
import com.pojos.Product;
import com.service.OrderService;
import com.service.ProductService;
import com.utils.utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PUT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LocNe
 */
@RestController
public class ApiCartController {
    @Autowired
    private ProductService productService;
    @Autowired 
    private OrderService orderService;

    @GetMapping("/api/products")
    public ResponseEntity<List<Product>> listProduct() {
        List<Product> products = this.productService.getProducts("",1);
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
            c.setImage(p.getImage());
            c.setName(p.getName());
            c.setPrice(p.getPrice());
            c.setCount(1);
            
            cart.put(productId, c); // sau khi tnag reset
        }
        
        session.setAttribute("cart", cart);
        
        return new ResponseEntity<>(utils.countCart(cart),HttpStatus.OK);
//        System.out.println("=== CART ===" + Utils.countCart(cart));
    }
    @PutMapping("/api/cart")
    
    public ResponseEntity< Map<String, String>> updateCart(@RequestBody Cart carts, HttpSession session){
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if(cart == null)
            cart = new HashMap<>();
        
        int productId = carts.getProductId();
        if(cart.containsKey(productId) == true){
            Cart c = cart.get(productId);
            c.setCount(carts.getCount());
            
            session.setAttribute("cart", cart);
            
        }
          return new ResponseEntity<>(utils.cartStats(cart),HttpStatus.OK);
        
    }
    @DeleteMapping("/api/cart/{productId}")
    public ResponseEntity< Map<String, String>> deleteCartItem(@PathVariable(value = "productId") int productId, HttpSession session){
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if(cart != null && cart.containsKey(productId)){
            cart.remove(productId);
            
            session.setAttribute("cart", cart);
                      
        }
         return new ResponseEntity<>(utils.cartStats(cart),HttpStatus.OK);
    }
    @PostMapping(value = "/api/pay")
//    @ResponseStatus(value = HttpStatus.OK)
    public HttpStatus payCart(HttpSession session) {   
//        Map<Integer, Cart> carts 
//                = (Map<Integer, Cart>) session.getAttribute("cart");
        if(orderService.addReceipt((Map<Integer, Cart>) session.getAttribute("cart"))){
            session.removeAttribute("cart");
            return HttpStatus.OK;}
        else{return HttpStatus.BAD_REQUEST;}
        
       
    }
}
 
