/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pojos.Product;
//import static com.pojos.Product_.user;
import com.pojos.User;
import com.repository.ProductRepository;
import com.repository.UserRepository;
import com.service.ProductService;
import com.service.UserService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LocNe
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UserService userRepository;

    @Override
    public List<Product> getProducts(String kw) {
        return this.productRepository.getProducts(kw);
    }

    @Override
    @Transactional(readOnly = true)
    public Product getProductByID(int i) {
        return this.productRepository.getProductByID(i);

    }

    @Override
    @Transactional(readOnly = true)
    public User getUserByID(int userId) {
        return this.userRepository.getUserById(userId);
    }

    @Override
    public boolean addOrUpdate(Product product) {
        
        try {
            Map r = this.cloudinary.uploader().upload(product.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            String image = (String) r.get("secure_url");
            product.setImage(image);
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            User user = userRepository.getUserByUsername(username);
            product.setUser(user);
//        productRepository.addOrUpdate(product);
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

}
