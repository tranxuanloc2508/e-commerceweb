/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author NGUYEN_NGUYEN
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "com.service",
         "com.repository"

})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private UserDetailsService userDetailsService;
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
         return new BCryptPasswordEncoder();
    }
     @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dhj3qxlyh",
                "api_key", "173413849841721",
                "api_secret", "qgFFyzYS2Tq16G8ry2l-NCzW4dg",
                "secure", true));

        return c;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
       
       auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
       http.formLogin().loginPage("/login")
               .usernameParameter("username")
               .passwordParameter("password");
//            .antMatchers("/").hasAnyAuthority("USER", "CREATOR", "EDITOR", "ADMIN")
//            .antMatchers("/new").hasAnyAuthority("ADMIN", "CREATOR")
//            .antMatchers("/edit/**").hasAnyAuthority("ADMIN", "EDITOR")
//            .antMatchers("/delete/**").hasAuthority("ADMIN")
//  .anyRequest().authenticated()
//            .and()
//            .formLogin().permitAll()
//            .and()
//            .logout().permitAll()
//            .and()
//            .exceptionHandling().accessDeniedPage("/403")
       http.formLogin().defaultSuccessUrl("/").failureUrl("/login?error");
       
       http.logout().logoutSuccessUrl("/login/");
       
       http.exceptionHandling().accessDeniedPage("/login?accessDenied");
       
       http.authorizeRequests().antMatchers("/").permitAll()
               .antMatchers("/admin/products").access("hasRole('ROLE_ADMIN')");
//               .antMatchers("/cart/**").access("hasRole('ROLE_USER')")
//               .antMatchers("/user/**").access("hasRole('ROLE_USER')");
       
       http.csrf().disable();
    }
    
}
