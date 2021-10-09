<%-- 
    Document   : category-stats
    Created on : Oct 4, 2021, 10:28:32 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1>Thong ke </h1>
<div>
  <canvas id="myCateStatsChart"></canvas>
</div>
 
<table class="table">
    <tr>
        <th>Ma danh muc</th>
        <th>Ten danh muc</th>
        <th>So luong san pham</th>
    </tr> 
    <c:forEach items="${cateStats}" var="c">
        <tr>
            <th>${c[0]}</th>
            <th>${c[1]}</th>
            <th>${c[2]}</th>
        </tr> 
    </c:forEach>
</table>

<script>
    let cateLables =[],cateInfo=[];
    <c:forEach items="${cateStats}" var="c">
        cateLables.push('${c[1]}')
        cateInfo.push('${c[2]}')
    </c:forEach>
    
    window.onload= function(){
        cateChart("myCateStatsChart",cateLables,cateInfo)
    }
</script>