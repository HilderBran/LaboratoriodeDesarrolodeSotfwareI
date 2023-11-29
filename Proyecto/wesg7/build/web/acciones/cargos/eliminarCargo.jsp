<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cargo</title>
    </head>
    <body>
        <h1>Eliminar cargo</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarCargo">
            <div>
                <label>ID Cargo: ${param.idCargo}</label><br>
                <label>Cargo: ${param.cargo}</label><br> 
                <input type="hidden" name="idCargo" id="idCargo" value="${param.idCargo}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cargo?')" /><br><br>
            </div>
            <div>
                <a href="/wesg7/?accion=GestionarCargos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>