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
        <title>Eliminar Compra</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <h1>Eliminar compra</h1>

        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarCompra">
            <div>
                <label>ID Compra: ${param.idCompra}</label><br>
                <label>ID Pedido: ${param.idPedido}</label><br>
                <label>ID Producto: ${param.idProducto}</label><br>
                <label>Nombre Producto: ${param.nombreP}</label><br>
                <label>Cantidad: ${param.cantidad}</label><br>
                <label>Precio Unidad: ${param.precioUnidad}</label><br>
                <label>Descuento Unidad: ${param.descuentoUnidad}</label><br>
                <label>Comentarios: ${param.comentarios}</label><br>   
                <input type="hidden" name="idCompra" id="idCompra" value="${param.idCompra}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la Compra?')" /><br><br>
            </div>
            <div>
                <a href="/wesg7/?accion=GestionCompra">Regresar</a><br><br>
            </div>             
        </form>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
