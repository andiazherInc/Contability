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
        <h3 class="text-center">LISTA DE CUENTAS</h3>
        <div class="col-sm-6">
            <div class=" panel panel-default">
                <div class="panel-heading">Summary Acounts</div>
                <div class="panel-body">
                    Graphics
                </div>
            </div>
        </div>
        
        <table class="table table-bordered table-striped table-hover table-condensed" id="tableAccounts">
            <thead>
                <tr>
                    <th  class="text-center">ID</th>
                    <th  class="text-center">ACCOUNT</th>
                    <th  class="text-center">TOTAL</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>00000000000001</td>
                    <td>ACCOUNT PRINCIPAL</td>
                    <td class="text-right">$2.000.000</td>
                </tr>
                <tr>
                    <td>00000000000001</td>
                    <td>ACCOUNT PRINCIPAL</td>
                    <td class="text-right">$2.000.000</td>
                </tr>
            </tbody>
            
            
            
            
        </table>
    </body>
    
</html>
