package com.pojos;

import com.pojos.Order;
import com.pojos.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T21:25:43")
=======
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-09T11:36:13")
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Long> unitPrice;
    public static volatile SingularAttribute<OrderDetail, Product> product;
    public static volatile SingularAttribute<OrderDetail, String> num;
    public static volatile SingularAttribute<OrderDetail, Integer> id;
    public static volatile SingularAttribute<OrderDetail, Order> order;

}