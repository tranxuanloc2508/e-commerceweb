/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.validator;

import com.pojos.Product;
import com.pojos.User;
import java.util.HashSet;
import java.util.Set;
import javax.validation.ConstraintViolation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LocNe
 */
@Component
public class WebAppValidator implements Validator {
    @Autowired
    private javax.validation.Validator beaValidator;
    private Set<Validator> springValidators = new HashSet<>();
    @Override
    public boolean supports(Class<?> type) {
        return Product.class.isAssignableFrom(type) || 
                User.class.isAssignableFrom(type);
        
    }

    @Override
    public void validate(Object o, Errors errors) {
        
//        Product p = (Product) o;
//        MultipartFile multiFile = p.getFile();
//        if(multiFile.getSize() == 0)
//            errors.rejectValue("image", "product.image.nullErr");
        Set<ConstraintViolation<Object>> beans=  this.beaValidator.validate(o);
        for(ConstraintViolation<Object> obj: beans)
            errors.rejectValue(obj.getPropertyPath().toString(), obj.getMessageTemplate(), obj.getMessage());
        for(Validator v:this.springValidators)
            v.validate(o, errors);
        
    }

    /**
     * @param springValidators the springValidators to set
     */
    public void setSpringValidators(Set<Validator> springValidators) {
        this.springValidators = springValidators;
    }

}
