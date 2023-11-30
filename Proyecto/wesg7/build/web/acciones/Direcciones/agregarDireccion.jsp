<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Direccion</title>
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
        <h1>Agregar nueva direccion</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarDireccion">
            <div>
                <!-- El ID de las direcciones es autoincrementable -->
                <label>Direccion:</label>
                <input type="text" name="linea1" id="linea1" required /><br><br> 
                <label>Referencia:</label>
                <input type="text" name="linea2" id="linea2" required /><br><br>
                <label>ID Distrito:</label>
                <select id="idDistrito" name="idDistrito">
                    <option value="-1">seleccione</option>
                    <c:forEach items="${listaDireccion}" var="item">
                        <option value="${item.idDistrito}">${item.idDistrito}</option>
                    </c:forEach>
                </select><br><br>
                <label>Codigo Postal:</label>
                <input type="text" name="codigoPostal" id="codigoPostal" required /><br><br> 
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la direccion?')" /><br><br>
            </div><br>
            <div>
                <a href="/wesg7/?accion=MostrarDirecciones">Regresar</a>
            </div>            
        </form>
    </body>
</html>

