<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Facturas</title>
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
        <h1 class="mb-3">Gestión de Facturas</h1>
        <h2 class="mb-2">Listado de Facturas</h2>

        <h2 class="mb-3">Conexion: ${mensaje_conexion}</h2>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID Factura</th>
                    <th>Cliente</th>
                    <th>Empleado</th>
                    <th>Fecha</th>
                    <th>Comentario</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaFacturas}" var="item">
                    <tr>
                        <td><c:out value="${item.idFactura}" /></td>
                        <td><c:out value="${item.cliente}" /></td>
                        <td><c:out value="${item.empleado}" /></td> 
                        <td><c:out value="${item.fechaFactura}" /></td>
                        <td><c:out value="${item.comentario}" /></td>
                        
                        
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn btn btn-primary" 
                                    onclick="mostrarDetallesFacturas(
                                                    '${item.idDetalles}',
                                                    '${item.idProducto}',
                                                    '${item.nombrep}',
                                                    '${item.precio}',
                                                    '${item.cantidad}',
                                                    '${item.iva}',
                                                    '${item.descuento}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Detalles <span id="idDetalles"></span></label><br>
                                <label>ID Producto <span id="idProducto"></span></label><br>
                                <label>Nombre Producto: <span id="nombrep"></span></label><br>
                                <label>Precio: <span id="precio"></span></label><br>
                                <label>Cantidad: <span id="cantidad"></span></label><br>
                                <label>IVA: <span id="iva"></span></label><br>
                                <label>Descuento: <span id="descuento"></span></label><br>
                                <button class="btn btn-secondary" onclick="abrirPopup()">Cerrar</button>
                            </div>
                            
                            
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

        function mostrarDetallesFacturas(idDetalles, idProducto,   nombrep, precio, cantidad, iva, descuento) {
            document.getElementById('idDetalles').textContent = idDetalles;
            document.getElementById('idProducto').textContent = idProducto;
            document.getElementById('nombrep').textContent = nombrep;
            document.getElementById('precio').textContent = precio;
            document.getElementById('cantidad').textContent = cantidad;
            document.getElementById('iva').textContent = iva;
            document.getElementById('descuento').textContent = descuento;
            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
