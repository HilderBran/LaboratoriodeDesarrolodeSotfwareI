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
        <h1>Agregar nueva categoria</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarCategoria">
            <div>
                <!-- El ID de las categorias es autoincrementable -->
                <label>Categoria:</label>
                <input type="text" name="categoria" id="categoria" required /><br><br>                
                <label>Detalles:</label>
                <input type="text" name="detalles" id="detalles" required /><br><br>                
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la categoria?')" /><br><br>
            </div><br>
            <div>
                <a href="/wesg7/?accion=GestionarCategorias">Regresar</a>
            </div>            
        </form>
    </body>
</html>
