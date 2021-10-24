<%-- 
    Document   : product-user-stats
    Created on : Oct 9, 2021, 12:58:15 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
    <div class="row ">
        <div class="col-md-12 px-3">
            <div >
                <section class="panel">
                    <header class="panel-heading no-border">
                        Tất cả sản phẩm được thêm 
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  
                                    <th>STT</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá bán</th>
                                    <th>Hình ảnh</th>
                                    <th>Loại sản phẩm</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listproductStats}" var="c">
                                    <tr>         
                                        <td>
                                            <c:set var="count" value="${count +1}"/>${count}                                         
                                        </td>
                                        <td>${c[1]}</td>

                                        <td>${c[3]} VNĐ</td>
                                        <td > <img src="${c[4]}" class="img-thumbnail"alt="${c[4]}" style=" width: 100px;
                                                   height: 100px;
                                                   object-fit: cover;"></td>
                                        <td>${c[5].getName()}</td>
                                        <td><div class="w3-xlarge"><a href="<c:url value="/user/product-stats/${c[0]}"/>?edit=${c[0]}"><i class="fa fa-pencil-square-o"></i></a></div>
                                            <div class="w3-xlarge"><a href="<c:url value="/user/remove/${c[0]}"/>"><i class="fa fa-trash"></i></a></div>
                                        </td>
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
<!-- End of card -->

<div class="card ">
    <header class="panel">
        Thống kê sản phẩm
    </header>
    <div class="row ">
        <div class="col-md-8 ">
            <div class="card-body">
                <div class ="chart chartjs-render-monitor">
                    <canvas id="myProductStatsChart"></canvas>
                </div>  
            </div>
        </div>
        <div class="col-md-4 ">
            <div class="row panel-heading">
                <div class="card-body " id="rowbody">
                    <div class="row " >
                        <div class="col-sm-12 text-center">
                            <p class="small text-uppercase mb-0">Tổng sản phẩm</p>                         

                            <p class="font-weight-bold ">${count}</p>    


                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <p class="small text-uppercase mb-0">Tổng doanh thu</p>
                            <c:forEach items="${listproductStats}" var="c">  
                                <c:set var="sum" value="0"/>                                                      
                            </c:forEach>   
                            <p class="font-weight-bold ">${sum}</p>  

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <p class="small text-uppercase mb-0">Sản phẩm</p>
                            <p class="font-weight-bold ">2400</p>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  
</div>
<script>

    let productLables = [], productInfo = [];
    <c:forEach items="${listproductStats}" var="c">
    productLables.push('${c[1]}')
    productInfo.push('${c[3]}')
    </c:forEach>

    window.onload = function () {
        productChart("myProductStatsChart", productLables, productInfo)
    }
</script>  
<div >
    <section class="panel">

    </section>
</div>
