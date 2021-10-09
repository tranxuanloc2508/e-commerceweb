package com.pojos;

import com.pojos.Order;
import com.pojos.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T21:25:43")
=======
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-09T11:36:13")
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> firstname;
    public static volatile SingularAttribute<User, String> password;
    public static volatile CollectionAttribute<User, Product> productCollection;
    public static volatile SingularAttribute<User, String> phone;
    public static volatile CollectionAttribute<User, Order> orderCollection;
    public static volatile SingularAttribute<User, Boolean> active;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> userRole;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> lastname;
    public static volatile SingularAttribute<User, String> username;

}