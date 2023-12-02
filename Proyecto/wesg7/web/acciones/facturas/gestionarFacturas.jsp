<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Facturas</title>
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
    <body>
        <h1>Gestión de Facturas</h1>
        <h2>Listado de Facturas</h2>

        <h2>Conexion: ${mensaje_conexion}</h2>
        
        <table border="1">
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
                        <td><c:out value="${item.idDetalles}" /></td>
                         <!-- <td><c:out value="${item.cliente}" /></td> -->
                        <!-- <td><c:out value="${item.empleado}" /></td> -->
                        <td><c:out value="${item.fechaFactura}" /></td>
                        <td><c:out value="${item.comentario}" /></td>
                        <td><c:out value="${item.idFactura}" /></td>
                        <!-- <td><c:out value="${item.idProducto}" /></td> -->
                        <!-- <td><c:out value="${item.nombrep}" /></td> -->
                        <!-- <td><c:out value="${item.precio}" /></td> -->
                        <!-- <td><c:out value="${item.cantidad}" /></td> -->                       
                        <!-- <td><c:out value="${item.iva}" /></td> -->
                        <td><c:out value="${item.descuento}" /></td>
                        <!-- <td><c:out value="${item.idCliente}" /></td> -->
                        <!-- <td><c:out value="${item.idEmpleado}" /></td> -->
                        
                        
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesFacturas(
                                                    '${item.idDetalles}',
                                                    '${item.cliente}',
                                                    '${item.empleado}'
                                                    '${item.fechaFactura}',
                                                    '${item.comentario}',
                                                    '${item.idFactura}',
                                                    '${item.idProducto}',
                                                    '${item.nombrep}',
                                                    '${item.precio}',
                                                    '${item.cantidad}',
                                                    '${item.iva}',
                                                    '${item.descuento}',
                                                    '${item.idCliente}',
                                                    '${item.idEmpleado}',
                                                   
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Detalles <span id="idDetalles"></span></label><br>
                                <label>Cliente: <span id="cliente"></span></label><br><br>
                                <label>Empleado: <span id="empleado"></span></label><br><br>
                                <label>Fecha Factura: <span id="fechaFactura"></span></label><br>
                                <label>Comentario: <span id="comentario"></span></label><br>
                                <label>ID Facturas <span id="idFacturas"></span></label><br>
                                <label>ID Producto <span id="idProducto"></span></label><br>
                                <label>Nombre Producto: <span id="nombrep"></span></label><br>
                                <label>Precio: <span id="precio"></span></label><br>
                                <label>Cantidad: <span id="cantidad"></span></label><br>
                                <label>IVA: <span id="iva"></span></label><br>
                                <label>Descuento: <span id="descuento"></span></label><br>
                                <label>ID Cliente: <span id="idCliente"></span></label><br>
                                
                                <label>ID Empleado: <span id="idEmpleado"></span></label><br><br>
                                
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>
                            
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
        <div>
            <%@include file = "/footer.html" %>
        </div>
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

        function mostrarDetallesFacturas(idDetalles, cliente, empleado, comentario, fechaFactura, idFactura, idProducto,   nombrep, precio, cantidad, iva, descuento, idCliente,  idEmpleado) {
            document.getElementById('idDetalles').textContent = idDetalles;
            document.getElementById('cliente').textContent = cliente;
            document.getElementById('empleado').textContent = empleado;
            document.getElementById('comentario').textContent = comentario;
            document.getElementById('fechaFactura').textContent = fechaFactura;
            document.getElementById('idFactura').textContent = idFactura;
            document.getElementById('idProducto').textContent = idProducto;
            
            
            document.getElementById('nombrep').textContent = nombrep;
            document.getElementById('precio').textContent = precio;
            document.getElementById('cantidad').textContent = cantidad;
            document.getElementById('descuento').textContent = descuento;
            document.getElementById('idCliente').textContent = idCliente;
            
            document.getElementById('idEmpleado').textContent = idEmpleado;
            

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
