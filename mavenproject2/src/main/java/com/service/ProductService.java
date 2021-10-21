/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.Product;
import com.pojos.User;
import java.util.List;

/**
 *
 * @author LocNe
 */
public interface ProductService {

    List<Product> getProducts(String kw, int page);

    long countProduct();

    boolean addOrUpdate(Product product);

    boolean updateProduct(Product p);

    boolean deleteProduct(Product p);

    Product getProductByID(int productId);

    
}
