<%-- 
    Document   : product-best-user
    Created on : Nov 6, 2021, 6:10:58 AM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
                


    <div class="row ">
        <div class="col-md-12 px-2">
            <div >
                <section class="panel">
                    <header class="panel-heading no-border"><h4>
                            TOP 5 SẢN PHẨM BÁN NHIỀU NHẤT  </h4>
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar"style="height: 800px;">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  

                                    <th>Tên sản phẩm</th>
                                    <th>Giá </th>
                                    <th>Hình ảnh</th>
                                    <th>Số lượng </th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach items="${listTopProduct}" var="c">
                                    <tr>         
                                        <td>                                         
                                            ${c[1]}                                     
                                        </td>
                                        <td> <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${c[2]}"/> đ</td>
<!--                                      
-->                                         <td > <img src="${c[3]}" class="img-thumbnail"alt="${c[3]}" style=" width: 100px;
                                                   height: 100px;
                                                   object-fit: cover;"></td>
                                       
                                        <td> <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${c[4]}"/></td><!--
<!--                                                                                                     -->
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


