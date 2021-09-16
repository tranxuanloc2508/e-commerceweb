/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository;

import com.pojos.Category;
import com.pojos.Product;
import java.util.List;

/**
 *
 * @author LocNe
 */
public interface CategoryRepository {
      List<Category> getCategories(String kw);
    Category getCategoryById(int id);
    List<Product> getProductsByCategory(int cateId);
}
