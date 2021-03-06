/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.repository.impl;

import com.pojos.Category;
import com.pojos.Order;
import com.pojos.OrderDetail;
import com.pojos.Product;
import com.pojos.User;
import com.repository.StatsReponsitory;
import com.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LocNe
 */
@Repository
@Transactional
public class StatsReponsitoryImpl implements StatsReponsitory {

    @Autowired
    private LocalSessionFactoryBean localSessionFactoryBean;
    @Autowired
    private UserService userRepository;

    @Override
    public List<Object[]> cateStats() {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootP = q.from(Product.class);
        Root rootC = q.from(Category.class);

        q.where(b.equal(rootP.get("category"), rootC.get("id")));

        q.multiselect(rootC.get("id"), rootC.get("name"), b.count(rootP.get("id")));

        q.groupBy(rootC.get("id"));

        Query query = session.createQuery(q);

        return query.getResultList();

    }

    @Override
    public List<Object[]> productStats(String kw, Date fromDate, Date toDate) {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootP = q.from(Product.class);
        Root rootC = q.from(Order.class);
        Root rootD = q.from(OrderDetail.class);

        List<Predicate> pridicates = new ArrayList<>();
        pridicates.add(b.equal(rootD.get("product"), rootP.get("id")));
        pridicates.add(b.equal(rootD.get("order"), rootC.get("id")));// di???u ki???n ph??p join

        q.multiselect(rootP.get("id"), rootP.get("name"),
                b.sum(b.prod(rootD.get("unitPrice"), rootD.get("num"))));// .prod nh??n 2 tr?????ng trong csdl

        if (kw != null && !kw.isEmpty()) {
            pridicates.add(b.like(rootP.get("name"), String.format("%%%s%%", kw)));
        }

        if (fromDate != null) {
            pridicates.add(b.greaterThanOrEqualTo(rootC.get("createdDate"), fromDate));//lowns hown
        }
        if (toDate != null) {
            pridicates.add(b.lessThanOrEqualTo(rootC.get("createdDate"), toDate));//nho hon
        }
        q.where(pridicates.toArray(new Predicate[]{})); // t??? ?????ng b??? 
        q.groupBy(rootP.get("id"));// gom nh??m

        Query query = session.createQuery(q);

        return query.getResultList();
    }

    @Override
    public List<Object[]> productMonthStats(String kw, Date fromDate, Date toDate) {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootP = q.from(Product.class);
        Root rootC = q.from(Order.class);
        Root rootD = q.from(OrderDetail.class);

        List<Predicate> pridicates = new ArrayList<>();
        pridicates.add(b.equal(rootD.get("product"), rootP.get("id")));
        pridicates.add(b.equal(rootD.get("id"), rootC.get("id")));// di???u ki???n ph??p join

        q.multiselect(b.function("MONTH", Integer.class, rootC.get("createdDate")),
                b.function("YEAR", Integer.class, rootC.get("createdDate")),
                b.sum(b.prod(rootD.get("unitPrice"), rootD.get("num"))));// .prod nh??n 2 tr?????ng trong csdl

        if (kw != null && !kw.isEmpty()) {
            pridicates.add(b.like(rootP.get("name"), String.format("%%%s%%", kw)));
        }

        if (fromDate != null) {
            pridicates.add(b.greaterThanOrEqualTo(rootC.get("createdDate"), fromDate));//lowns hown
        }
        if (toDate != null) {
            pridicates.add(b.lessThanOrEqualTo(rootC.get("createdDate"), toDate));//nho hon
        }
        q.where(pridicates.toArray(new Predicate[]{})); // t??? ?????ng b??? 
        q.groupBy(b.function("MONTH", Integer.class, rootC.get("createdDate")),
                b.function("YEAR", Integer.class, rootC.get("createdDate")));// gom nh??m

        Query query = session.createQuery(q);

        return query.getResultList();
    }

    @Override
    public List<Object[]> User() {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootU = q.from(User.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rootU.get("userRole"), "ROLE_USER"));
        q.multiselect(rootU.get("id"), rootU.get("firstname"), rootU.get("lastname"), rootU.get("email"), rootU.get("phone"), rootU.get("userRole"));
        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(rootU.get("id"));

        Query query = session.createQuery(q);

        return query.getResultList();
    }

    @Override
    public List<Object[]> listProduct() {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootP = query.from(Product.class);
        Root rootU = query.from(User.class);
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getUserByUsername(username);
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootP.get("user"), rootU.get("id")));
        predicates.add(builder.equal(rootP.get("user"), user));
        query.multiselect(rootP.get("id"), rootP.get("name"), rootP.get("description"), rootP.get("price"), rootP.get("image"), rootP.get("category"));
        query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<Object[]> listSaleUser() {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootP = query.from(Product.class);
        Root rootD = query.from(OrderDetail.class);

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getUserByUsername(username);
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootP.get("id"), rootD.get("product")));
        predicates.add(builder.equal(rootP.get("user"), user.getId()));

        query.multiselect(rootP.get("id"), rootP.get("name"), rootP.get("description"),
                rootP.get("price"), rootP.get("category"), rootD.get("order"), builder.prod(rootD.get("unitPrice"), rootD.get("num")));
        query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<Object[]> OrderStats() {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root rootP = query.from(Product.class);
        Root rootU = query.from(User.class);
        Root rootD = query.from(OrderDetail.class);
        Root rootO = query.from(Order.class);
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getUserByUsername(username);
        List<Predicate> predicates = new ArrayList<>();
//        predicates.add(builder.equal(rootP.get("id"), rootD.get("product")));
        predicates.add(builder.equal(rootP.get("user"), rootU.get("id")));
        predicates.add(builder.equal(rootO.get("user"), user.getId()));
        predicates.add(builder.equal(rootD.get("product"), rootP.get("id")));
        predicates.add(builder.equal(rootD.get("order"), rootO.get("id")));// di???u ki???n ph??p join
//        predicates.add(builder.equal(rootP.get("user"), user ));  
        query.multiselect(rootP.get("id"), rootP.get("image"), rootP.get("name"), rootP.get("description"),
                rootO.get("amount"), rootO.get("createdDate"), builder.prod(rootD.get("unitPrice"), rootD.get("num")));
        query.where(predicates.toArray(new Predicate[]{}));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<Product> listBestProduct(Date fromDate, Date toDate) {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();
        String query = " SELECT  P.id, P.name, P.price,P.image,sum(OD.num)"
                + " FROM  OrderDetail OD, Product P "
                + "WHERE OD.id in "
                + "(Select OD.id  FROM Order O, OrderDetail OD WHERE  O.id = OD.order.id  ) "
                + "and P.id = OD.product.id "
                + "GROUP BY P.id "
                + "ORDER BY sum(OD.num) desc ";
                

        List<Product> products = session.createQuery(query).setMaxResults(10).getResultList();
        return products;
    }

    @Override
    public List<Product> listBestProductOfUser() {
        Session session = this.localSessionFactoryBean.getObject().getCurrentSession();
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.getUserByUsername(username);       
       String query = " SELECT  P.id, P.name, P.price,P.image,sum(OD.num)"
                + " FROM  OrderDetail OD, Product P "
                + "WHERE OD.id in "
                + "(Select OD.id  FROM Order O, OrderDetail OD WHERE  O.id = OD.order.id  ) "
                + "and P.id = OD.product.id and P.user.id = '"+user.getId()+"'"
                + "GROUP BY P.id "
                + "ORDER BY sum(OD.num) desc ";
                

        List<Product> products = session.createQuery(query).setMaxResults(5).getResultList();
        return products;
    }

}
