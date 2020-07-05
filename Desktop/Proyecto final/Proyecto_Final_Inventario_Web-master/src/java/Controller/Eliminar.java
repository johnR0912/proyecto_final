
package Controller;

import DAO.CategoriaDAO;
import DAO.CategoriaDAOImplementar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Eliminar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
        System.out.println("Id: " + request.getParameter("id"));
        
        response.setContentType("text/html;charset=UFT=8");
        
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        
        // elimina categoria
        categoria.borrarCat(Integer.parseInt(request.getParameter("id")));
        
        // redirecciona de regreso a la lista de categorias
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/categorias?opcion=listar");
        dispatcher.forward(request, response);
        }finally
       {
           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
           dispatcher.forward(request, response);
       }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}
