/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LocNe
 */
@Entity
@Table(name = "`product`")
public class Product implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotNull
    @Size(min = 1, max = 50,message = "{product.name.nullErr}")
    private String name;
    @Size( min =1, message = "{product.description.nullErr}")
    private String description;
    @NotNull(message = "{product.price.nullErr}")
    @Min(value = 0, message = "{product.price.minErr}")
    @Max(value = 10000000, message = "{product.price.maxErr}")
    private Long price;
    private String image;
    @Column(name = "Milliliter")
    @Size( min =1,message = "{product.weight.nullErr}")
    private String milliliter;
    private String factory;
    @Column(name = "created_date")
    @Temporal(javax.persistence.TemporalType.DATE)// quy dinh ngay thang
    private Date createDate;
    @ManyToOne
    @JoinColumn(name = "`category_id`")// khoa ngoai ket 2 bang
    private Category category;
   @JoinColumn(name = "`user_id`", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User user;
   @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId",fetch = FetchType.EAGER)
    private Collection<Comment> commentCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private Collection<OrderDetail> orderDetailCollection;
//    @ManyToMany
//    @JoinTable(
//            name = "pro_man",
//            joinColumns = {
//                @JoinColumn(name = "product_id")},
//            inverseJoinColumns = {
//                @JoinColumn(name = "manufacturer_id")})

//    @JsonIgnore
//    private Set<Manufacturer> manufacturers;
    @Transient //xem nh?? l?? 1 thu???c t??nh ????? x??? l?? ko lk v???i csld'
   
    private MultipartFile file;

    public Product() {
    }

    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, User user) {
        this.id = id;
        this.user = user;
    }

    public Product(User user) {

        this.user = user;
    }

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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the price
     */
    public Long getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(Long price) {
        this.price = price;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

//    /**
//     * @return the active
//     */
//    public boolean isActive() {
//        return active;
//    }
//
//    /**
//     * @param active the active to set
//     */
//    public void setActive(boolean active) {
//        this.active = active;
//    }
    /**
     * @return the category
     */
    public Category getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(Category category) {
        this.category = category;
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
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the user
     */
       @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }
       @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    
    /**
     * @return the factory
     */
    public String getFactory() {
        return factory;
    }

    /**
     * @param factory the factory to set
     */
    public void setFactory(String factory) {
        this.factory = factory;
    }

    /**
     * @return the milliliter
     */
    public String getMilliliter() {
        return milliliter;
    }

    /**
     * @param milliliter the milliliter to set
     */
    public void setMilliliter(String milliliter) {
        this.milliliter = milliliter;
    }
}
