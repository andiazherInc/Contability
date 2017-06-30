/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andiazher.contability.controller.parameters;

import com.andiazher.contability.app.App;
import com.andiazher.contability.controller.Json;
import com.andiazher.contability.entitie.Entitie;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andre
 */
public class NavBarContent extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            if(request.getSession().getAttribute("isSession").equals("true")){
                try{
                    Entitie navbar = new Entitie(App.TABLE_NAVBAR);
                    Json json= new Json();
                    for(Entitie nv : navbar.getEntities()){
                        json.add(nv.getId(), nv.getJson());
                    }
                    try (PrintWriter out = response.getWriter()) {
                        out.print(json);
                    }
                }catch(NullPointerException s){
                    try (PrintWriter out = response.getWriter()) {
                        Json j= new Json();
                        j.add("error", "Error: "+s);
                        out.print(j);
                    }                     
                }
            }else{
                response.sendRedirect("login.jsp?error=Credenciales+invalidas");
            }
        }
        catch(NullPointerException s){
            response.sendRedirect("login.jsp?error=Credenciales+invalidas");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(NavBarContent.class.getName()).log(Level.SEVERE, null, ex);
        }
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
