<%-- 
    Document   : register
    Created on : Sep 3, 2021, 1:29:57 PM
    Author     : NGUYEN_NGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<c:url value="/register" var="action"/>

<div class="login-page">
  <div class="form">
      <form:form class="login-form" method="post" action="${action}" modelAttribute="user">           
        <div class="row">
            <div class="col-lg-6">
                <form:input  type="text" path="firstname" placeholder="First name"/>
            </div>
            <div class="col-lg-6">                
                <form:input type="text" path="lastname" placeholder="Last name"/>                  
            </div>
        </div>  
            
                <form:input type="text" path="phone" placeholder="Phone"/>
                <form:input type="email" path="email" placeholder="Email address"/>
                <form:input type="text" path="username" placeholder="Username"/>
            
                
        <div class="row">
            <div class="col-lg-6">
                <form:input  type="password" path="password" placeholder="Password"/>
            </div>
            <div class="col-lg-6">                
            <form:input type="password" path="confirmPassword" placeholder="Confirm Password"/>                  
            </div>
        </div>     
       
            <button type="submit">create</button>
        <p class="message">Already registered? <a href="<c:url value="/login"/>">Sign In</a></p>
      </form:form>
  </div>
</div>