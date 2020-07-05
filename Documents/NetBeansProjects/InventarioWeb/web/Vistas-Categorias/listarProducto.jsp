<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.CategoriaDAOImplementar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "Model.Producto"%> 
<jsp:useBean id= "lista" scope="session" class= "java.util.List"/>
          
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL DE INVENTARIO</title>
        <%@include file= "../WEB-INF/Vistas-Parciales/css-js.jspf" %>
            <script type="text/javascript" class="init">
	
$(document).ready(function() {
	$('#example').DataTable();
} );

	</script>
    </head>
    <body>
        <%@include file= "../WEB-INF/Vistas-Parciales/encabezado.jspf" %>
        <h1>BIENVENID@!</h1>
        <div style="width: 100%">
            <a href="<%= request.getContextPath()%>/crearProducto?opcion=crear" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nuevo Producto</a>
            <form align="right" action="/InventarioWeb/Productos">
                <input class="bt btn-info btn-sm" type="submit" value="PDF"/>
            </form>
            <h3>Listado de Producto</h3>
            <table id="example" class="table table-striped table-bordered">
        <thead>
            <tr>
                <tr>
                    <th>ID</th><th>NOMBRE_PRODUCTO</th><th>STOCK</th><th>PRECIO</th><th>UNIDAD_MEDIADA</th><th>ESTADO_PRODUCTO</th><th>CATEGORIA</th><th>DESCRIPCION</th><th></th>
                </tr>
                </thead>
        <tbody>
                <%
                    CategoriaDAOImplementar nuevo =  new CategoriaDAOImplementar();
                    for(int i = 0; i < lista.size(); i++){
                         Producto producto = new Producto();
                         producto = (Producto)lista.get(i);
                    
                %>
                <tr>
                    <td><%= producto.getId_producto()%></td>
                    <td><%= producto.getNom_producto()%></td>
                    <td><%= producto.getStock()%></td>  
                    
                    <%
                    NumberFormat formatter = new DecimalFormat("#.00");
                    
                    
                    %>
                    <td>$<%= formatter.format(producto.getPrecio())%></td>
                    <td><%= producto.getUnidadMedida()%></td>
                    
                     <% 
                    switch(producto.getEstado())
                    {
                        case 1:
                         %>
                         <td><font color="#31B404"><b>Activo</b></font></td> 
                        <%
                           break;
                             default:
                          %>
                         <td><font color="#8A0808"><b>Inactivo</b></font></td> 
                        <% 
                            break;
                    }
                        
                    %>
                    
                    <td><%= nuevo.NombreCategoria(producto.getCategoria_id()) %></td>
                    <td><%= producto.getDes_producto()%></td>
                    <td>
                        <a href="<%= request.getContextPath()%>/editarProducto?opcion=editar&id_producto<%= producto.getId_producto()%>&Producto=<%= producto.getNom_producto()%>&stock=<%= producto.getStock()%>&precio=<%= producto.getPrecio()%>&unidadmedida=<%= producto.getUnidadMedida()%>&estado_producto=<%=producto.getEstado()%>&categoria=<%= producto.getCategoria_id()%>&fecha_entrada=<%= producto.getFecha_entrada()%>&des_producto=<%= producto.getDes_producto()%>" class="btn btn-info btn-sm glyphicon glyphicon-edit">Editar</a>
                        <a href="#" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#miModal<%= producto.getId_producto()%>">Eliminar</a>
                    </td>
                     <div class="modal fade" id="miModal<%= producto.getId_producto()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        
                           <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">Eliminar</h4>
                        </div>
                        <div class="modal-body">
                               ¿Está seguro eliminar el producto <%= producto.getNom_producto()%>?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <a href="<%= request.getContextPath()%>/eliminarProducto?id_producto=<%= producto.getId_producto()%>" class="btn btn-danger btn-sm glyphicon glyphicon-remove"> Eliminar</a>
                        </div>
                    </div>
                </div>
                        </div>
                    
                </tr>
                <%
                    }
                %>
                </tbody>
        <tfoot>
            <tr>
               <th>ID</th><th>NOMBRE_PRODUCTO</th><th>STOCK</th><th>PRECIO</th><th>UNIDAD_MEDIADA</th><th>ESTADO_PRODUCTO</th><th>CATEGORIA</th><th>DESCRIPCION</th><th></th>
            </tr>
        </tfoot>
            </table>
            
        </div>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
</html>

