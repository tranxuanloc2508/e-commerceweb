<%-- 
    Document   : order-user-stats
    Created on : Oct 11, 2021, 1:49:02 PM
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
                        Tất cả sản phẩm
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  
                                    <th>STT</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Mô tả</th>
                                    <th>Giá bán</th>
                                    <th>Loại sản phẩm</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                  <c:set var="count" value="0"/>
                                <c:forEach items="${saleStats}" var="c">
                                    <tr>         
                                        <td>
                                             
                                            <c:set var="count" value="${count +1}"/>${count}                                         
                                        </td>
                                        <td>${c[1]}</td>
                                        <td>${c[2]}</td>
                                        <td>${c[3]} VNĐ</td>
                                        <td>${c[4].getName()}</td>
                                        <td>${c[5]}</td>
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
                          <p class="small text-uppercase mb-0">Tổng dơn hàng</p>
                           <c:set var="sum" value="0"/>
                           
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
    
    let productLables =[],productInfo=[];
    <c:forEach items="${saleStats}" var="c">
        productLables.push('${c[1]}')
        productInfo.push('${c[3]}')
    </c:forEach>
    
    window.onload= function(){
        productChart("myProductStatsChart",productLables,productInfo)
    }
</script>  
<div >
    <section class="panel">
      
    </section>
</div>
