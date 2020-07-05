<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "Model.Usuario"%> 
<jsp:useBean id= "lista" scope="session" class= "java.util.List"/>
          
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL DE INVENTARIO</title>
        <%@include file= "../WEB-INF/Vistas-Parciales/css-js.jspf" %>
          <script type="text/javascript" class="init">
	
$(document).ready(function() {
	$('#example2').DataTable();
} );

	</script>
    </head>
    <body>
        <%@include file= "../WEB-INF/Vistas-Parciales/encabezado.jspf" %>
        <h1>BIENVENID@!</h1>
        <div style="width: 100%">
            <a href="<%= request.getContextPath()%>/crearNuevoUsuario?opcion=crear" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">Nuevo Usuario</a>
            <form align="right" action="/InventarioWeb/Usuarios">
                <input class="bt btn-info btn-sm" type="submit" value="PDF"/>
            </form>
            <h3>Listado de Usuario</h3>
            <table id="example2" class="table table-striped table-bordered" >
                 <thead>
                <tr>
                    <th>ID</th><th>NOMBRE</th><th>APELLIDO</th><th>CORREO</th><th>USUARIO</th><th>TIPO</th><th>ESTADO</th><th>PREGUNTA</th><th>RESPUESTA</th><th>FECHA_RESGITRO</th><th></th>
                </tr>
                </thead>
        <tbody>
                <%
                    for(int i = 0; i < lista.size(); i++){
                        Usuario usuario = new Usuario();
                        usuario = (Usuario)lista.get(i);
                    
                %>
                <tr>
                    <td><%= usuario.getId() %></td>
                    <td><%= usuario.getNombre_usuario() %></td>
                    <td><%= usuario.getApellido_usuario() %></td>
                    <td><%= usuario.getCorreo_usuario() %></td>
                    <td><%= usuario.getUsuario() %></td>
                    
                    <% 
                    switch(usuario.getTipo())
                    {
                        case 1:
                         %>
                        <td>Administrador</td> 
                        <%
                           break;
                            case 2:
                          %>
                        <td>Gerente</td> 
                        <% 
                            break;
                            case 3:
                          %>
                        <td>Empleado</td> 
                        <% 
                            break;
                    }
                    %>
                    
                    <% 
                    switch(usuario.getEstado())
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
                    <td><%= usuario.getPregunta() %></td>
                    <td><%= usuario.getRespuesta() %></td>
                    <td><%= usuario.getFecha_registro() %></td>
                    <td>
                        <a href="<%= request.getContextPath()%>/editarUsuario.do?opcion=editar&id=<%=  usuario.getId() %>&usuario=<%= usuario.getNombre_usuario() %>&apellido=<%= usuario.getApellido_usuario() %>&correo=<%= usuario.getCorreo_usuario() %>&usuario=<%= usuario.getUsuario() %>&esatdo=<%= usuario.getEstado() %>&tipo=<%= usuario.getTipo()%>&pregunta=<%= usuario.getPregunta() %>&respuesta=<%= usuario.getRespuesta() %>" class="btn btn-info btn-sm glyphicon glyphicon-edit" role="button">Editar</a>
                       <a href="#" class="btn btn-danger btn-sm glyphicon glyphicon-trash" data-toggle="modal" data-target="#miModal<%= usuario.getId() %>">Eliminar</a>
                    </td>
                     <div class="modal fade" id="miModal<%= usuario.getId() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        
                           <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">Eliminar</h4>
                        </div>
                        <div class="modal-body">
                               ¿Está seguro eliminar el usuario <%= usuario.getNombre_usuario() %>?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <a href="<%= request.getContextPath()%>/eliminarUsuario.do?id=<%= usuario.getId() %>" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button">Eliminar</a>
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
                <th>ID</th><th>NOMBRE</th><th>APELLIDO</th><th>CORREO</th><th>USUARIO</th><th>TIPO</th><th>ESTADO</th><th>PREGUNTA</th><th>RESPUESTA</th><th>FECHA_RESGITRO</th><th></th>
            </tr>
        </tfoot>
            </table>
            
        </div>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
</html>

