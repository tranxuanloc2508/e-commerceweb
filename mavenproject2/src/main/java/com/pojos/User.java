/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojos;

//import com.fasterxml.jackson.annotation.JsonRootName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

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
    @Size(min = 1, max = 50,message = "{user.firstname.nullErr}")
    private String firstname;
    @Column(name="`last_name`")
    @Size(min = 1, max = 50,message = "{user.lastname.nullErr}")
    private String lastname;
    
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Chưa đúng định dạng")
    private String email;
    @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Chưa đúng định dạng")
    private String phone;
    @Size(min = 1, max = 50,message = "Bạn cần thêm thông tin username")
    private String username;
    @NotNull
    @Size(min = 1, max = 100 ,message = "Bạn cần nhập thông tin")
    private String password;
    private boolean active;
    @Column(name="`user_role`")
    private String userRole;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<Product> productCollection;
    @JsonIgnore
    @OneToMany(mappedBy = "user")
    private Collection<Order> orderCollection;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<Comment> commentCollection;
     private String image;
     @Transient //xem như là 1 thuộc tính để xử lí ko lk với csld
    private MultipartFile file;
     @Transient
     private String confirmPassword;
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

       @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
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

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

   
}
