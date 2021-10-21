/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.Comment;
import java.util.List;

/**
 *
 * @author QUYENNGUYEN
 */
public interface CommentService {
      List<Comment> getCommentByProductId(int id);
      Comment addComment(String content,int productId,int userid );
}
