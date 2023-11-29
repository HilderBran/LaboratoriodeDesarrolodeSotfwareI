<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cargo</title>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nuevo cargo</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarCargo">
            <div>
                <!-- El ID de los cargos es autoincrementable -->
                <label>Cargo:</label>
                <input type="text" name="cargo" id="cargo" required /><br><br>                
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el cargo?')" /><br><br>
            </div><br>
            <div>
                <a href="/wesg7/?accion=GestionarCargos">Regresar</a>
            </div>            
        </form>
    </body>
</html>
