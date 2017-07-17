/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andiazher.contability.controller.parameters;

import com.andiazher.contability.app.App;
import com.andiazher.contability.controller.JSONA;
import com.andiazher.contability.entitie.Entitie;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            if(App.isSession(request,response)){
                try{
                    Entitie navbar = new Entitie(App.TABLE_NAVBAR);
                    Entitie navbarstep = new Entitie(App.TABLE_NAVBARSTEP);
                    JSONA navbars= new JSONA();
                    
                    //REQUEST TO NAVSBAR AND NAVBARSSTEPS FOR ROLE AND USER
                    Entitie rolenav = new Entitie(App.TABLE_ROLENAV);
                    ArrayList<Entitie> regiters = rolenav.getEntitieParam("role", request.getSession().getAttribute("role").toString());                    
                    for(Entitie r: regiters){
                        String idnavbar= r.getDataOfLabel("navbar").toString();
                        if(navbars.getValue(idnavbar)==null){
                            navbar = new Entitie(App.TABLE_NAVBAR);
                            navbar.getEntitieId(idnavbar);
                            navbars.add(navbar.getId(), navbar.getJson());
                        }
                        String idnavbarsteps= r.getDataOfLabel("navbarsteps").toString();
                        navbarstep = new Entitie(App.TABLE_NAVBARSTEP);
                        navbarstep.getEntitieId(idnavbarsteps);
                        JSONA temp= (JSONA) navbars.getValue(idnavbar);
                        JSONA steps = (JSONA) temp.getValue("steps");
                        if(temp.getValue("steps")==null){
                            steps = new JSONA();
                        }
                        steps.add(idnavbarsteps, navbarstep.getJson());
                        temp.add("steps", steps);
                        navbars.add(idnavbar, temp);
                    }
                    //RETURN OF JSON CODE TO SERVER WHIT DATA OF NAVBAR 
                    try (PrintWriter out = response.getWriter()) {
                        out.print(navbars);
                    }
                }catch(NullPointerException s){
                    try (PrintWriter out = response.getWriter()) {
                        JSONA j= new JSONA();
                        j.add("error", "Error: "+s);
                        out.print(j);
                    }                     
                }
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
