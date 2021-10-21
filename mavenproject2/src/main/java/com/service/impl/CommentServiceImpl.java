/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.pojos.Comment;
import com.pojos.Product;
import com.pojos.User;
import com.repository.ProductRepository;
import com.repository.CommentRepository;
import com.repository.UserRepository;
import com.service.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author QUYENNGUYEN
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private  CommentRepository commentRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public  List<Comment> getCommentByProductId(int id) {
      return this.commentRepository.getCommentByProductId(id);
    }

    @Override
    public Comment addComment(String content, int productId,int userid) {
     Product p = productRepository.getProductByID(productId);
      
     User u = this.userRepository.getUserById(userid);
     Comment c = new Comment();
     c.setContent(content);
     c.setProductId(p);
     c.setUser(u);
     c.setCreatedDate(new Date());
     return this.commentRepository.addComment(c);
    }
    
}
