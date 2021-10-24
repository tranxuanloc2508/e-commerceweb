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
          <div>
            <label for="username"></label>
            <input type="text" id="username" name="username"  placeholder="Username"/> 
            
          </div>    
            <label for="password"></label>
            <input type="password" id="password" name="password" placeholder="Password"/>
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    Tên hoặc mật khẩu đăng nhập chưa đúng!
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">
                   Bạn không có quyền truy cập!
                </div>
            </c:if>
            <button type="submit">ĐĂNG NHẬP</button>
       <p class="message">Chưa đăng ký? <a href="<c:url value="/register"/>">Tạo tài khoản</a></p>
      </form>
  </div>
</div>
