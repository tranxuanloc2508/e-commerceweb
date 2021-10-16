/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.pojos.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author NGUYEN_NGUYEN
 */
public interface UserService extends UserDetailsService{
    boolean addUser(User user);
      boolean updateUser(User user);
    List<User> getUser(String username);
    User getUserById(int id);
    User getUserByUsername(String username);
}
