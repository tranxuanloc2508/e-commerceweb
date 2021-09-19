/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.Category;
import com.pojos.Product;
import java.util.List;

/**
 *
 * @author LocNe
 */
public interface CategoryService {
     List<Category> getCategories();
    List<Product> getProductsByCategory(int cateId);
     Category getCategoryById(int id);
}
