<%-- 
    Document   : userdash
    Created on : Oct 7, 2021, 3:38:29 AM
    Author     : QUYENNGUYEN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center">Thống kê</h1>
<div>
    <canvas id="myCateStatsChart"></canvas>
</div>
<table class="table">
    <tr>
        <th>Ma danh muc</th>
        <th>Ten danh muc</th>
        <th>So luong san pham</th>
        
    </tr>
    <c:forEach items="${statsList}" var="c">
         <tr>
        <td>${c[0]}</td>
        <td>${c[1]}</td>
        <td>${c[2]}</td>
        
    </tr>
    </c:forEach>
</table>
<script>
    let cateLabel =[], cateInfo=[];
    
    <c:forEach items="${statsList}" var="c">
      cateLabel.push('${c[1]}')
      cateInfo.push(${c[2]})
    </c:forEach>
    window.onload = function (){
        cateChart("myCateStatsChart", cateLabel,cateInfo)
    }
</script>
