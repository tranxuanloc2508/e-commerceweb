<%-- 
    Document   : product-stats
<<<<<<< HEAD
    Created on : Oct 7, 2021, 3:27:23 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div>
  <canvas id="myProductStatsChart"></canvas>
</div>
<table class="table">
    <tr>
        <th>Ma san pham</th>
        <th>Ten san pham</th>
        <th>Doanh thu</th>
        
    </tr>
    <c:forEach items="${productStats}" var="c">
         <tr>
        <td>${c[0]}</td>
        <td>${c[1]}</td>
        <td>${c[2]}</td>
        
    </tr>
    </c:forEach>
    
</table>
<div >
    <section class="panel">
        <header class="panel-heading no-border">
            Tất cả sản phẩm
        </header>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th></th>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá tiền</th>
                    <th>Loại sản phẩm</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productStats}" var="c">
                    <tr>
                        <td>${c[0]}</td>
                        <td>${c[1]}</td>
                        <td>${c[2]}</td>
                        <td>${c[2]}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</div>
<div>
    <canvas id="myProductStatsChart"></canvas>
</div>
<script>
    let productLabel =[], productInfo=[];
    
    <c:forEach items="${productStats}" var="c">
       productLabel.push('${c[1]}')
       productInfo.push(${c[2]})
    </c:forEach>
    window.onload = function (){
        productChart("myProductStatsChart",  productLabel, productInfo)
