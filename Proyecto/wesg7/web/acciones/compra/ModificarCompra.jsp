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
        <title>Modificar Compra</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <h1>Modificar compra</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarCompra">
            <div>
                <label>ID Compra:</label>
                <input type="text" name="idCompra" value="${param.idCompra}" readonly /><br>
                <label>ID Pedido:</label>
                <input type="text" name="idPedido" value="${param.idPedido}" required /><br>
                <label>ID Producto:</label>
                <input type="text" name="idProducto" value="${param.idProducto}" required /><br>
                <label>Cantidad:</label>
                <input type="text" name="cantidad" value="${param.cantidad}" required /><br>
                <label>Precio Unitario:</label>
                <input type="text" name="precioUnidad" value="${param.precioUnidad}" required /><br>
                <label>Descuento Unitario:</label>
                <input type="text" name="descuentoUnidad" value="${param.descuentoUnidad}" required /><br>
                <label>Comentarios:</label>
                <input type="text" name="comentarios" value="${param.comentarios}" required /><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la Compra?')" /><br><br> 
            </div>
            <div>
                <a href="/wesg7/?accion=GestionCompra">Regresar</a><br><br>
            </div>             
        </form>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
