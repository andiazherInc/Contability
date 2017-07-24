<%-- 
    Document   : index
    Created on : Jul 21, 2017, 12:56:06 AM
    Author     : diaan07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{      
        if(!session.getAttribute("isSession").equals("true")){
            response.sendRedirect("../../login.jsp");
        }
    }
    catch(NullPointerException s){
        response.sendRedirect("../../login.jsp");
    }  
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LISTA DE CUENTAS</title>    
    </head>
    
    <body>        
        <div class="col-md-6">
            <div class=" panel panel-success">
                <div class="panel-body">
                    <div class="ct-chart ct-perfect-fourth"></div>
                </div>
                <div class="panel-footer"><small>Comportamientos de saldos en el año</small></div>
            </div>
        </div>
        <div class="col-md-6">
            <h3 class="text-center">SALDOS DE CUENTAS</h3>
            <table class="table table-bordered table-striped table-hover table-condensed" id="tableAccounts">
                <thead>
                    <tr>
                        <th  class="text-center">ID</th>
                        <th  class="text-center">ACCOUNT</th>
                        <th  class="text-center">TOTAL</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                    <!--HERE DATA ACCOUNTS -->
                </tbody>
            </table>
        </div>    
    </body>    
    <script>
        var data = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
              series: [
              [5, 4, 3, 7, 5, 10, 3, 4, 8, 10, 6, 8],
              [3, 2, 9, 5, 4, 6, 4, 6, 7, 8, 7, 4]
            ]
          };

          // Create a new line chart object where as first parameter we pass in a selector
          // that is resolving to our chart container element. The Second parameter
          // is the actual data object.
          new Chartist.Line('.ct-chart', data);
    </script>
    <script>
        function loadAccounts(){
            $.post("dataAccounts", {}, function(data){
                var v = JSON.parse(data);
                $("#tableBody").html("");
                var isfirst=true;
                if(v.error!=""){
                    for(i in v){
                        row= v[i];
                        $("#tableBody").append(" <tr><td class=\"text-center\">"+row.number+"</td><td style=\"table-layout:fixed;\">"+row.name+"</td><td class=\"text-right\">$0</td></tr>");
                    }
                }else{
                  $("#tableBody").append("Error. No loads data accounts, please comunicate with administrator");
                }
            });
        }
        loadAccounts();
    </script>
</html>
