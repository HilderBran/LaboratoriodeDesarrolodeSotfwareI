<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Usuarios</title>
    </head>
    <body>
        <h1>Gestión de Categoria de productos</h1>
        <h2>Listado de Categorias</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>
        
                <a href="/wesg7?accion=AgregarCategoria">Agregar categoria</a><br><br>


        <table border="1">
            <thead>
                <tr>
                    <th>ID Categoria</th>
                    <th>Categoria</th>
                    <th>Detalles</th>
                    <th>Opcion</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaCategorias}" var="item">
                    <tr>
                        <td><c:out value="${item.idCategoria}" /></td>
                        <td><c:out value="${item.categoria}" /></td> 
                        <td><c:out value="${item.detalles}" /></td> 
                        <td>
                            <form method="POST" action="/wesg7/acciones/categorias/ModificarCategoria.jsp">
                                <input type="hidden" name="idCategoria" value="${item.idCategoria}" />
                                <input type="hidden" name="categoria" value="${item.categoria}" />             
                                <input type="hidden" name="detalles" value="${item.detalles}" />             
                                <input type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/wesg7/acciones/categorias/eliminarCategoria.jsp">
                                <input type="hidden" name="idCategoria" value="${item.idCategoria}" />
                                <input type="hidden" name="categoria" value="${item.categoria}" />             
                                <input type="hidden" name="detalles" value="${item.detalles}" />             
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>