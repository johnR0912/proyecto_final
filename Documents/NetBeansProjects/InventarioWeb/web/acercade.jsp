<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información de los creadores</title>
        <%@include file="WEB-INF/Vistas-Parciales/css-js.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/Vistas-Parciales/encabezado.jspf" %>
        <table class="colapsado" border="1">
        <tr>
            <h3><center>Información de los Creadores del sistema</center></h3>
            <td><b>Nombres</b></td>
            <td><b>Apellidos</b></td>
            <td><b>Foto</b></td>
            <td><center><b>Modulo</b></center></td>
            <td><center><b>Escuela de estudio</b></center></td>
        </tr>
        <tr>
            <td>Walmer Esteban</td>
            <td>Guido Martínez</td>
            <td><img src="img/Walmer.jpeg" height="80" width="80"></td>
            <td>Aplicación de Metodologias Agiles y Testeo de Software</td>
            <td>ESCUELA ESPECIALIZADA EN INGENIERÍA ITCA-FEPADE ZACATECOLUCA</td>
        </tr>
        <tr>
            <td>Karla Vanessa</td>
            <td>Garcia Faustino</td>
            <td><img src="img/Karla.jpeg" height="80" width="80"></td>
            <td>Aplicación de Metodologias Agiles y Testeo de Software</td>
            <td>ESCUELA ESPECIALIZADA EN INGENIERÍA ITCA-FEPADE ZACATECOLUCA</td>
        </tr>
        <tr>
                <td>John Ali</td>
                <td>Rodriguez Ramirez</td>
                <td><img src="img/Ali.jpeg" height="80" width="80"></td>
                <td>Aplicación de Metodologias Agiles y Testeo de Software</td>
                <td>ESCUELA ESPECIALIZADA EN INGENIERÍA ITCA-FEPADE ZACATECOLUCA</td>
        </tr>    
         <tr>
                <td>Rolando</td>
                <td>Diaz Canales</td>
                <td><img src="img/Rolando.jpeg" height="80" width="80"></td>
                <td>Aplicación de Metodologias Agiles y Testeo de Software</td>
                <td>ESCUELA ESPECIALIZADA EN INGENIERÍA ITCA-FEPADE ZACATECOLUCA</td>
        </tr>  
    </table>
        <%@include file="WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
</html>
