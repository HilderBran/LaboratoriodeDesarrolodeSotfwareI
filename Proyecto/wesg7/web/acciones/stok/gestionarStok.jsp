<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Detalles Stok</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-5">
        <h1>Gestión de Stok</h1>
        <h2>Listado de Detalles Stok</h2>
        <br>
        <h3>Conexion: ${mensaje_conexion}</h3>
        <a class="btn btn-primary" href="/wesg7?accion=AgregarStok">Agregar Stok</a><br><br>

        <table class="table table-bordered">
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
                                <input class="btn btn-primary" type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/wesg7/acciones/stok/eliminarStok.jsp">
                                <input type="hidden" name="idStok" value="${item.idStok}" />
                                <input type="hidden" name="cantidadStok" value="${item.cantidadStok}" />             
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />             
                                <input class="mt-1 btn btn-primary" type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        </div>
    </body>
</html>