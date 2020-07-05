package Controller;

import DAO.CategoriaDAO;
import DAO.CategoriaDAOImplementar;
import Model.Categoria;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Categorias extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // this.listaCategorias(request, response);
       try
       {
        String parametros = request.getParameter("opcion");
        if(parametros.equals("crear")){
             String pagina = "/Vistas-Categorias/crearCategoria.jsp";
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
             dispatcher.forward(request, response);
        }else{
            this.listaCategorias(request, response);
        }
        }finally
       {
           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
           dispatcher.forward(request, response);
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Categoria categoria = new Categoria();
        
        System.out.println("id_categoria: " + request.getParameter("id_categoria"));
        System.out.println("txtNomCategoria: " + request.getParameter("txtNomCategoria"));
        System.out.println("txtEstadoCategoria: " + request.getParameter("txtEstadoCategoria"));
        categoria.setId_categoria(Integer.parseInt(request.getParameter("id_categoria")));
        categoria.setNom_categoria(request.getParameter("txtNomCategoria"));
        categoria.setEstado_categoria(Integer.parseInt(request.getParameter("txtEstadoCategoria")));
        
        CategoriaDAO guardarCategoria  = new CategoriaDAOImplementar();
        
        guardarCategoria.guardarCat(categoria);
        this.listaCategorias(request, response);
    }
    
    protected void listaCategorias(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        response.setContentType("text/html;charset=UFT=8");
        
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        
        HttpSession sesion = request.getSession(true);
        sesion.setAttribute("lista", categoria.Listar());
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vistas-Categorias/listarCategorias.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
