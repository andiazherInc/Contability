<%-- 
    Document   : edit
    Created on : Jul 30, 2017, 7:48:50 PM
    Author     : diaan07
--%>

<%@page import="com.andiazher.contability.app.App"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sessionId="";
    String key="";
    try{      
        if(!App.isSession(request, response)){
            response.sendRedirect("../../login.jsp");
        }
    }
    catch(NullPointerException s){
        response.sendRedirect("../../login.jsp");
    }  
    try{
        sessionId = request.getParameter("sessionId");
        key= request.getParameter("key");
    }
    catch(NullPointerException s){}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MOVIMIENTOS</title>
    </head>
    <body>
        <div>
            <h3 id="nameaccount">CUENTA: <b>--</b></h3>
            
        </div>
    </body>
    <script>
        
    </script>
</html>
