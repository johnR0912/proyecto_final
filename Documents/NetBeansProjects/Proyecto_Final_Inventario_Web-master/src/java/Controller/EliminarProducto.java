package Controller;

import DAO.ProductoDAO;
import DAO.ProductoDAOImplementar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EliminarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UFT=8");
                try
                {
        
        ProductoDAO categoria = new ProductoDAOImplementar();
        
        // elimina categoria
        categoria.borrarPro(Integer.parseInt(request.getParameter("id_producto")));
        
        // redirecciona de regreso a la lista de categorias
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/crearProducto?opcion=listar");
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
