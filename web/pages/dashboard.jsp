<%-- 
    Document   : dashboard
    Created on : 23/04/2017, 01:01:12 AM
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{      
        if(!session.getAttribute("isSession").equals("true")){
            response.sendRedirect("../login.jsp");
        }
    }
    catch(NullPointerException s){
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <div id="navbar">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#reload">SCP</a>
                  </div>

                  <!-- Collect the nav links, forms, and other content for toggling -->
                  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                      <li class="active"><a href="#">Link1 <span class="sr-only">(current)</span></a></li>
                      <li><a href="#">Link2</a></li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="#">One more separated link</a></li>
                        </ul>
                      </li>
                    </ul>
                      <form class="navbar-form navbar-left" action="#search" method="get">
                      <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for..." name="q">
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="submit">Go!</button>
                            </span>
                          </div><!-- /input-group -->
                      </div>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                      <!--<li><a href="#"></a></li> -->
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Username<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                          <li><a href="#profile">Profile</a></li>
                          <li><a href="#editProfile">Edit Profile</a></li>
                          <li role="separator" class="divider"></li>
                          <li><a href="#logoutUser" onclick="logout()">Logout</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
        </div>
    </body>
    <script>
        function logout() {
            var para="logout";
            $.post("loginApp", {param: para}, function(data){
                $("#contend").html(data);
            });
        }
    </script>

</html>
