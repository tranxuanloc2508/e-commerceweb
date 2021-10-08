<%-- 
    Document   : section
    Created on : Oct 8, 2021, 12:11:32 AM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-light bg-light ">
  <a class="navbar-brand">Người bán hàng</a>
   <ul class="nav navbar-right">
        <c:if test="${pageContext.request.userPrincipal.name == null}">     
      <li><a href="<c:url value="/login"/>"><span class="glyphicon glyphicon-user"></span> Login</a></li>
        </c:if>
          <c:if test="${pageContext.request.userPrincipal.name != null}">

          <li><a  href="<c:url value="/user/product-stats"/>">
                  <span class="glyphicon glyphicon-user"></span>${pageContext.request.userPrincipal.name}</a></li>
<!--                                <div><a  href="<c:url value="/logout"/>">Logout</a></div>-->
      <li><a href="<c:url value="/logout"/>"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>    
      </c:if>
<!--      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
    </ul>
</nav>