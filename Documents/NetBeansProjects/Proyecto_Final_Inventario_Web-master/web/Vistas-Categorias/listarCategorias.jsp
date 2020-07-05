<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "Model.Categoria"%> 
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
        <div style="width: 100%;">
            <a href="<%= request.getContextPath()%>/categorias?opcion=crear" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nueva Categoria</a>
            <form align="right" action="/InventarioWeb/Categorias_1">
                <input class="bt btn-info btn-sm" type="submit" value="PDF"/>
            </form>
            <h3>Listado de Categorias</h3>
            <table id="example" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>ID</th><th>NOMBRE</th><th>ESTADO</th><th>ACCION</th>
            </tr>
        </thead>
        <tbody>
            <%
                    for(int i = 0; i < lista.size(); i++){
                        Categoria categoria = new Categoria ();
                        categoria = (Categoria)lista.get(i);
                    
                %>
                
                 <tr>
                    <td><%= categoria.getId_categoria() %></td>
                    <td><%= categoria.getNom_categoria() %></td>
                    <td><%= categoria.getEstado_categoria() %></td>
                    <td>
                        <a href="<%= request.getContextPath()%>/editar.do?opcion=editar&id=<%= categoria.getId_categoria() %>&categoria=<%= categoria.getNom_categoria() %>&estado=<%= categoria.getEstado_categoria() %>" class="btn btn-info btn-sm glyphicon glyphicon-edit" role="button">Editar</a>
                        <a href="#" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#miModal<%= categoria.getId_categoria() %>">Eliminar</a>
                        
                    </td>
         
                    <div class="modal fade" id="miModal<%= categoria.getId_categoria() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        
                           <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">Eliminar</h4>
                        </div>
                        <div class="modal-body">
                               ¿Está seguro eliminar la categoria <%= categoria.getNom_categoria()%>?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <a href="<%= request.getContextPath()%>/eliminar.do?id=<%= categoria.getId_categoria() %>" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button">Eliminar</a>
                        </div>
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
               <th>ID</th><th>NOMBRE</th><th>ESTADO</th><th>ACCION</th>
            </tr>
        </tfoot>
    </table>
           
            
        </div>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
    
</html>

