<%-- 
    Document   : gestioarEmpleados
    Created on : 1 nov 2023, 17:22:06
    Author     : Raul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Pedidos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body class="container mt-5">
        <h1 class="mb-3">Gestión de Pedidos</h1>
        <h2 class="mb-2">Listado de Pedidos</h2>

        <h2 class="mb-3">Conexion: ${mensaje_conexion}</h2>
        
        <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a class="btn btn-primary mb-3" href="/wesg7?accion=AgregarPedido">Agregar pedidos</a><br><br>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Recibido</th>
                    <th>Comenatrio</th>
                    <th>ID Proveedor</th>
                    <th>Proveedor</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaPedidos}" var="item">
                    <tr>
                        <td><c:out value="${item.idPedido}" /></td>                     
                        <td><c:out value="${item.fechaPedido}" /></td>
                        <td><c:out value="${item.fechaRecibido}" /></td>
                        <td><c:out value="${item.comentario}" /></td>
                        <td><c:out value="${item.idProveedor}" /></td>
                        <td><c:out value="${item.proveedor}" /></td>
                        <!-- opcion de modificar y eliminar -->
                        <td>
                            <%--
                            prueba fallida xd
                            <form method="POST" action="/wesg7?accion=GestionCompra">
                                <input type="hidden" name="idPedido" value="${item.idPedido}" />
                                <button type="submit">Detalles</button>
                            </form>--%>
                            <form method="POST" action = "/wesg7/acciones/pedidos/ModificarPedido.jsp">
                                <input type="hidden" name="idPedido" value="${item.idPedido}" />
                                <input type="hidden"  name="fechaPedido" value="${item.fechaPedido}" />
                                <input type="hidden" name="fechaRecibido" value="${item.fechaRecibido}" />
                                <input type="hidden" name="comentario" value="${item.comentario}" />
                                <input type="hidden" name="idProveedor" value="${item.idProveedor}" />
                                <input class="btn btn-primary" type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action = "/wesg7/acciones/pedidos/eliminarPedido.jsp">
                                <input type="hidden" name="idPedido" value="${item.idPedido}" />
                                <input type="hidden"  name="fechaPedido" value="${item.fechaPedido}" />
                                <input type="hidden" name="fechaRecibido" value="${item.fechaRecibido}" />
                                <input type="hidden" name="comentario" value="${item.comentario}" />
                                <input type="hidden" name="idProveedor" value="${item.idProveedor}" />
                                <input type="hidden" name="Proveedor" value="${item.proveedor}" />
                                <input  class="btn btn-primary mt-1" type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
        <div>
            <%@include file = "/footer.html" %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
