package com.pojos;

import com.pojos.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-09-25T11:02:50")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, Long> amount;
    public static volatile SingularAttribute<Order, Date> createdDate;
    public static volatile SingularAttribute<Order, Integer> id;
    public static volatile SingularAttribute<Order, User> user;

}