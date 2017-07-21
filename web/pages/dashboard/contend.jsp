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
        <title>CONTEND - THIS CONTEN IS NO UPDATE</title>
    </head>
    <body>
        <div class="panel panel-default contenido" > <!--style="background: transparent;"-->
                <div class="panel-heading" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"> <!--background-color: black; opacity: 0.9; color: white;-->
                    <span class="glyphicon glyphicon-th" aria-hidden="true"></span> <titleContend id="titleContend">Loading title of contend ....</titleContend>
                </div>
                <div class="panel-body " id="content"> <!--style="background-color: black; opacity: 0.8; color: white;"-->
                    Loading contend, please wait ....
                </div>
                <div class="panel-footer">
                    
                </div>
        </div>
    </body>
    <script type="text/javascript">
        function setTitleContend(title){
            $("#titleContend").html(title);
        }
        function setContendToContend(html){
            $("#content").html(html);   
        }
    </script>
</html>
