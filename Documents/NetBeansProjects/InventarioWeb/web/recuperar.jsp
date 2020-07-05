<%-- 
    Document   : recuperar
    Created on : 07-02-2020, 05:08:58 PM
    Author     : Guido
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/stilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
          <div class="container col-lg-3">
        <form action="recuperar.do" method="POST">
             <div class="form-group text-center">
                    <p><strong>Recuperar contraseña</strong></p>
                    <% 
                   
                   if(request.getAttribute("mensaje")!=null)
                   {
                       String cadena = "";
                       cadena = String.valueOf(request.getAttribute("mensaje"));
                       %>
                       <center><font color="red"><b><%=cadena%></b></font></center>
                       
                       
                       
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
                <label>Usuario:</label>
                <input class="form-control" type="text" name="txtusuario" placeholder="&#128100;Usuario">
                    
            </div>
            <div class="form-group">
                <label>Seleccione pregunta de seguridad</label>
                <select class="form-control" name="txtpregunta" id="pregunta">
            
            <option value="El nombre de tu Perro">El nombre de tu Perro</option>
            <option value="Tu fecha de nacimiento">Tu fecha de nacimiento</option>
            <option value="El nombre de tu abuelita">El nombre de tu abuelita</option>
        </select>
                    
            </div>
            
            <div class="form-group">
                <label>Respuesta</label>
                <input class="form-control" type="text" name="txtrespuesta" >
                    
            </div>
            
            <div class="form-group">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-success btn-sm"  name="btnGuardar" value="Aceptar"/>
                        <a href="Login.jsp" class="btn btn-info btn-sm">Cancelar</a>
                    </div>
                </div>
            
        </form>
          </div>
    </body>
</html>
