<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="usuario" scope="session" class="Model.Usuario"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de Inventario</title>
        <%@include file="../WEB-INF/Vistas-Parciales/css-js.jspf" %>
    </head>
    <body>
        <%@include file= "../WEB-INF/Vistas-Parciales/encabezado.jspf"%>
        <h1>EDITAR USUARIO</h1>
        <form class="form-horizontal" id="frmUsuario" name="frmUsuario" action="<%= request.getContextPath()%>/crearNuevoUsuario" method="post" >
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
            <div class="form-group">
                <label for="txtNombre_usuario" class="col-sm-2 control-label">NOMBRE: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtNombre_usuario" value="<%= request.getParameter("usuario")%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="txtApellido_usuario" class="col-sm-2 control-label">APELLIDO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtApellido_usuario" value="<%= request.getParameter("apellido")%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtCorreo_usuario" class="col-sm-2 control-label">CORREO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtCorreo_usuario" value="<%= request.getParameter("correo")%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtUsuario" class="col-sm-2 control-label">USUARIO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtUsuario" value="<%= request.getParameter("usuario")%>"/>
                </div>
            </div>
                
            <div class="form-group">
                <label for="txtClave" class="col-sm-2 control-label">CLAVE: </label>
                <div class="col-sm-10">
                    <input type="password" class="form-control"  name="txtClave" value="<%= request.getParameter("clave")%>"/>
                </div>
            </div> 
                
            <div class="form-group">
                <label for=tipo" class="col-sm-2 control-label">TIPO: </label>
                <div class="col-sm-10">
        <select class="form-control" name="tipo" id="tipo" value="<%= request.getParameter("tipo")%>">
            <option value="1">Administrador</option>
            <option value="2">Gerente</option>
            <option value="3">Empleado</option>
        </select>
                </div>
            </div> 
                
            <div class="form-group">
                <label for="txtEstado" class="col-sm-2 control-label">ESTADO: </label>
                <div class="col-sm-10">
                    <select class="form-control" name="txtEstado" id="tipo" value="<%= request.getParameter("estado")%>">
            <option value="1">Activo</option>
            <option value="2">Inactivo</option>
        </select>
                    
                </div>
            </div> 
            
            <div class="form-group">
                <label for="pregunta" class="col-sm-2 control-label">PREGUNTA: </label>
                <div class="col-sm-10">
        <select class="form-control" name="pregunta" id="pregunta" value="<%= request.getParameter("pregunta")%>">
            
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
                    <input type="text" class="form-control"  name="txtRespuesta" value="<%= request.getParameter("respuesta")%>"/>
                </div>
            </div> 
                
        
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-success btn-sm"  name="btnGuardar" value="Guardar"/>
                        <a href="crearNuevoUsuario?opcion=listar" class="btn btn-danger btn-sm">Regresar</a>
                    </div>
                </div>
            
        </form>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf"%>
    </body>
</html>
