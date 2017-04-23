<%-- 
    Document   : login.jsp
    Created on : 22/04/2017, 06:14:53 PM
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="">
            <nav class="navbar navbar-default navbar-static-top">
                <h3 class="col-md-offset-1 col-sm-offset-2">Sistema de Contabilidad <small>by andiazher Inc</small></h3>
            </nav>
        </div>
        <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                  <h1 class="panel-title text-center">Login</h1>
                </div>
                <div class="panel-body">
                    <p class="text-center text-danger" id="error"></p>
                    <form action="loginApp#login?key=<%session.getId();%>" id="loginForm" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Username</label>
                            <input type="text" class="form-control" id="exampleInputEmail1"  name="user" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" name="pass" placeholder="Password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success btn-block">Access</button>
                        </div>
                        
                    </form>
                </div>
              </div>
        </div>
                        
<script>
     $(document).ready(function(){
        $("#loginForm").submit(function(){
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data){
                        $( "#error" ).html(data);
                    }
                })
                return false;
        });
    });
</script>
    </body>
</html>
