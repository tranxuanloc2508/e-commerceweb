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
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author LocNe
 */
public class UserValidator implements Validator{
     @Autowired
    private javax.validation.Validator beanValidator;
    
    private Set<Validator> springValidators = new HashSet<>();

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.isAssignableFrom(clazz) || 
                User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Set<ConstraintViolation<Object>> constraintViolations 
                = beanValidator.validate(target);
        
        for (ConstraintViolation<Object> obj: constraintViolations) 
            errors.rejectValue(obj.getPropertyPath().toString(), 
                    obj.getMessageTemplate(), obj.getMessage());
        
        for (Validator obj: springValidators)
            obj.validate(target, errors);
    }
    
    public void setSpringValidators(Set<Validator> springValidators) {
        this.springValidators = springValidators;
    }
}
