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
        <title>Eliminar Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body class="container bg-light mt-5">
        <h1 class="mb-4">Eliminar proveedor</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarProveedor">
            <div class="mb-1">
                <label class="form-label">ID Proveedor: ${param.ID_Proveedor}</label><br>
                <label class="form-label">Nombres: ${param.nombresContacto}</label><br>
                <label class="form-label">Apellidos: ${param.apellidosContacto}</label><br>
                <label class="form-label">Teléfono: ${param.telefono}</label><br>
                <label class="form-label">Correo: ${param.correo}</label><br>
                <label class="form-label">Compania: ${param.compania}</label><br>
                <label class="form-label">ID Dirección: ${param.ID_Direccion}</label>   
                <input class="form-control" type="hidden" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el proveedor?')" /><br><br>
            </div>
            <div>
                <a href="/wesg7/?accion=GestionProveedor">Regresar</a><br><br>
            </div>             
        </form>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
