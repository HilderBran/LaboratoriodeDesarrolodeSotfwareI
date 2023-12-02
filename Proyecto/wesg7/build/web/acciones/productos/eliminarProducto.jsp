<%-- 
    Document   : eliminarEmpleados
    Created on : 4 nov. 2023, 10:27:57
    Author     : A21-PC11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar empleado</title>
    </head>
    <body>
        <h1>Eliminar empleado</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarProveedor">
            <div>
                <label>ID Proveedor: ${param.ID_Proveedor}</label><br>
                <label>Nombres: ${param.nombresContacto}</label><br>
                <label>Apellidos: ${param.apellidosContacto}</label><br>
                <label>Teléfono: ${param.telefono}</label><br>
                <label>Correo: ${param.correo}</label><br>
                <label>Compania: ${param.compania}</label><br>
                <label>ID Dirección: ${param.ID_Direccion}</label>   
                <input type="hidden" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el proveedor?')" /><br><br>
            </div>
            <div>
                <a href="/wesg7/?accion=GestionProveedor">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
