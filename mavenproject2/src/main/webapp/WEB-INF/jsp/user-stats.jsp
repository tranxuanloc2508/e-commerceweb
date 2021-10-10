<%-- 

    Document   : user-stats
    Created on : Oct 7, 2021, 2:13:54 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="table">
    <tr>
         <th>Ma User</th>
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
            <th>${c[5]}</th>
            
        </tr> 
    </c:forEach>
</table>
