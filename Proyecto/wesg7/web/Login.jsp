<%-- 
    Document   : Login
    Created on : 7 oct. 2023, 09:46:02
    Author     : A21-PC11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div><h1>Iniciar sesion</h1></div>
        <div>
            <form method="POST" action="/wesg7/ServletPrincipal?accion=Login">
                <div id="resultLogin"></div>
                <div><h1>Bienveniudo al Sistema de gestion de la Tienda de Electronica 1.0</h1></div>
                <%-- crear objeto de la clase date y formatear --%>
                <c:set var = "FechaActual" value = "<%= new java.util.Date() %>" />
                <c:set var = "FormatoFecha" value = "dd/MM/YYYY" />
                <%-- imprimir fecha --%>
                
                <div>
                    <label>
                        <strong>
                            <c:out value = "Fecha Actual:" />
                            <fmt:formatDate  value = '${FechaActual}' pattern ='${FormatoFecha}' />
                        </strong>
                    </label>
                </div>
                <div><label>Usuario: </label></div>
                <div><input type="text" name="tfUser"></div>
                <div><label>Contraseña: </label></div>
                <div><input type="password" name="tfPass"></div>
                <div><input type="submit" value="Iniciar Sesión"></div>
            </form>
        </div>
    </body>
</html>
