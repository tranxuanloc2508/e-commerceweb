/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pojos;

import static com.pojos.Product_.orderDetailCollection;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
//import java.sql.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;
/**
 *
 * @author QUYENNGUYEN
 */
@Entity
@Table(name = "`order`")
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "`amount`")
    private Long amount;
    @Column(name = "`created_date`")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @ManyToOne
    @JoinColumn(name = "`user_id`", referencedColumnName = "id")// khoa ngoai ket 2 bang
    private User user;  
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order")
    private Collection<OrderDetail> orderDetailCollection;
    {
        createdDate = new Date();
    }

   
    public Order(){
        createdDate = new Date();
    }
//    @XmlTransient
//    public Collection<OrderDetail> getOrderDetailCollection() {
//        return orderDetailCollection;
//    }
//
//    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
//        this.orderDetailCollection = orderDetailCollection;
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

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User userId) {
        this.user = userId;
    }

    @Override
    public String toString() {
        return "com.pojos.Order[ id=" + id + " ]";
    }

    public void setAmount(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
