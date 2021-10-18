package com.pojos;

import com.pojos.OrderDetail;
import com.pojos.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-18T22:22:34")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, Long> amount;
    public static volatile SingularAttribute<Order, Date> createdDate;
    public static volatile CollectionAttribute<Order, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Order, Integer> id;
    public static volatile SingularAttribute<Order, User> user;

}