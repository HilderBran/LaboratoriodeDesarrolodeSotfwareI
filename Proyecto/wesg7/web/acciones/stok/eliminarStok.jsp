<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EliminarCliente</title>
    </head>
    <body>
        <h1>Eliminar Categoria de Prodcuto</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarStok">
            <div>
              <label>ID Stok ${param.idStok}</label><br>
                <label>Cantidad Stok: ${param.cantidadStok}</label><br>
                <label>Descripcion: ${param.descripcion}</label><br>  
                <input type="hidden" name="idStok" id="idStok" value="${param.idStok}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Stok?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionarStok">Volver al inicio</a>
            </div>
        </form>
    </body>
</html>
