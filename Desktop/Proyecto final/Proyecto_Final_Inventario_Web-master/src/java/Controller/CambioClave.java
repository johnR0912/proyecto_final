/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UsuarioDAO;
import DAO.UsuarioDAOImplementar;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Guido
 */
@WebServlet(name = "CambioClave", urlPatterns = {"/cambioclave.do"})
public class CambioClave extends HttpServlet {

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
        
        Usuario usuario = new Usuario();
        UsuarioDAO acceso = new UsuarioDAOImplementar();
        String clave1 = request.getParameter("txtclave1");
        String clave2 = request.getParameter("txtclave2");
        
        usuario.setUsuario(request.getParameter("txtusuario"));
            
            if(clave1 == null ? clave2 == null : clave1.equals(clave2))
            {
                if(acceso.Actualizarclave(usuario.getUsuario(), clave1))
                {
                     HttpSession sesion = request.getSession(true);                 
                    sesion.setAttribute("usuario", usuario);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                }
                else
                {
                    
                }
                
            }
            else
                
            {
                 request.setAttribute("mensaje","Las contraseñas no coinciden");
                 request.setAttribute("usuario",usuario.getUsuario());
                 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cambioclave.jsp");
                 dispatcher.forward(request, response);
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
