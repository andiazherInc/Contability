<%-- 
    Document   : contend
    Created on : 4/06/2017, 07:19:32 PM
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
        <div class="panel panel-default contenido">
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
    </body>
</html>
