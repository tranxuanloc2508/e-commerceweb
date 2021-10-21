/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository;

import com.pojos.Comment;
import com.pojos.Product;
import java.util.List;

/**
 *
 * @author QUYENNGUYEN
 */
public interface CommentRepository {
    List<Comment> getCommentByProductId(int id);
    Comment addComment (Comment c);
}
