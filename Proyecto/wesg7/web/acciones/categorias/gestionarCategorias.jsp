<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Categorias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body class="container mt-5">
        <h1 class="mb-3">Gestión de Categorias de Productos</h1>
        <h2 class="mb-2">Listado de Categorias</h2>
        <h3 class="mb-3">Conexion: ${mensaje_conexion}</h3>
        <a class="btn btn-primary" href="/wesg7?accion=AgregarCategoria">Agregar categoria</a><br><br>


        <table class="table table-bordered">
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
                                <input class="btn btn-primary" type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/wesg7/acciones/categorias/eliminarCategoria.jsp">
                                <input type="hidden" name="idCategoria" value="${item.idCategoria}" />
                                <input type="hidden" name="categoria" value="${item.categoria}" />             
                                <input type="hidden" name="detalles" value="${item.detalles}" />             
                                <input class="btn btn-primary mt-1" type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>