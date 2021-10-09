/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojos;

//import com.fasterxml.jackson.annotation.JsonRootName;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
<<<<<<< HEAD
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
=======
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author NGUYEN_NGUYEN
 */
@Entity
@Table(name ="user")
public class User implements Serializable{
    public static final String ADMIN ="ROLE_ADMIN";
    public static final String USER ="ROLE_USER";
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="`first_name`")
    private String firstname;
    @Column(name="`last_name`")
    private String lastname;
    private String email;
    private String phone;
    private String username;
    private String password;
    private boolean active;
    @Column(name="`user_role`")
    private String userRole;
<<<<<<< HEAD
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<Product> productCollection;
    @OneToMany(mappedBy = "user")
    private Collection<Order> orderCollection;
    
     @Transient
     private String confirmPassword;
=======

    @Transient
    private String confirmPassword;
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the firstName
     */
   
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the userName
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param userName the userName to set
     */
    public void setUsername(String userName) {
        this.username = userName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the active
     */
    public boolean isActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * @return the userRole
     */
    public String getUserRole() {
        return userRole;
    }

    /**
     * @param userRole the userRole to set
     */
    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    /**
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    
    public String getFirstname() {
        return firstname;
    }

   
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

   
    public String getLastname() {
        return lastname;
    }

    
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    /**
     * @return the productCollection
     */
    public Collection<Product> getProductCollection() {
        return productCollection;
    }

    /**
     * @param productCollection the productCollection to set
     */
    public void setProductCollection(Collection<Product> productCollection) {
        this.productCollection = productCollection;
    }

    /**
     * @return the orderCollection
     */
    public Collection<Order> getOrderCollection() {
        return orderCollection;
    }

    /**
     * @param orderCollection the orderCollection to set
     */
    public void setOrderCollection(Collection<Order> orderCollection) {
        this.orderCollection = orderCollection;
    }

   
}
