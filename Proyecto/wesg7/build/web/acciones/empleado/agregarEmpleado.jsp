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
        <title>Agregar Empleado</title>
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
        <h1>Agregar nuevo empleado</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=AgregarEmpleado">
            <div>
              <label>DUI:</label>
              <input type="text" name="dui" id="dui" required /><br>
              <label>Número de afiliado ISSS:</label>
              <input type="text" name="isss" id="isss" required /><br>
              <label>Nombres:</label>
              <input type="text" name="nombresEmpleado" id="nombresEmpleado" required /><br>
              <label>Apellidos:</label>
              <input type="text" name="apellidosEmpleado" id="apellidosEmpleado" required /><br>
              <label>Fecha de nacimiento:</label>
              <input type="date" name="fechaNacimiento" id="fechaNacimiento" required /><br>
              <label>Teléfono:</label>
              <input type="tel" name="telefono" id="telefono" required /><br>
              <label>Correo:</label>
              <input type="email" name="eMail" id="eMail" required /><br>
              <label>ID Cargo:</label>
              <input type="text" name="idCargo" id="idCargo" required /><br>
              <label>ID Dirección:</label>
              <input type="text" name="idDireccion" id="idDireccion" required /><br><br>
              <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el empleado?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionEmpleados">Volver al inicio</a>
            </div>
        </form>

    </body>
</html>
