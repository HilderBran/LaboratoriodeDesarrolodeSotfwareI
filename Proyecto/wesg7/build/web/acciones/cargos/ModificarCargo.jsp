<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cargo</title>
    </head>
    <body>   
        <h1>Modificar cargo</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarCargo">
            <div>
                <label>ID Cargo:</label>
                <input type="text" name="idCargo" id="idCargo" value="${param.idCargo}" readonly /><br>
                <label>Cargo:</label>
                <input type="text" name="cargo" id="cargo" value="${param.cargo}" required /><br><br>        
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el cargo?')" /><br><br> 
            </div>
            <div>
                <a href="/wesg7/?accion=GestionarCargos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
