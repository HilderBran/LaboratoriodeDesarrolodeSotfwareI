<%-- 
    Document   : gestioarEmpleados
    Created on : 1 nov 2023, 17:22:06
    Author     : Raul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Proveedor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            /* Estilo para el contenedor del pop-up */
            .popup-container {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                z-index: 1;
            }

            /* Estilo para el fondo oscuro */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
        </style>
    </head>
    <body class="container mt-5">
    <h1 class="mb-3">Gestión de Proveedores</h1>
    <h2 class="mb-4">Listado de Proveedores</h2>

    <h3 class="mb-3">Conexion: ${mensaje_conexion}</h3>

    <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
    <a class="btn btn-primary mb-3" href="/wesg7?accion=AgregarProveedor">Agregar proveedor</a>

    <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Compania</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaProveedores}" var="item">
                    <tr>
                        <td><c:out value="${item.idProveedor}" /></td>                     
                        <td><c:out value="${item.nombresContacto}" /></td>
                        <td><c:out value="${item.apellidosContacto}" /></td>
                        <td><c:out value="${item.compania}" /></td>
                        <!-- opcion de modificar y eliminar -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn btn btn-primary" 
                                    onclick="mostrarDetallesEmpleado(
                                                    '${item.idProveedor}',
                                                    '${item.nombresContacto}',
                                                    '${item.apellidosContacto}',
                                                    '${item.telefono}',
                                                    '${item.eMail}',
                                                    '${item.compania}',
                                                    '${item.direccionFull}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Proveedor: <span id="ID_Proveedor"></span></label><br>
                                <label>Nombres: <span id="nombresContacto"></span></label><br>
                                <label>Apellidos: <span id="apellidosContacto"></span></label><br>
                                <label>Teléfono: <span id="telefono"></span></label><br>
                                <label>Correo: <span id="correo"></span></label><br>
                                <label>Compania: <span id="compania"></span></label><br>
                                <label>Dirección: <span id="direccionCompleta"></span></label><br><br>
                                <button class="btn btn-secondary" onclick="abrirPopup()">Cerrar</button>
                            </div>
                            
                            <form method="POST" action = "/wesg7/acciones/proveedor/ModificarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.idProveedor}" />
                                <input type="hidden" name="nombresContacto" value="${item.nombresContacto}" />
                                <input type="hidden" name="apellidosContacto" value="${item.apellidosContacto}" />
                                <input type="hidden" name="telefono" value="${item.telefono}" />
                                <input type="hidden" name="correo" value="${item.eMail}" />
                                <input type="hidden" name="compania" value="${item.compania}" />
                                <input type="hidden" name="ID_Direccion" value="${item.idDireccion}" />
                                <input class="btn btn-primary mt-1" type="submit" value="Modificar" />
                            </form>    
                            <form method="POST" action = "/wesg7/acciones/proveedor/eliminarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.idProveedor}" />
                                <input type="hidden" name="nombresContacto" value="${item.nombresContacto}" />
                                <input type="hidden" name="apellidosContacto" value="${item.apellidosContacto}" />
                                <input type="hidden" name="telefono" value="${item.telefono}" />
                                <input type="hidden" name="correo" value="${item.eMail}" />
                                <input type="hidden" name="compania" value="${item.compania}" />
                                <input type="hidden" name="ID_Direccion" value="${item.idDireccion}" />
                                <input class="btn btn-primary mt-1" type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
        <div>
            <%@include file = "/footer.html" %>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
    <script>
        function abrirPopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');

            if (popup.style.display === 'block') {
                popup.style.display = 'none';
                overlay.style.display = 'none';
            } else {
                popup.style.display = 'block';
                overlay.style.display = 'block';
            }
        }

        function mostrarDetallesEmpleado(ID_Proveedor,  nombresContacto, apellidosContacto, telefono, correo, compania, direccionCompleta) {
            document.getElementById('ID_Proveedor').textContent = ID_Proveedor;
            document.getElementById('nombresContacto').textContent = nombresContacto;
            document.getElementById('apellidosContacto').textContent = apellidosContacto;
            document.getElementById('telefono').textContent = telefono;
            document.getElementById('correo').textContent = correo;
            document.getElementById('compania').textContent = compania;
            document.getElementById('direccionCompleta').textContent = direccionCompleta;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
