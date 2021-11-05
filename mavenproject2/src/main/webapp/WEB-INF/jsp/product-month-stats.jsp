<%-- 
    Document   : product-month-stats
    Created on : Oct 27, 2021, 9:46:13 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form action="">                    
    <div class="form-group">
        <label>Từ thời gian</label>
        <input type="date" name="fromDate" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Đến thời gian</label>
        <input type="date" name="toDate" class="form-control"/>
    </div>
    <input type="submit" value="THỐNG KÊ" class="btn btn-success"/>
</form>                  
<h1>Thống kê doanh thu </h1>
<div class="card panel">
    <div class="row ">
        <div class="col-md-12 px-2">
            <div >
                <section class="panel">
                    <header class="panel-heading no-border"><h4>
                            Doanh thu theo tháng </h4>
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  

                                    <th>Tháng</th>
                                    <th>Doanh thu </th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach items="${productMonthStats}" var="c">
                                    <tr>         
                                        <td>                                         
                                            ${c[0]}/${c[1]}                                     
                                        </td>
                                        <td> <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${c[2]}"/> đ</td>
<!--                                        <td>${c[4]}</td>
                                        <td > <img src="${c[3]}" class="img-thumbnail"alt="${c[3]}" style=" width: 100px;
                                                   height: 100px;
                                                   object-fit: cover;"></td>                                                                     -->
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
<div class="card">
    <div class ="chart chartjs-render-monitor">
        <canvas id="myProductStatsChart"></canvas>
    </div>
    <!-- End of carousel -->

</div>
<script>

    let productLables = [], productInfo = [];
    <c:forEach items="${productMonthStats}" var="c">
    productLables.push('${c[0]}/${c[1]}')
    productInfo.push('${c[2]}')
    </c:forEach>

    window.onload = function () {
        productChart("myProductStatsChart", productLables, productInfo)
    }
</script>