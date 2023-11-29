<%-- 
    Document   : gestionarDirecciones
    Created on : 28 nov 2023, 20:46:04
    Author     : santo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Direcciones</title>
        <link rel="stylesheet" type="text/css" href="css/gestion.css"
        
    </head>
    <body>
        <h1>Mostrar Direcciones</h1>
        <h2>Listado de Direcciones  </h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>
        
        <a href="/wesg7?accion=AgregarDireccion">Agregar direccion</a><br><br>

        <table border="1">
            <tr>
                <th>ID Direccion</th>
                <th>Direccion</th>
                <th>Referencia</th>
                <th>Codigo Postal</th>
                <th>Distrito</th>
                <th>Municipio</th>
                <th>Departamento</th>
                <th>Pais</th>
            </tr>
            <c:forEach items="${listaDireccion}" var="item">
                <tr>
                    <td><c:out value="${item.idDireccion}" /></td>
                    <td><c:out value="${item.linea1}" /></td>
                    <td><c:out value="${item.linea2}" /></td>
                    <td><c:out value="${item.codigoPostal}" /></td>
                    <td><c:out value="${item.distrito}" /></td>
                    <td><c:out value="${item.municipio}" /></td>
                    <td><c:out value="${item.departamento}" /></td>
                    <td><c:out value="${item.pais}" /></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
