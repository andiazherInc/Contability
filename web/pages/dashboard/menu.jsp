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
        <div class="panel panel-default" > <!--style="background: transparent;"-->
            <div class="panel-heading" > <!--style="background-color: black; opacity: 0.9; color: white;"-->
                <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> Options
            </div>
            <div class="panel-body " style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;" id="contentMenu"> <!-- style="background-color: black; opacity: 0.8; color: white;"-->
                Loading menus, please wait .... 
            </div>
            <div class="panel-footer" > <!--style="background-color: black; opacity: 0.9; color: white;"-->
                
            </div>
            
        </div>
    </body>
    <script type="text/javascript">
        function setContendToMenu(html){
            $("#contentMenu").html(html);   
        }
        function loadMenus(){
            $.post("menusContent", {}, function(data){
                var v = JSON.parse(data);
                $("#contentMenu").html("");
                var isfirst=true;
                if(v.error!=""){
                    for(i in v){
                        menu= v[i];
                        if (menu.ispageorurl=="1") {
                            $("#contentMenu").append("<a href=\"#"+menu.name+"\">"+menu.name+"</a><br>");
                            if(isfirst){
                                setTitleContend(menu.name);
                                $.post(""+menu.page, {}, function(data){
                                    setContendToContend(data);
                                });
                                isfirst=false;
                            }
                        }else{
                            $("#contentMenu").append("<a href=\""+menu.page+"\" target=\"_blank\">"+menu.name+"<a><br>");
                        }
                        
                    }
                }else{
                  $("#contentMenu").append("Error. No loads menus");
                }
            });
        }
    </script>
</html>
