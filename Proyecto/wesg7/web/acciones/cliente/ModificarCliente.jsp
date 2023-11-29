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
        <title>Modificar Cliente</title>
    </head>
    <body>
        <h1>Modificar Cliente</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarCliente">
            <div>
                <label>ID Cliente</label>
                <input type="text" name="idCliente" id="idCliente" value="${param.ID_Cliente}" readonly /><br>
                <label>DUI:</label>
                <input type="text" name="dui" id="dui" value="${param.dui}" required /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresCliente" id="nombresCliente" value="${param.nombresCliente}" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosCliente" id="apellidosCliente" value="${param.apellidosCliente}" required /><br>
                <label>Teléfono:</label>
                <input type="tel" name="telefono" id="telefono" value="${param.telefono}" required /><br>
                <label>Correo:</label>
                <input type="email" name="eMail" id="eMail" value="${param.eMail}" required /><br>
                <label>ID Dirección:</label>
                <input type="text" name="idDireccion" id="idDireccion" value="${param.idDireccion}" required /><br><br>
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea modificar el cliente?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionClientes">Volver al inicio</a>
            </div>
        </form>
    </body>
</html>
