package com.pojos;

import com.pojos.Order;
import com.pojos.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-16T23:24:06")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Long> unitPrice;
    public static volatile SingularAttribute<OrderDetail, Product> product;
    public static volatile SingularAttribute<OrderDetail, String> num;
    public static volatile SingularAttribute<OrderDetail, Integer> id;
    public static volatile SingularAttribute<OrderDetail, Order> order;

}