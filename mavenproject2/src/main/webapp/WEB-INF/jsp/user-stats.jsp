<%-- 
<<<<<<< HEAD
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
=======
    Document   : user-stats
    Created on : Oct 7, 2021, 2:13:54 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="table">
    <tr>
        
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>UserRole</th>
        
    </tr> 
    <c:forEach items="${userStats}" var="c">
        <tr>
            <th>${c[0]}</th>
            <th>${c[1]}</th>
            <th>${c[2]}</th>
            <th>${c[3]}</th>
            <th>${c[4]}</th>
         
            
        </tr> 
    </c:forEach>
</table>
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
