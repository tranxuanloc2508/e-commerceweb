/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojos;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author NGUYEN_NGUYEN
 */
@Entity
@Table(name = "order_detail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetail.findAll", query = "SELECT o FROM OrderDetail o"),
    @NamedQuery(name = "OrderDetail.findById", query = "SELECT o FROM OrderDetail o WHERE o.id = :id"),
    @NamedQuery(name = "OrderDetail.findByUnitPrice", query = "SELECT o FROM OrderDetail o WHERE o.unitPrice = :unitPrice"),
    @NamedQuery(name = "OrderDetail.findByNum", query = "SELECT o FROM OrderDetail o WHERE o.num = :num")})
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "unit_price")
    private Long unitPrice;
    @Size(max = 45)
    @Column(name = "num")
    private String num;
//    @JoinColumns({
//        @JoinColumn(name = "product_id", referencedColumnName = "id"),
//        @JoinColumn(name = "product_id", referencedColumnName = "id")})
    @JoinColumn(name ="product_id")
    @ManyToOne(optional = false)
    private Product product;
//    @JoinColumns({
//        @JoinColumn(name = "order_id", referencedColumnName = "id"),
//        @JoinColumn(name = "order_id", referencedColumnName = "id")})
    
     @JoinColumn(name ="order_id")
    @ManyToOne(optional = false)
    private Order order;

    public OrderDetail() {
    }

    public OrderDetail(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Long unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order saleOrder) {
        this.order = saleOrder;
    }

    
}
