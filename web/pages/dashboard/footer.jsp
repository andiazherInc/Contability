<%-- 
    Document   : footer
    Created on : 4/06/2017, 07:19:04 PM
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
        <title>FOOTER</title>
    </head>
    <body>
        <br>
        <p class="text-right" id="copyright" style="color:white;">by andiazher Inc &copy; </p>
    </body>
    <script>
        function loadCopyri(){
            var date = new Date().getFullYear();
            $("#copyright").html("by andiazher Inc &copy; "+date);
        }
        loadCopyri();
    </script>
</html>
