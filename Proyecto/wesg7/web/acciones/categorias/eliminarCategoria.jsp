<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EliminarCliente</title>
    </head>
    <body>
        <h1>Eliminar Categoria de Prodcuto</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarCategoria">
            <div>
              <label>ID Categoria ${param.idCategoria}</label><br>
                <label>Categoria: ${param.categoria}</label><br>
                <label>Detalles: ${param.detalles}</label><br>  
                <input type="hidden" name="idCategoria" id="idCategoria" value="${param.idCategoria}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la categoria?')" /><br><br>
            </div><br>
            <div>
              <a href="/wesg7/?accion=GestionarCategorias">Volver al inicio</a>
            </div>
        </form>
    </body>
</html>
