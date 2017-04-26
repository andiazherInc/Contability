/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andiazher.contability.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andre
 */
public class LoginApp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String param1 = request.getParameter("param");
            if(param1.equals("login")){
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
                if(user.isEmpty() || pass.isEmpty()){
                    response.sendRedirect("login.jsp?error=Usuario o contraseña no pueden estas vacios");
                }
                else{
                    //CONSULT USER AND PASS IN BD
                    if(user.equals("admin") && pass.equals("nada")){
                        Calendar fecha = new GregorianCalendar();
                        String f= fecha.get(Calendar.YEAR) +"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DAY_OF_MONTH)
                                +" "+fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)+":"+fecha.get(Calendar.SECOND);
                        System.out.println("The user "+user+" has login at "+ f);
                        request.getSession().setAttribute("isSession", "true");
                        response.sendRedirect("app.jsp");
                    }
                    else{
                        response.sendRedirect("login.jsp?error=Credenciales+invalidas");
                    }
                }
            }
            if(param1.equals("logout")){
                request.getSession().setAttribute("isSession", "");
                response.sendRedirect("login.jsp?logout=true");
            }
        }
        catch(NullPointerException s){
            s.printStackTrace();
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
