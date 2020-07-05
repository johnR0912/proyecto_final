<%-- 
    Document   : cambioclave
    Created on : 07-02-2020, 05:34:39 PM
    Author     : Guido
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio de clave</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/stilos.css" rel="stylesheet" type="text/css"/>
    <body>
       <div class="container col-lg-3">
           <%
                String cadena = "";
                       cadena = String.valueOf(request.getAttribute("usuario"));
           
           %>
        <form action="cambioclave.do" method="POST">
             <div class="form-group text-center">
                    <p><strong>Nueva contraseña</strong></p>
                 <% 
                   
                   if(request.getAttribute("mensaje")!=null)
                   {
                       String cadenaerror = "";
                       cadenaerror = String.valueOf(request.getAttribute("mensaje"));
                       %>
                       <center><font color="red"><b><%=cadenaerror%></b></font></center>
                       
                       
                       
                       <%
                   }
                    else
                    {
                            %>
                        <center><font color="red"><b>...</b></font></center>
                        <%
                    }

                  
                  
                %>
                </div>
            <div class="form-group">
                <label>Usuario : <%=cadena%></label>
                <input class="form-control" type="hidden" name="txtusuario" value="<%=cadena%>">
                    
            </div>
            <div class="form-group">
                <label>Nueva contraseña:</label>
                <input class="form-control" type="password" name="txtclave1">
                    
            </div>
            
            <div class="form-group">
                <label>Repita contraseña</label>
                <input class="form-control" type="password" name="txtclave2" >
                    
            </div>
            
            <div class="form-group">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-success btn-sm"  name="btnGuardar" value="Actualizar"/>
                        <a href="Login.jsp" class="btn btn-info btn-sm">Cancelar</a>
                    </div>
                </div>
            
        </form>
    </body>
</html>
