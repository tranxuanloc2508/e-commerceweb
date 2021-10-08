<%-- 
    Document   : user
    Created on : Oct 7, 2021, 3:39:47 AM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix ="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
            <tiles:insertAttribute name="title"/>
        </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<c:url value="/css/boostrap.min.css"/>" rel="stylesheet"/> 
        <link href="<c:url value="/css/user-style.css"/>" rel="stylesheet"/> 
        <link rel="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css" />      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>   
       
    </head>
    <body>
         <tiles:insertAttribute name="section"/>   
        <div class="container" >
            <div class="row">
                <div class="col-lg-3 col-xs-12 bg-light ">
                    <!-- LEFT -->
                    <tiles:insertAttribute name="left"/>    
                </div>
                <div class="col-lg-9 col-xs-12">
                    <!-- CONTENT -->                    
                         <form  action="">
                             <div class="input-group">
                                 <input type="text" class="form-control" placeholder="Search" name="search">
                                 <div class="input-group-btn">
                                     <button class="btn btn-default" type="submit">
                                         <i class="glyphicon glyphicon-search"></i>
                                     </button>

                                 </div>     
                             </div>
                         </form>
                    <tiles:insertAttribute name="content"/>   
                
            </div>
            <!-- FOOTER -->
            <tiles:insertAttribute name="footer"/>
        </div>
        <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
        <script src="<c:url value="/js/stats.js"/>"></script>
      <script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>

    </body>
</html>
