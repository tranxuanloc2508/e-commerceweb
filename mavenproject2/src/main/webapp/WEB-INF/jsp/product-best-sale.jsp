<%-- 
    Document   : product-best-sale
    Created on : Oct 27, 2021, 11:18:39 PM
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
                            TOP 10 SẢN PHẨM BÁN NHIỀU NHẤT  </h4>
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
                                <c:forEach items="${listBestProduct}" var="c">
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

