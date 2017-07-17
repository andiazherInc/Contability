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
        <div style="text-shadow: 2px 0px 1px black;">
            <br>
            <p class="text-right" id="copyright" style="color:white;">by <a href="http://andiazher.com/about?ref=Software+Accounting&V=1.0">andiazher Inc</a> &copy;   </p>
            <p class="text-right no-print" style="color:white;">Software Accounting - Team andiazher Software - V1.0</p>    
            <br>
        </div>
        
        
    </body>
    <script>
        function loadCopyri(){
            var date = new Date().getFullYear();
            $("#copyright").html("by <a href=\"http://andiazher.com/about?ref=Software+Accounting&V=1.0\">andiazher Inc</a> &copy; "+date+"    ");
        }
        loadCopyri();
    </script>
</html>
