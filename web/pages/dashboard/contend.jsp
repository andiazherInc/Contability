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
                    <iconandiazher id="iconandiazhercontend"><span class="glyphicon glyphicon-th" aria-hidden="true"></span></iconandiazher> 
                    <titleContend id="titleContend"><img src="pages/images/loading_spinner.gif" height="15" width="15">
                        Loading title of contend ....</titleContend>
                </div>
                <div class="panel-body " id="content"> <!--style="background-color: black; opacity: 0.8; color: white;"-->
                    <img src="pages/images/loading_spinner.gif" height="32" width="32">
                    Loading contend, please wait ....
                </div>
                <div class="panel-footer">
                    
                </div>
        </div>
    </body>
    <script type="text/javascript">
        function addLoading(){
            $("#content").prepend("<div class=\" text-center\" role=\"alert\" style=\" position: fixed; \"><img src=\"pages/images/loading_spinner.gif\" height=\"32\" width=\"32\">  Loading contend, please wait ....</div>");   
        }
        function addError(){
            $("#content").prepend("<div class=\"alert alert-danger alert-dismissibl text-center\" role=\"alert\" style=\"  \"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button> Error. NO has pisible loading the content</div>");   
        }
        function setTitleContend(title){
            $("#titleContend").html(title);
        }
        function setContendToContend(html){
            $("#content").html(html);   
        }
        function loadContend(titleName, url){
            addLoading();
            $("#iconandiazhercontend").html("");
            setTitleContend("<img src=\"pages/images/loading_spinner.gif\" height=\"15\" width=\"15\"> "+titleName);
            try{
                $.post(""+url, {}, function(data){
                    setTitleContend(titleName);
                    $("#iconandiazhercontend").html("<span class=\"glyphicon glyphicon-th\" aria-hidden=\"true\"></span>");
                    setContendToContend(data);
                });
            }catch(err){
                setContendToContend("I DO NOT LOAD THE CONTEND: " +err);
            }
        }
    </script>
</html>
