<%-- 
    Document   : product-user-stats
    Created on : Oct 9, 2021, 12:58:15 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div >
    <section class="panel">
        <header class="panel-heading no-border">
            Tất cả sản phẩm
        </header>
        <table class="table table-bordered">
            <thead>
                <tr>                  
                    <th>Mã SP</th>
                    <th>Tên sản phẩm</th>
                    <th>Mô tả</th>
                    <th>Giá bán</th>
                    <th>Loại sản phẩm</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listproductStats}" var="c">
                    <tr>                    
                        <td>${c[0]}</td>
                        <td>${c[1]}</td>
                        <td>${c[2]}</td>
                        <td>${c[3]} VNĐ</td>
                        <td>${c[4].getName()}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</div>