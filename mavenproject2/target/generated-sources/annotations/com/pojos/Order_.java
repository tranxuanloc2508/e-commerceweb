package com.pojos;

import com.pojos.OrderDetail;
import com.pojos.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-24T15:23:53")
=======
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-24T13:18:30")
>>>>>>> 64177c5000df950b1a54ae08e79f1215b350cf59
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, Long> amount;
    public static volatile SingularAttribute<Order, Date> createdDate;
    public static volatile CollectionAttribute<Order, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Order, Integer> id;
    public static volatile SingularAttribute<Order, User> user;

}