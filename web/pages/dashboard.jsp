<%-- 
    Document   : dashboard
    Created on : 23/04/2017, 01:01:12 AM
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String q="";
    String q2="";
    String user="";
    try{      
        if(!session.getAttribute("isSession").equals("true")){
            response.sendRedirect("../login.jsp");
        }
        else{
            user = session.getAttribute("user").toString();
        }
    }
    catch(NullPointerException s){
    }
    try{
        if(!request.getParameter("q").equals("null")){
            q = request.getParameter("q");
            q2 = "?q="+request.getParameter("q");
        }
    }catch(NullPointerException s){
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body >
        <div class="">
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
                      <a class="navbar-brand" href="#reload" onclick="reloadAll()">SCP</a>
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
                            <input type="text" class="form-control" placeholder="Search for..." name="q" value="<%=q%>">
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="submit">Go!</button>
                            </span>
                          </div><!-- /input-group -->
                      </div>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                      <!--<li><a href="#"></a></li> -->
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="username"><%=user%><span class="caret"></span></a>
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
        <div class="col-sm-2 panel panel-default">
            <div class="panel-body">
                <li><a href="" >Menu Hello as google nav</a></li>
               <li></li>
               <li>Menu1</li>
               <li>Menu Hello as google nav</li>
               <li>Menu1</li> 
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
               <li>Menu Hello as google nav</li>
            </div>
        </div>
        <div class="col-sm-10" >
            <div class="panel panel-default">
                <div class="panel-heading">
                    <b>Title</b>
                </div>
                <div class="panel-body">
                    <p>
                        Includes over 250 glyphs in font format from the Glyphicon 
                        Halflings set. Glyphicons Halflings are normally not available 
                        for free, but their creator has made them available for Bootstrap 
                        free of cost. As a thank you, we only ask that you 
                        include a link back to Glyphicons whenever possible.
                    </p>
                </div>
                <div class="panel-footer">
                    Hello
                </div>
            </div>
        </div>
        <div class="col-sm-12" style="background: burlywood;">
            <p class="text-right">All rigths reservate</p>
        </div>
        </div>
    </body>
    <script>
        function logout() {
            var para="logout";
            $.post("loginApp", {param: para}, function(data){
                $("#contend").html(data);
            });
        }
        function reloadAll(){
            var q="<%=q2%>";
            $.post("pages/dashboard.jsp"+q, {}, function(data){
                $("#contend").html(data);
            });
        }
        function laodName(){
            var username= "<%=user%>";
            $.post("loginParamters", {user: username}, function(data){
                if(data!=0){
                    $("#username").html(data +"<span class=\"caret\">");
                }
            });
        }
        laodName();
    </script>

</html>
