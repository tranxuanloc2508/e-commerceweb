/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository;


import com.pojos.User;
import java.util.List;

/**
 *
 * @author NGUYEN_NGUYEN
 */
public interface UserRepository {
    boolean addUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(User user);
    List<User> getUser(String username);
    User getUserById(int id);
    User getUserByname(String id);

    
}
