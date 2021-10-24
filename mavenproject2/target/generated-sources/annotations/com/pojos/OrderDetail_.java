package com.pojos;

import com.pojos.Order;
import com.pojos.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-24T15:23:53")
=======
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-24T13:18:30")
>>>>>>> 64177c5000df950b1a54ae08e79f1215b350cf59
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Long> unitPrice;
    public static volatile SingularAttribute<OrderDetail, Product> product;
    public static volatile SingularAttribute<OrderDetail, String> num;
    public static volatile SingularAttribute<OrderDetail, Integer> id;
    public static volatile SingularAttribute<OrderDetail, Order> order;

}