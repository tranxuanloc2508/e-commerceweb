/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojos;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author LocNe
 */
@Entity
@Table(name = "category")
public class Category implements Serializable {

    @Id// chỉ định khóa chính cho ID
    @GeneratedValue(strategy = GenerationType.IDENTITY)// chỉ định trường tự tăng
    //@Column(name = "id")//chỉ định cho id
    private int id;

    //@Column(name = "name", length = 100, nullable = false)// trùng tên bỏ lun
    @Column(name = "nameCategory")
    private String name;

    // @Column(name = "description")
    private String description;
//    @OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
//    private Set<Product> products;
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER, mappedBy = "category")
    private Collection<Product> productCollection;
     public Category() {
    }

    public Category(Integer id) {
        this.id = id;
    }

//    public Category(Integer id, String nameCategory) {
//        this.id = id;
//        this.nameCategory = nameCategory;
//    }

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
      @XmlTransient
    public Collection<Product> getProductCollection() {
        return productCollection;
    }

    public void setProductCollection(Collection<Product> productCollection) {
        this.productCollection = productCollection;
    }
}
