<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="categoria" scope="session" class="Model.Categoria"/>
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
        
        <div class="container mx-4 my-4">
            <h1>EDITAR CATEGORIA</h1>
            <form class="form-horizontal" id="frmCategoria" name="frmCategoria" action="<%= request.getContextPath()%>/categorias" method="post" >
            <input type="hidden" name="id_categoria" value="<%=request.getParameter("id")%>"/>
            <div class="form-group">
                <label for="txtNomCategoria" class="col-sm-2 control-label">NOMBRE: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtNomCategoria" value="<%= request.getParameter("categoria")%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="txtEstadoCategoria" class="col-sm-2 control-label">ESTADO: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtEstadoCategoria" value="<%= request.getParameter("estado")%>"/>
                </div>
            </div>
                <div class="form-group">
                    <div>
                        <input type="submit" class="btn btn-success btn-sm"  name="btnGuardar" value="Guardar"/>
                        <a href="categorias?opcion=listar" class="btn btn-danger btn-sm">Regresar</a>
                        <!--<input type="button" class="btn btn-danger btn-sm" onclick="regresar('<%= request.getContextPath()%>/categorias.do?opcion=listar')" name="btnRegresar" value="Regresar"/>-->
                    </div>
                </div>
            
        </form>
        </div>
        <%@include file= "../WEB-INF/Vistas-Parciales/pie.jspf"%>
    </body>
</html>
