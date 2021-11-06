<!--
    Created on : Oct 6, 2021, 11:40:03 PM
    Author     : LocNe-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

                  
<h1>TẤT CẢ SẢN PHẨM </h1>
<div class="card panel">
    <div class="row ">
        <div class="col-md-12 px-2">
            <div >
                <section class="panel">
                    <header class="panel-heading no-border"><h4>
                            Thông tin tất cả sản phẩm </h4>
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  
                                    <th>Mã SP</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Đơn giá </th>
<!--                                    <th>Số lượng </th>
                                    <th>Hình ảnh</th>                                                                  -->
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach items="${productStats}" var="c">
                                    <tr>         
                                        <td>                                         
                                            SP${c[0]}                                         
                                        </td>
                                        <td>${c[1]}</td>
                                        <td><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${c[2]}"/> đ</td>
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
    <c:forEach items="${productStats}" var="c">
    productLables.push('SP${c[0]}')
    productInfo.push('${c[2]}')
    </c:forEach>

    window.onload = function () {
        productChart("myProductStatsChart", productLables, productInfo)
    }
</script>