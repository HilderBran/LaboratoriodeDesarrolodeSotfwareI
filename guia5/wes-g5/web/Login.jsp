<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div><h1>Inicio de sesion</h1></div>
        <div>
            <form method="POST" action="/wesg5/ServletPrincipal?accion=Login">
                <div id="resultLogin"></div>
                <div><h1>Bienveniudo al Sistema de gestion de la Tienda de Electronica 1.0</h1></div>
                <%--forma nueva y legible--%>
                <%  
                    java.util.Date fActual = new java.util.Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/YYYY");
                    String fechaActualLegible = sdf.format(fActual);
                %>
                <div><label>Fecha actual: <strong><%= fechaActualLegible %></strong></label></div>
                
                <div><label>Usuario: </label></div>
                <div><input type="text" name="tfUser"></div>
                <div><label>Contraseña: </label></div>
                <div><input type="password" name="tfPass"></div>
                <div><input type="submit" value="Iniciar Sesión"></div>
            </form>
        </div>
    </body>
</html>
