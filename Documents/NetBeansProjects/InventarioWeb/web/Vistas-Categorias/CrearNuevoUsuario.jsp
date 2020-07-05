<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="usuario" scope="session" class="Model.Usuario"/>
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
        <h1>MANTENIMIENTO USUARIOS</h1>
        <form class="form-horizontal" id="frmUsuario" name="frmUsuario" action="<%= request.getContextPath()%>/crearNuevoUsuario" method="post" >
            <input type="hidden" name="id" value="<%= usuario.getId()%>"/>
            <div class="form-group">
                <label for="txtNombre_usuario" class="col-sm-2 control-label">NOMBRE: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtNombre_usuario" value="<%= usuario.getNombre_usuario()%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="txtApellido_usuario" class="col-sm-2 control-label">APELLIDO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtApellido_usuario" value="<%= usuario.getApellido_usuario()%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtCorreo_usuario" class="col-sm-2 control-label">CORREO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtCorreo_usuario" value="<%= usuario.getCorreo_usuario()%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtUsuario" class="col-sm-2 control-label">USUARIO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtUsuario" value="<%= usuario.getUsuario()%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtClave" class="col-sm-2 control-label">CLAVE: </label>
                <div class="col-sm-10">
                    <input type="password" class="form-control"  name="txtClave" value="<%= usuario.getClave()%>"/>
                </div>
            </div> 
                
            <div class="form-group">
                <label for=tipo" class="col-sm-2 control-label">TIPO: </label>
                <div class="col-sm-10">
        <select class="form-control" name="tipo" id="tipo" value="<%= usuario.getTipo()%>">
            <option value="1">Administrador</option>
            <option value="2">Gerente</option>
            <option value="3">Empleado</option>
        </select>
                </div>
            </div> 
                
            <div class="form-group">
                <label for="txtEstado" class="col-sm-2 control-label">ESTADO: </label>
                <div class="col-sm-10">
                    <select class="form-control" name="txtEstado" id="tipo" value="<%= usuario.getTipo()%>">
            <option value="1">Activo</option>
            <option value="2">Inactivo</option>
        </select>
                    
                </div>
            </div> 
            
            <div class="form-group">
                <label for="pregunta" class="col-sm-2 control-label">PREGUNTA: </label>
                <div class="col-sm-10">
        <select class="form-control" name="pregunta" id="pregunta" value="<%= usuario.getPregunta()%>">
            
            <option value="El nombre de tu Perro">El nombre de tu Perro</option>
            <option value="Tu fecha de nacimiento">Tu fecha de nacimiento</option>
            <option value="El nombre de tu abuelita">El nombre de tu abuelita</option>
        </select>
            <%
            %>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtRespuesta" class="col-sm-2 control-label">RESPUESTA: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtRespuesta" value="<%= usuario.getRespuesta()%>"/>
                </div>
            </div> 
                
        
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-success btn-sm"  name="btnGuardar" value="Guardar"/>
                        <a href="crearNuevoUsuario?opcion=listar" class="btn btn-danger btn-sm">Regresar</a>
                        <!--<input type="button" class="btn btn-danger btn-sm" onclick="regresar('<%//= request.getContextPath()%>/categorias.do?opcion=listar')" name="btnRegresar" value="Regresar"/>-->
                    </div>
                </div>
            
        </form>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf"%>
    </body>
</html>
