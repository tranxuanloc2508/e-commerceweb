<%-- 
    Document   : product-stats
<<<<<<< HEAD
    Created on : Oct 7, 2021, 3:27:23 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
=======
    Created on : Oct 6, 2021, 11:40:03 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>Thong ke doanh thu theo san pham </h1>

<form action="">
    <div class="form-group">
        <label>Tu khoa</label>
        <input type="text" name="kw" class="form-control"/>
    </div>
     <div class="form-group">
        <label>Tu thoi diem</label>
        <input type="date" name="fromDate" class="form-control"/>
    </div>
     <div class="form-group">
        <label>Tu khoa</label>
        <input type="date" name="toDate" class="form-control"/>
    </div>
    <input type="submit" value="Bao cao" class="btn btn-success"/>
</form>
<div>
  <canvas id="myProductStatsChart"></canvas>
</div>
 
 
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
<table class="table">
    <tr>
        <th>Ma san pham</th>
        <th>Ten san pham</th>
        <th>Doanh thu</th>
<<<<<<< HEAD
        
    </tr>
    <c:forEach items="${productStats}" var="c">
         <tr>
        <td>${c[0]}</td>
        <td>${c[1]}</td>
        <td>${c[2]}</td>
        
    </tr>
    </c:forEach>
    
</table>
<div >
    <section class="panel">
        <header class="panel-heading no-border">
            Tất cả sản phẩm
        </header>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th></th>
                    <th>Mã sản phẩm</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá tiền</th>
                    <th>Loại sản phẩm</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${productStats}" var="c">
                    <tr>
                        <td>${c[0]}</td>
                        <td>${c[1]}</td>
                        <td>${c[2]}</td>
                        <td>${c[2]}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</div>
<div>
    <canvas id="myProductStatsChart"></canvas>
</div>
<script>
    let productLabel =[], productInfo=[];
    
    <c:forEach items="${productStats}" var="c">
       productLabel.push('${c[1]}')
       productInfo.push(${c[2]})
    </c:forEach>
    window.onload = function (){
        productChart("myProductStatsChart",  productLabel, productInfo)
=======
    </tr> 
    <c:forEach items="${productStats}" var="c">
        <tr>
            <th>${c[0]}</th>
            <th>${c[1]}</th>
            <th>${c[2]} VND</th>
        </tr> 
    </c:forEach>
</table>
 


<script>
    
    let productLables =[],productInfo=[];
    <c:forEach items="${productStats}" var="c">
        productLables.push('${c[1]}')
        productInfo.push('${c[2]}')
    </c:forEach>
    
    window.onload= function(){
        productChart("myProductStatsChart",productLables,productInfo)
>>>>>>> 711fa24087c377ff428056fc17c0fa17e0a40a3b
    }
</script>