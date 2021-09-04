<%-- 
    Document   : product
    Created on : Sep 3, 2021, 4:33:02 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-danger">QUAN LI SAN PHAM</h1>
<c:url value="/admin/products" var="action"/>

<c:if test="${errMsg!=null}">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<section class="hero">
    <div class="container">
<form:form method="post" action="${action}" modelAttribute="product"
           enctype="multipart/form-data">
    <form:errors path="*" cssClass="alert alert-danger" element="div"/>
    <div class="form-group">
        <label for="name">Ten san pham</label>
        <form:input type="text" id="name" path="name" cssClass="form-control"/>
        <form:errors path="name" cssClass="text-danger" element="div"/>
    </div>
    <div class="form-group">
        <label for="price">Gia</label>
        <form:input type="text" id="price" path="price" cssClass="form-control"/>
        <form:errors path="price" cssClass="text-danger" element="div"/>
    </div>
     <div class="form-group">
        <label for="cate">Danh muc</label>
        <form:select id="cate" path="category" cssClass="form-control">
            <c:forEach items="${categories}" var="cat">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </form:select>
        <%--<form:input type="text" id="cate" path="category" cssClass="form-control"/>--%>
        <form:errors path="category" cssClass="text-danger" element="div"/>
    </div>
    
    <div class="form-group">
        <label for="description">Mo ta</label>
        <form:textarea type="description" id="description" path="description" cssClass="form-control"></form:textarea>
        </div>
    <div class="form-group">
        <label>Anh san pham</label>
        <form:input type="file" id="file" path="file" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <input type="submit" value="Them san pham" class="btn btn-danger"/>
    </div>
</form:form>
    </div>
</section>
    