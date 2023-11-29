<%-- 
    Document   : menuAdministrador
    Created on : 7 oct. 2023, 10:27:07
    Author     : A21-PC11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Administrador</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="/wesg7">Tienda Electronica</a></li>
                <li><a href="/wesg7?accion=Login">LogIn</a></li>
                <%-- gestion --%>
                <li><a href="/wesg7?accion=GestionEmpleados">Gestionar Empleados</a></li>
                <li><a href="/wesg7?accion=GestionClientes">Gestionar Clientes</a></li>
                <li><a href="/wesg7?accion=GestionarCargos">Gestionar Cargos</a></li>
                <li><a href="/wesg7?accion=MostrarDirecciones">Gestionar Direcciones</a></li>
            </ul>
        </nav>
    </body>
</html>
