
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vistas-Categorias/ModificarUsuario.jsp");
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
}
