<%-- 
    Document   : nabvar
    Created on : 4/06/2017, 07:18:28 PM
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String q="";
    String q2="";
    String user="";
    try{      
        if(!session.getAttribute("isSession").equals("true")){
            response.sendRedirect("../../login.jsp");
        }
        else{
            user = session.getAttribute("user").toString();
        }
    }
    catch(NullPointerException s){
        response.sendRedirect("../../login.jsp");
    }
    try{
        if(!request.getParameter("q").equals("null")){
            q = request.getParameter("q");
            q2 = "?q="+request.getParameter("q");
        }
    }catch(NullPointerException s){
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <nav class="navbar navbar-default" > <!--style="background: transparent;-->
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
                    <ul class="nav navbar-nav" id="menusnavbar">
                      <li class="active"><a href="#">Link1</a></li>
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
                              <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
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
        function loadNavbar(){
            $.post("navBarContent", {}, function(data){
                var v = JSON.parse(data);
                if(v.error!=""){
                    for(i in v){
                        menu= v[i];
                        if(menu.ISDROPDOWN=="1"){
                          $("#menusnavbar").append("<li class=\"dropdown\"><a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">"+menu.NAME+"<span class=\"caret\"></span></a></li>");  
                        }
                        else{
                          if (menu.ISURLORMETHOD=="1") {
                            $("#menusnavbar").append("<li><a href=\"#"+menu.NAME+"\" onclick=\""+menu.URLORMETHOT+"\">"+menu.NAME+"</a></li>");  
                          }else{
                            $("#menusnavbar").append("<li><a href=\""+menu.URLORMETHOT+"\">"+menu.NAME+"</a></li>");
                          }
                        }
                        
                    }
                }
            });
        }
        setTimeout(function() {
          $( function() {
            loadNavbar();      
          } );    
        }, 200);
        
    </script>
    
</html>

