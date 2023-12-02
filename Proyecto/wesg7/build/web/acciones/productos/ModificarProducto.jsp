<%-- 
    Document   : ModificarEmpleado
    Created on : 4 nov. 2023, 10:10:36
    Author     : A21-PC11
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Proveedor</title>
    </head>
    <body>
        <h1>Modificar proveedor</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarProveedor">
            <div>
                <label>ID Empleado:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" readonly /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresContacto" id="nombresContacto" value="${param.nombresContacto}" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosContacto" id="apellidosContacto" value="${param.apellidosContacto}" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefono" id="telefono" value="${param.telefono}" required /><br>
                <label>Correo:</label>
                <input type="email" name="correo" id="correo" value="${param.correo}" required /><br>
                <label>Compania:</label>
                <input type="text" name="compania" id="compania" value="${param.compania}" required /><br>
                <label>ID Dirección:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>           
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el Proveedor?')" /><br><br> 
            </div>
            <div>
                <a href="/wesg7/?accion=GestionProveedor">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
