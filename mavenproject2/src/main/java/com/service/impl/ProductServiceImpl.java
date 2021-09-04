/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pojos.Product;
import com.repository.ProductRepository;
import com.service.ProductService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Override
    public List<Product> getProducts(String kw) {
        return this.productRepository.getProducts(kw);
    }

    @Override
    public boolean addOrUpdate(Product product) {
        try {
            Map r = this.cloudinary.uploader().upload(product.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            String image = (String) r.get("secure_url");
            product.setImage(image);
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
return this.productRepository.getProductByID(i);    }

}
