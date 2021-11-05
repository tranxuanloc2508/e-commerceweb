<%-- 
    Document   : category-stats
    Created on : Oct 4, 2021, 10:28:32 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1>Thống kê theo loại sản phẩm </h1>   
<br>
            <div >
                <canvas id="myCateStatsChart"></canvas>
            </div>       
<div class="card panel">
    <div class="row ">
        <div class="col-md-12 px-2">
            <div >
                <section class="panel">
                    <header class="panel-heading no-border"><h4>
                        Tất cả loại sản phẩm dựa theo sản phẩm hiện có</h4>
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  
                                    <th>STT</th>
                                    <th>Tên loại sản phẩm</th>
                                    <th>Số lượng </th>                                   
                                </tr>
                            </thead>
                            <tbody>
                                  <c:set var="count" value="0"/>
                                <c:forEach items="${cateStats}" var="c">
                                    <tr>         
                                        <td>                                         
                                            <c:set var="count" value="${count +1}"/>${count}                                         
                                        </td>
                                        <td>${c[1]}</td>
                                        <td>${c[2]}</td>                                    
                                    </tr>
                                </c:forEach>                            
                            </tbody>
                        </table>
                    </div> 
                </section>
            </div>          
        </div>
        <!-- End of carousel -->
    </div>
</div>


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