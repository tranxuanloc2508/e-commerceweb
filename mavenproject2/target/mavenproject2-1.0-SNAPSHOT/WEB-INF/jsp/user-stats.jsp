<%-- 

    Document   : user-stats
    Created on : Oct 7, 2021, 2:13:54 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="card" style="height: 700px">
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
                                    <th>Mã ID</th>
                                    <th>Họ </th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>


                                </tr> 
                            </thead>
                            <tbody>
                                <c:forEach items="${userStats}" var="c">
                                    <tr>
                                        <th>SID${c[0]}</th>
                                        <th>${c[2]}</th>
                                        <th>${c[1]}</th>
                                        <th>${c[3]}</th>
                                        <th>${c[4]}</th>


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
