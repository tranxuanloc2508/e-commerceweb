<%-- 
    Document   : edit-produtc
    Created on : Oct 13, 2021, 3:20:29 PM
    Author     : QUYENNGUYEN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/product/edit/${product_id}" var="action"/>
<section>
   
    <form:form method="post" action="${action}" modelAttribute="product">
          <div class="form-group">
        <label for="name">Tên sản phẩm</label>
        <form:input type="text" id="name" path="name" class="form-control"/>
        <form:errors path="name" cssClass="text-danger" element="div"/>
        
    </div>
         <div class="form-group">
        <label for="price">Giá </label>
        <form:input type="text" id="price" path="price" class="form-control"/>
        <form:errors path="price" cssClass="text-danger" element="div"/>
    </div>
     <div class="form-group">
        <label for="cate">Danh mục</label>
        <form:select id="cate" path="category" class="form-control">
            <c:forEach items="${categories}" var="cat">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </form:select>
        <%--<form:input type="text" id="cate" path="category" cssClass="form-control"/>--%>
        <form:errors path="category" cssClass="text-danger" element="div"/>
    </div>
    
    <div class="form-group">
        <label for="description">Mô tả</label>
        <form:textarea type="description" id="description" path="description" class="form-control"></form:textarea>
        </div>
    <div class="form-group">
        <label>Ảnh sản phẩm</label>
        <form:input type="file" id="image" path="file" class="form-control"/>
    </div>
<!--    <div class="form-group">       
        <:input type="file" id="image" path="file" class="form-control"/>
-->        <img src="${product.image}" class="img-thumbnail"alt="Cinque Terre" style=" width: 200px;
  height: 200px;
  object-fit: cover;"><!--
    </div>-->
   
    <div class="form-group">
        <input type="submit" value="Sửa sản phẩm" class="btn btn-danger"/>
    </div>
      
    </form:form>
</section>
