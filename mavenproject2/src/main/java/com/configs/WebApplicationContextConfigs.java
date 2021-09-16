/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.formatter.CategoryFormatter;
import com.formatter.UserFormatter;
import java.util.HashSet;
import java.util.Set;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.format.FormatterRegistrar;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author LocNe
 */
@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.Controller",
    "com.repository",
    "com.service",
    "com.validator"
})
public class WebApplicationContextConfigs implements WebMvcConfigurer {

    @Override
    public void configureDefaultServletHandling(
            DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addResourceHandlers(
            ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/resouces/css/");
        registry.addResourceHandler("/img/**")
                .addResourceLocations("/resouces/img/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("/resouces/js/");
         registry.addResourceHandler("/sass/**")
                .addResourceLocations("/resouces/sass/");
        
    }
//     @Bean
//    public Cloudinary cloudinary() {
//        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
//                "cloud_name", "djtemroku",
//                "api_key", "592841477312947",
//                "api_secret", "66gZEgzOGc-3482-pzn_uoSqtd4",
//                "secure", true));
//
//        return c;
//    }
    @Bean
    public InternalResourceViewResolver
            getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver
                = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public Validator getValidator() {
        return validator();
    }
    @Override
    public void addFormatters(FormatterRegistry registry){
        registry.addFormatter(new CategoryFormatter());
        registry.addFormatter(new UserFormatter());
    }
    
//    @Bean
//    public WebAppValidator productValidator(){
//        Set<Validator> springValidators = new HashSet<>();
//        springValidators.add(new ProductNameValidator());
//        
//        
//        WebAppValidator v = new WebAppValidator();
//        v.setSpringValidators(springValidators);
//        
//        return v;
//    }
    
    @Bean
    public LocalValidatorFactoryBean validator() {
        LocalValidatorFactoryBean v = new LocalValidatorFactoryBean();
        v.setValidationMessageSource(messageSource());
        return v;
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource source = new ResourceBundleMessageSource();
        source.setBasename("messages");//chỉ định 1,, thêm s ở setbasename để nhiều
        return source;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {

        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }
    
}
