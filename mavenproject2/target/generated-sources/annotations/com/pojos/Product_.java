package com.pojos;

import com.pojos.Category;
import com.pojos.Comment;
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
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, String> image;
    public static volatile SingularAttribute<Product, String> factory;
    public static volatile SingularAttribute<Product, String> milliliter;
    public static volatile CollectionAttribute<Product, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Product, Long> price;
    public static volatile CollectionAttribute<Product, Comment> commentCollection;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SingularAttribute<Product, Category> category;
    public static volatile SingularAttribute<Product, User> user;
    public static volatile SingularAttribute<Product, Date> createDate;

}