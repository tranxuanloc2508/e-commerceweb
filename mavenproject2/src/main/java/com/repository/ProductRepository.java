/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository;

import com.pojos.Product;
import com.pojos.User;
import java.util.List;

/**
 *
 * @author LocNe
 */
public interface ProductRepository {

    List<Product> getProducts(String kw,int page);

    Product getProductByID(int productId);

    long countProduct();

    boolean addOrUpdate(Product product);
    boolean updateProduct(Product p);
    boolean deleteProduct(Product p);

    User getUserByID(int userId);
    

}
