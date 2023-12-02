<%-- 
    Document   : agregarEmpleado
    Created on : 4 nov. 2023, 08:06:12
    Author     : A21-PC11
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Proveedor</title>
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
        <h1>Agregar nuevo proveedor</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarProveedor">
            <div>
              <label>Nombres:</label>
              <input type="text" name="nombresContacto" id="nombresContacto" required /><br>
              <label>Apellidos:</label>
              <input type="text" name="apellidosContacto" id="apellidosContacto" required /><br>
              <label>Teléfono:</label>
              <input type="tel" name="telefono" id="telefono" required /><br>
              <label>Correo:</label>
              <input type="email" name="correo" id="correo" required /><br>
              <label>Compania:</label>
              <input type="text" name="compania" id="compania" required /><br>
              <label>ID Dirección:</label>
              <input type="text" name="ID_Direccion" id="ID_Direccion" required /><br><br>
              <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el Proveedor?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionProveedor">Volver al inicio</a>
            </div>
        </form>

    </body>
</html>
