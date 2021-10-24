<%-- 
    Document   : base-admin
    Created on : Oct 4, 2021, 10:22:06 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix ="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>
            <tiles:insertAttribute name="title"/>
        </title>
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

        <link href="<c:url value="/css/nice-select.css"/>" rel="stylesheet"/> 
        <link href="<c:url value="/css/style.css"/>" rel="stylesheet"/> 
        <link rel="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.min.js"></script>
        <link rel="icon" type="image/png" href="<c:url value="img/icon.png"/>"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <link rel="icon" type="image/png" href="<c:url value="img/icon.png"/>"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1 class="text-center text-info">TRANG THONG KE - BAO CAO</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 col-xs-12 bg-light">
            <!-- HEADER -->
            <tiles:insertAttribute name="left"/>
            </div>
            <!-- CONTENT -->
            <div class="col-md-4 col-xs-12">
            <tiles:insertAttribute name="content"/>
            </div>
            <!-- FOOTER -->
            <tiles:insertAttribute name="footer"/>
            </div>
        </div>

        <script src="<c:url value="/js/stats.js"/>"></script>




    </body>
</html>