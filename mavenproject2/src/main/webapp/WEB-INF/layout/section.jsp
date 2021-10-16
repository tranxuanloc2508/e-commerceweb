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
        <!--        <c:if test="${pageContext.request.userPrincipal.name == null}">     
              <a href="<c:url value="/login"/>"><span class="glyphicon glyphicon-user"></span> Login</a>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name != null}">

        <li><a  href="<c:url value="/user/product-stats"/>">
                <span class="glyphicon glyphicon-user"></span>${pageContext.request.userPrincipal.name}</a></li>
                              <div><a  href="<c:url value="/logout"/>">Logout</a></div>
    <li><a href="<c:url value="/logout"/>"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>    
        </c:if>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->


        <li class="dropdown">
            <c:if test="${pageContext.request.userPrincipal.name == null}">    
                <a data-toggle="dropdown" class="dropdown-toggle" href="<c:url value="/login"/>">
                    <span class="profile-ava">
                        <img alt="" src="img/avatar1_small.jpg">
                    </span>
                    <span class="username">Login</span>

                </a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">

                <a data-toggle="dropdown" class="dropdown-toggle" href="<c:url value="/user/product-stats"/>">
                    <span class="profile-ava">
                        <img alt="" src="img/avatar1_small.jpg">
                    </span>
                    <span class="username">${pageContext.request.userPrincipal.name}</span>

                </a>
            </c:if>

            <ul class="dropdown-menu extended logout">
                <div class="log-arrow-up "></div>
                <li class="eborder-top navbar-right">
                    <a href="#"><i class="icon_profile"></i> My Profile</a>
                </li>
                <li class="eborder-top navbar-right">
                    <a href="#"><i class="icon_mail_alt"></i> My Inbox</a>
                </li>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <li>
                        <a href="<c:url value="/user/${pageContext.request.userPrincipal.name}"/>"><i class="fa fa-cog"></i> Setting</a>
                    </li>                             
                    <li class="eborder-top navbar-right"><a href="<c:url value="/logout"/>"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>    
                    </c:if>
            </ul>
        </li>
    </ul>


</nav>
