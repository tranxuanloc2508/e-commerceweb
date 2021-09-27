<%-- 
    Document   : login
    Created on : Sep 5, 2021, 11:10:50 AM
    Author     : NGUYEN_NGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/login" var="action"/>

<div class="login-page">
  <div class="form">
      <form method="post" action="${action}" class="login-form">       
            <label for="username"></label>
            <input type="text" id="username" name="username"  placeholder="Username"/> 
              
            <label for="password"></label>
            <input type="text" id="password" name="password" placeholder="Password"/>
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    Username or passwword incorrect!
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">
                   Bạn không có quyền truy cập!
                </div>
            </c:if>
            <button type="submit">login</button>
       <p class="message">Not registered? <a href="<c:url value="/register"/>">Create an account</a></p>
      </form>
  </div>
</div>
