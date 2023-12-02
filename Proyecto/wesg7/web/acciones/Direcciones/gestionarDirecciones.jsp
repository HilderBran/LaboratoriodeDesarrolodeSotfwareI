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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-5">
        <h1>Gestión de Direcciones</h1>
        <h2>Listado de Direcciones</h2>
        <h3>Conexion: ${mensaje_conexion}</h3>
       
        <table class="table table-bordered">
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        </div>
    </body>
</html>
