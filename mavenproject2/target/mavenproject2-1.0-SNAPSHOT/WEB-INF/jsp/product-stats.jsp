<%-- 
    Document   : product-stats
    Created on : Oct 6, 2021, 11:40:03 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>Thong ke doanh thu theo san pham </h1>

<form action="">
    <div class="form-group">
        <label>Tu khoa</label>
        <input type="text" name="kw" class="form-control"/>
    </div>
     <div class="form-group">
        <label>Tu thoi diem</label>
        <input type="date" name="fromDate" class="form-control"/>
    </div>
     <div class="form-group">
        <label>Tu khoa</label>
        <input type="date" name="toDate" class="form-control"/>
    </div>
    <input type="submit" value="Bao cao" class="btn btn-success"/>
</form>
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
            <th>${c[0]}</th>
            <th>${c[1]}</th>
            <th>${c[2]} VND</th>
        </tr> 
    </c:forEach>
</table>
 


<script>
    
    let productLables =[],productInfo=[];
    <c:forEach items="${productStats}" var="c">
        productLables.push('${c[1]}')
        productInfo.push('${c[2]}')
    </c:forEach>
    
    window.onload= function(){
        productChart("myProductStatsChart",productLables,productInfo)
    }
</script>