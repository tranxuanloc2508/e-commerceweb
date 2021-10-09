package com.pojos;

import com.pojos.Category;
import com.pojos.OrderDetail;
import com.pojos.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

<<<<<<< HEAD
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T21:25:43")
=======
@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-09T11:36:13")
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, String> image;
    public static volatile CollectionAttribute<Product, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Product, Long> price;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SingularAttribute<Product, Category> category;
    public static volatile SingularAttribute<Product, User> user;
    public static volatile SingularAttribute<Product, Date> createDate;

}