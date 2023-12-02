<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Detalles Stok</title>
    </head>
    <body>
        <h1>Gestión de Stok</h1>
        <h2>Listado de Detalles Stok</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>
        <a href="/wesg7?accion=AgregarStok">Agregar Stok</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID Stok</th>
                    <th>Cantidad Stok</th>
                    <th>Descripcion</th>
                    <th>Opcion</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaStok}" var="item">
                    <tr>
                        <td><c:out value="${item.idStok}" /></td>
                        <td><c:out value="${item.cantidadStok}" /></td> 
                        <td><c:out value="${item.descripcion}" /></td> 
                        <td>
                            <form method="POST" action="/wesg7/acciones/stok/ModificarStok.jsp">
                                <input type="hidden" name="idStok" value="${item.idStok}" />
                                <input type="hidden" name="cantidadStok" value="${item.cantidadStok}" />             
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />             
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/wesg7/acciones/stok/eliminarStok.jsp">
                                <input type="hidden" name="idStok" value="${item.idStok}" />
                                <input type="hidden" name="cantidadStok" value="${item.cantidadStok}" />             
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />             
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>