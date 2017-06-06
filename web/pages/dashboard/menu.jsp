<%-- 
    Document   : menu
    Created on : 4/06/2017, 07:18:48 PM
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
        <div class="panel panel-default">
            <a href="#" class="">
                Cras justo odio
            </a><br>
            <a href="#" class="">Dapibus ac facilisis in</a><br>
            <a href="#" class="">Morbi leo risus</a><br>
            <a href="#" class="">Porta ac consectetur ac</a><br>
            <a href="#" class="">Vestibulum at eros</a>
        </div>
        
    </body>
</html>
