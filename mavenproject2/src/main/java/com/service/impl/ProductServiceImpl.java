/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pojos.Product;
import com.pojos.User;
import com.repository.ProductRepository;
import com.repository.UserRepository;
import com.service.ProductService;
import com.service.UserService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LocNe
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UserService userRepository;

    @Override
    public List<Product> getProducts(String kw, int page) {
        return this.productRepository.getProducts(kw, page);
    }

    @Override
    
    public boolean addOrUpdate(Product product) {

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getUserByUsername(username);
        product.setUser(user);
        try {
            Map r = this.cloudinary.uploader().upload(product.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            String image = (String) r.get("secure_url");
            product.setImage(image);            
            productRepository.addOrUpdate(product);
            return this.productRepository.addOrUpdate(product);

        } catch (IOException ex) {
            System.err.println("===ADD PRODUCT===" + ex.getMessage());
        }
        return false;
    }

    @Override
    public long countProduct() {
        return this.productRepository.countProduct();
    }

    @Override
    public Product getProductByID(int i) {
        return this.productRepository.getProductByID(i);

    }

    @Override
    public User getUserByID(int userId) {
        return this.userRepository.getUserById(userId);
    }

    @Override
  
    public boolean updateProduct(Product p) {
          
        try {
            if (p.getId()> 0){
                if (p.getFile().getBytes().length == 0) {
                    Product a = this.productRepository.getProductByID(p.getId());
                    p.setImage(a.getImage());
                }else{
                    Map m = this.cloudinary.uploader().upload(p.getFile().getBytes(),
                            ObjectUtils.asMap("resource_type", "auto"));

                p.setImage((String) m.get("secure_url"));
                
            } 
            productRepository.updateProduct(p);
            }
        return this.productRepository.updateProduct(p);
        } catch (IOException ex) {
            System.err.println("Đã bị lỗi!!!");
        }   
        return false;
}

    @Override
    public boolean deleteProduct(Product product) {
        return this.productRepository.deleteProduct(product);
    }
}
