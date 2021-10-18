/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.pojos.User;
import com.repository.UserRepository;
import com.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author NGUYEN_NGUYEN
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {
      @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public boolean addUser(User user) {
        String pass = user.getPassword();
        user.setPassword(this.passwordEncoder.encode(pass));
        user.setUserRole(User.USER);
        return this.userRepository.addUser(user); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> getUser(String username) {
        return this.userRepository.getUser(username); //To change body of generated methods, choose Tools | Templates.
    }

//    @Autowired
//    private UserRepository userRepository;
//    
    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUser(username);

        if (users.isEmpty()) {
            throw new UsernameNotFoundException("User does not exist");
        }

        User user = users.get(0);

        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserRole()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), auth);
    }

    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepository.getUser(username).get(0);
    }

    @Override
    public boolean updateUser(User user) {
        if (user.getId() > 0) {
            String pass = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(pass));
            user.setUserRole(User.USER);
        }
          try {
            Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));

            String image = (String) r.get("secure_url");
            user.setImage(image);            
            userRepository.updateUser(user);
            return this.userRepository.updateUser(user);

        } catch (IOException ex) {
            System.err.println("===ADD PRODUCT===" + ex.getMessage());
        }
        return this.userRepository.updateUser(user);
    }
    
    @Override
    public User getUserByUsernamea(String id) {
        return this.userRepository.getUserByname(id);
    }

    @Override
    public boolean deleteUser(User user) {

        return this.userRepository.deleteUser(user);
    }

}
