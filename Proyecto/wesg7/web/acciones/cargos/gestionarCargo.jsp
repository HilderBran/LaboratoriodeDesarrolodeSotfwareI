<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Cargos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-5">
        <h1>Gestión de Cargos</h1>
        <h2>Listado de Cargos</h2>
        <h3>Conexion: ${mensaje_conexion}</h3>
        
        <a class="btn btn-primary" href="/wesg7?accion=AgregarCargo">Agregar cargo</a><br><br>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID Cargo</th>
                    <th>Cargo</th>
                    <th>Opcion</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaCargos}" var="item">
                    <tr>
                        <td><c:out value="${item.idCargo}" /></td>
                        <td><c:out value="${item.cargo}" /></td>
                        <td>
                            <form method="POST" action="/wesg7/acciones/cargos/ModificarCargo.jsp">
                                <input type="hidden" name="idCargo" value="${item.idCargo}" />
                                <input type="hidden" name="cargo" value="${item.cargo}" />             
                                <input class="btn btn-primary" type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action="/wesg7/acciones/cargos/eliminarCargo.jsp">
                                <input type="hidden" name="idCargo" value="${item.idCargo}" />
                                <input type="hidden" name="cargo" value="${item.cargo}" />             
                                <input class=" mt-1 btn btn-primary" type="submit" value="Eliminar" />
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