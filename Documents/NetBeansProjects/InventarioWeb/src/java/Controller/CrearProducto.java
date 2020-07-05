package Controller;

import DAO.CategoriaDAO;
import DAO.CategoriaDAOImplementar;
import DAO.ProductoDAO;
import DAO.ProductoDAOImplementar;
import Model.Producto;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CrearProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {
        String parametros = request.getParameter("opcion");
        if(parametros.equals("crear")){
            CategoriaDAO categoria = new CategoriaDAOImplementar();
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("lista", categoria.Listar());
             String pagina = "/Vistas-Categorias/CrearProducto.jsp";
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
             dispatcher.forward(request, response);
        }else{
            this.listaProducto(request, response);
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
        Producto producto = new Producto();

        producto.setId_producto(Integer.parseInt(request.getParameter("id_producto")));
        producto.setNom_producto(request.getParameter("txtNom_producto"));
        producto.setStock(Float.parseFloat(request.getParameter("txtCantidad")));
        producto.setPrecio(Float.parseFloat(request.getParameter("txtPrecio")));
        producto.setUnidadMedida(request.getParameter("txtUnidad_Medida"));
        producto.setEstado(Integer.parseInt(request.getParameter("txtEstado")));
        producto.setCategoria_id(Integer.parseInt(request.getParameter("txtCategoria_Producto")));
        

        Date fecha = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nuevoformato = sdf.format(fecha);
        producto.setFecha_entrada(nuevoformato);
        producto.setDes_producto(request.getParameter("txtDescripcion"));
        
        ProductoDAO guardarProducto = new ProductoDAOImplementar(); 
        guardarProducto.guardarPro(producto);
        this.listaProducto(request, response);
    }
        
    protected void listaProducto(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        response.setContentType("text/html;charset=UFT=8");

        ProductoDAO producto = new ProductoDAOImplementar();
        
        HttpSession sesion = request.getSession(true);
        sesion.setAttribute("lista", producto.ListarProducto());
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vistas-Categorias/listarProducto.jsp");
        dispatcher.forward(request, response);
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
