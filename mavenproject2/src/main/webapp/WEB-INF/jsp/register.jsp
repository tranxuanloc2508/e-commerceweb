<%-- 
    Document   : register
    Created on : Sep 3, 2021, 1:29:57 PM
    Author     : NGUYEN_NGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/register" var="action"/>

<div class="login-page">
    <div class="form">
        <form:form method="post" action="${action}" modelAttribute="user">           
            <div class="row">
                <div class=" col-lg-6 ">
                    <label for="firstname">Tên sản phẩm</label>
                    <form:input type="text" id="firstname" path="firstname" class="form-control"/>
                    <form:errors path="firstname" cssClass="text-danger" element="div"/>
                </div>
                <div class="col-lg-6 ">                
                    <form:input type="text" path="lastname" placeholder="Tên"/>                               
                </div>
            </div>  
            <form:input type="text" path="phone" placeholder="Số điện thoại"/>
            <form:input type="email" path="email" placeholder="Email"/>
            <form:input type="text" path="username" placeholder="Username"/>
            <div class="row">
                <div class="col-lg-6">
                    <form:input  type="password" path="password" placeholder="Password"/>
                </div>
                <div class="col-lg-6">                
                    <form:input type="password" path="confirmPassword" placeholder="Confirm Password"/>   
                </div>
                <c:if test="${errMsg != null}">
                    <span class="alert alert-danger">${errMsg}</span>
                </c:if>
            </div>  
            <form:errors path="*" cssClass="alert alert-danger" element="div"/>

            <button type="submit">TẠO TÀI KHOẢN</button>
            <p class="message">Already registered? <a href="<c:url value="/login"/>">Đăng nhập</a></p>
        </form:form>
    </div>
</div>