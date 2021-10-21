<%-- 
    Document   : edit-profile
    Created on : Oct 10, 2021, 3:15:09 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<c:url value="/user/${pageContext.request.userPrincipal.name}" var="save"/>
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-sm-10"><h1>${user.id}</h1></div>
        <div class="col-sm-2"><a href="<c:url value="/"/>" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a></div>
    </div>
    <div class="row">
        <div class="col-sm-3"><!--left col-->


            <div class="text-center">
                <img src="${user.image}" class="avatar img-circle img-thumbnail" alt="avatar">
                <!--<h6>Upload a different photo...</h6>-->
                <!--<input type="file" class="text-center center-block file-upload">-->
            </div></hr><br>


            <div class="panel panel-default">
                <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                <div class="panel-body"><a href="http://bootnipets.com">bootnipets.com</a></div>
            </div>


            <ul class="list-group">
                <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
            </ul> 

            <div class="panel panel-default">
                <div class="panel-heading">Social Media</div>
                <div class="panel-body">
                    <i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
                </div>
            </div>

        </div><!--/col-3-->
        <div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Home</a></li>

                <!--                <li><a data-toggle="tab" href="#messages">Menu 1</a></li>
                                <li><a data-toggle="tab" href="#settings">Menu 2</a></li>-->
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <hr>
                    <form:form class="form" method="post" modelAttribute="user"   enctype="multipart/form-data">
                        <form:input type="hidden" id="id" path="id" value="${user.id}"/>
                        <form:input type="hidden" id="username" path="username" value="${user.username}"/>
                        <form:input type="hidden" id="userRole" path="userRole" value="${user.userRole}"/>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="first_name"><h4>First name</h4></label>
                                <form:input type="text" class="form-control" path="firstname" id="first_name" value="${user.firstname}"/>
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="last_name"><h4>Last name</h4></label>
                                <form:input type="text" class="form-control" path="lastname"  id="last_name" value="${user.lastname}" />
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="phone"><h4>Phone</h4></label>
                                <form:input type="text" class="form-control" path="phone" id="phone" value="${user.phone}" />
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="email"><h4>Email</h4></label>
                                <form:input type="email" class="form-control" path="email" id="email" value="${user.email}"/>
                            </div>
                        </div>

                        <div class="form-group">                      
                            <div class="col-xs-6">
                                <label for="password"><h4>Password</h4></label>
                                <form:input type="password" class="form-control" path="password" id="password" placeholder="password"/>
                            </div>
                        </div>
                        <div class="form-group">                   
                            <div class="col-xs-6">
                                <label for="password2"><h4>ConfrimPassword</h4></label>
                                <form:input type="password" class="form-control" path="confirmPassword" placeholder="Confirm Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="image">Anh san pham</label>
                            <form:input type="file" id="image" path="file" value="${user.image}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>
                                <button class="btn btn-lg btn-success" type="submit" ><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               	<!--<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>-->
                            </div>
                        </div>
                    </form:form>
                    <%--</c:forEach>--%>
                    <hr>

                </div><!--/tab-pane-->

                <!--                <div class="tab-pane" id="settings">
                                    <hr>
                                    <form class="form" action="##" method="post" id="registrationForm">
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="first_name"><h4>First name</h4></label>
                                                <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                                            </div>
                                        </div>
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="last_name"><h4>Last name</h4></label>
                                                <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                                            </div>
                                        </div>
                
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="phone"><h4>Phone</h4></label>
                                                <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                                            </div>
                                        </div>
                
                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <label for="mobile"><h4>Mobile</h4></label>
                                                <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                                            </div>
                                        </div>
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="email"><h4>Email</h4></label>
                                                <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                                            </div>
                                        </div>
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="email"><h4>Location</h4></label>
                                                <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                                            </div>
                                        </div>
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="password"><h4>Password</h4></label>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                                            </div>
                                        </div>
                                        <div class="form-group">
                
                                            <div class="col-xs-6">
                                                <label for="password2"><h4>Verify</h4></label>
                                                <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <br>
                                                <button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                
                            </div>/tab-pane-->
            </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
</div>
<script type="text/javascript">
    $(document).ready(function () {


        var readURL = function (input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.avatar').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }


        $(".file-upload").on('change', function () {
            readURL(this);
        });
    });</script>