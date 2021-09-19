/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.pojos.Category;
import com.pojos.Product;
import com.repository.CategoryRepository;
import com.service.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LocNe
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Category> getCategories() {
        return categoryRepository.getCategories("");
    }   

    @Override
    @Transactional(readOnly = true)
    public List<Product> getProductsByCategory(int cateId) {
        return categoryRepository.getProductsByCategory(cateId);
    }

    @Override
    public Category getCategoryById(int id) {
         return categoryRepository.getCategoryById(id);
    }

}
