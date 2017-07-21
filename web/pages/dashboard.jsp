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
        response.sendRedirect("../login.jsp");
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
            
        </div>
        <div class="col-sm-2 no-print" id="menu"> <!--hidden-xs-->
            
        </div>
        <div class="col-sm-10" id="contenido">
            
        </div>
        <div class="col-sm-12" id="footer">
            
        </div>
        </div>
    </body>
    <script>
        
        function load(param){
            var idSession= param;
            if(idSession=="" || idSession =="null" || idSession==undefined){
                $.post("login.jsp", {}, function(data){
                    $("#contend").html(data);
                });
            }
            else{
                var q= "<%=q2%>";
                $.post("pages/dashboard/navbar.jsp"+q, {}, function(data){
                    $("#navbar").html(data);
                });
                
                setTimeout(function() {
                    $( function() {
                        $.post("pages/dashboard/menu.jsp"+q, {}, function(data){
                            $("#menu").html(data);
                        });
                    } );    
                }, 200);
                setTimeout(function() {
                    $( function() {
                        $.post("pages/dashboard/contend.jsp"+q, {}, function(data){
                            $("#contenido").html(data);
                        });
                    } );    
                }, 300);
                $.post("pages/dashboard/footer.jsp"+q, {}, function(data){
                    $("#footer").html(data);
                });
            }
        }
        function search(data){
            try{
                var v = JSON.parse(data);
                setTitleContend("Resultados de busqueda para \"<b>"+v.q+"</b>\"");
                setContendToMenu("<a href=\"?q="+v.q+"&search=1\" >Busqueda avanzada</a>");
                if(v.number=="0"){
                    setContendToContend("<h4>No se han encontrado resultado para <b>\""+v.q+"\"</b>.<h4>")
                }else{

                }    
            }catch(e){
                load("");
            }
            
        }
        load(<%=session.getAttribute("isSession")%>);
        
    </script>
    <style>
        @media print
        {
            .no-print
            {
                display: none !important;
                height: 0;
            }


            .no-print, .no-print *{
                display: none !important;
                height: 0;
            }
        }
       
    </style>
</html>
