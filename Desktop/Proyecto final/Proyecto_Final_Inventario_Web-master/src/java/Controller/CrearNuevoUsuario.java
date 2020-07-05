package Controller;

import DAO.UsuarioDAO;
import DAO.UsuarioDAOImplementar;
import Model.Usuario;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CrearNuevoUsuario extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
        String parametros = request.getParameter("opcion");
        if(parametros.equals("crear")){
             String pagina = "/Vistas-Categorias/CrearNuevoUsuario.jsp";
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
             dispatcher.forward(request, response);
        }else{
            this.listaUsuario(request, response);
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
        Usuario usuario = new Usuario();

        usuario.setId(Integer.parseInt(request.getParameter("id")));
        usuario.setNombre_usuario(request.getParameter("txtNombre_usuario"));
        usuario.setApellido_usuario(request.getParameter("txtApellido_usuario"));
        usuario.setCorreo_usuario(request.getParameter("txtCorreo_usuario"));
        usuario.setUsuario(request.getParameter("txtUsuario"));
        usuario.setClave(request.getParameter("txtClave"));
        usuario.setTipo(Integer.parseInt(request.getParameter("tipo")));
        usuario.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
        usuario.setPregunta(request.getParameter("pregunta"));
        usuario.setRespuesta(request.getParameter("txtRespuesta"));
        Date fecha = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nuevoformato = sdf.format(fecha);
        usuario.setFecha_registro(nuevoformato); 
        
        UsuarioDAO guardarUsuario = new UsuarioDAOImplementar(); 
        guardarUsuario.GuardarUsuario(usuario);
        this.listaUsuario(request, response);
        
    }

    
    protected void listaUsuario(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        response.setContentType("text/html;charset=UFT=8");
        
        try
        {
        UsuarioDAO usuario = new UsuarioDAOImplementar();
        
        HttpSession sesion = request.getSession(true);
        sesion.setAttribute("lista", usuario.ListarUsuario());
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vistas-Categorias/listarUsuario.jsp");
        dispatcher.forward(request, response);
        }finally
       {
           RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
           dispatcher.forward(request, response);
       }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
