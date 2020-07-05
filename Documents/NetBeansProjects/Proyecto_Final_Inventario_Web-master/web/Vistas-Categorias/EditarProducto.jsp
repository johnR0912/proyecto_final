<%@page import="java.sql.ResultSet"%>

<%@page import="Model.Categoria"%>
<%@page import="DAO.CategoriaDAOImplementar"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id= "lista" scope="session" class= "java.util.List"/>
<jsp:useBean id="producto" scope="session" class="Model.Producto"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de Inventario</title>
        <%@include file="../WEB-INF/Vistas-Parciales/css-js.jspf" %>
        <script type="text/javascript">
            funtion regresar (url){
                location.href = url;
            }
        </script>
    </head>
    <body>
                <%@include file= "../WEB-INF/Vistas-Parciales/encabezado.jspf"%>
        <h1>EDITAR PRODUCTO</h1>
        
        <form class="form-horizontal" id="frmProducto" name="frmProducto" action="<%= request.getContextPath()%>/crearProducto" method="post" >
            <input type="hidden" name="id_producto" value="<%=request.getParameter("id_producto")%>"/>
            <div class="form-group">
                <label for="txtNom_producto" class="col-sm-2 control-label">NOMBRE: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtNom_producto" value="<%= request.getParameter("Producto")%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtCantidad" class="col-sm-2 control-label">CANTIDAD: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtCantidad" value="<%= request.getParameter("stock")%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtPrecio" class="col-sm-2 control-label">PRECIO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtPrecio" value="<%= request.getParameter("precio")%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtUnidad_Medida" class="col-sm-2 control-label">MEDIDA: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtUnidad_Medida" value="<%= request.getParameter("unidadmedida")%>"/>
                </div>
            </div> 
                
            <div class="form-group">
                <label for="txtEstado" class="col-sm-2 control-label">ESTADO: </label>
                <div class="col-sm-10">
                       <select class="form-control" name="txtEstado" values="<%= request.getParameter("estado_product")%>">
            <option value="1">Activo</option>
            <option value="2">Inactivo</option>
        </select>
                </div>
            </div> 
            <div class="form-group">
                <label for="txtCategoria_Producto" class="col-sm-2 control-label">CATEGORIA: </label>
                <div class="col-sm-10">
                    <select  class="form-control"  name="txtCategoria_Producto" values="<%= request.getParameter("categoria")%>">
                         <% 
                          for(int i = 0; i < lista.size(); i++){
                          Categoria categoria = new Categoria ();
                          categoria = (Categoria)lista.get(i);
                        
                             %>
                                <option value="<%= categoria.getId_categoria() %>"><%= categoria.getNom_categoria() %></option> 
                            <%
                          }
                        %>
                     </select>
                </div>
            </div>
                         
            <div class="form-group">
                <label for="txtDescripcion" class="col-sm-2 control-label">DESCRIPCIÓN: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtDescripcion" value="<%= request.getParameter("des_producto")%>"/>
                </div>
            </div>
                
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-success btn-sm"  name="btnGuardar" value="Guardar"/>
                        <a href="crearProducto?opcion=listar" class="btn btn-danger btn-sm">Regresar</a>
                        <!--<input type="button" class="btn btn-danger btn-sm" onclick="regresar('<%//= request.getContextPath()%>/categorias.do?opcion=listar')" name="btnRegresar" value="Regresar"/>-->
                    </div>
                </div>
            
        </form>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf"%>
    </body>
</html>
