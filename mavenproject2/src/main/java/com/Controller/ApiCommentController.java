/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controller;

import com.pojos.Comment;
import com.service.CommentService;
import java.util.Map;
import javax.print.attribute.standard.Media;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author QUYENNGUYEN
 */
@RestController
public class ApiCommentController {
    
    @Autowired
    private CommentService commentService;
    @PostMapping(path = "/api/add-comment/{user_id}", produces = {
        MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<Comment> addComment( @RequestBody Map<String, String> params,
    @PathVariable(value = "user_id") int userId) {
        try {
            String content = params.get("content" );
            int productId = Integer.parseInt(params.get("productId"));
            
            Comment c = this.commentService.addComment(content, productId,userId);
            
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
  
        
    }
            
    
}
