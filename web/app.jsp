<%-- 
    Document   : app.jsp
    Created on : 22/04/2017, 05:20:40 PM
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="pages/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="pages/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="pages/js/jquery-3.2.1.js"></script>
        <script src="pages/js/jquery-ui.js"></script>
        <!--<script src="pages/js/jquery.mobile.custom.js"></script> -->
        <script src="pages/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        
        <title>SCP | andiazher Inc</title>
        
    </head>
    <body>
        <div id="contend">
            <h2>Loading application..</h2>
        </div>
    <script>
        function load(param){
            var idSession= param;
            if(idSession=="" || idSession =="null" || idSession==undefined){
                $.post("login.jsp", {}, function(data){
                    $("#contend").html(data);
                });
            }
            else{
                $.post("pages/dashboard.jsp", {}, function(data){
                    $("#contend").html(data);
                });
            }
        }
        load(<%=session.getAttribute("isSession")%>);
    </script>
    </body>
</html>
