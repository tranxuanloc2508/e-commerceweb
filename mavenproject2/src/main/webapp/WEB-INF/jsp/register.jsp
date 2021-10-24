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
                    <form:input type="text" id="firstname" path="firstname" placeholder="Họ"/>
                    <form:errors path="firstname" cssClass="text-danger" element="div"/>
                </div>
                <div class="col-lg-6 ">                
                    <form:input type="text" path="lastname" placeholder="Tên"/>  
                    <form:errors path="lastname" cssClass="text-danger" element="div"/>
                </div>
            </div>  
            <form:input type="text" path="phone" placeholder="Số điện thoại"/>
              <form:errors path="phone" cssClass="text-danger" />
            <form:input type="email" path="email" placeholder="Email"/>
             <form:errors path="email" cssClass="text-danger" />
            <form:input type="text" path="username" placeholder="Tên đăng nhập"/>
             <form:errors path="username" cssClass="text-danger" />
             <div class="row">
                 <div class="col-lg-6">
                     <form:input  type="password" path="password" placeholder="Mật khẩu"/>
                     <form:errors path="password" cssClass="text-danger" />
                      <c:if test="${errMsg != null}">
                     <i class="alert alert-danger text-center">${errMsg}</i>
                 </c:if>
                 </div>
                 <div class="col-lg-6">                
                     <form:input type="password" path="confirmPassword" placeholder="Nhập lại mật khẩu"/>

                 </div>                              

             </div>  

            <button type="submit">TẠO TÀI KHOẢN</button>
            <p class="message">Đã có tài khoản? <a href="<c:url value="/login"/>">Đăng nhập</a></p>
        </form:form>
    </div>
</div>