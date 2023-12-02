<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Categoria</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>   
        <h1>Modificar categoria</h1>
        <form method="POST" action="/wesg7/ServletPrincipal?accion=ModificarCategoria">
            <div>
                <label>ID Categoria:</label>
                <input type="text" name="idCategoria" id="idCategoria" value="${param.idCategoria}" readonly /><br>
                <label>Categoria:</label>
                <input type="text" name="categoria" id="categoria" value="${param.categoria}" required /><br><br>        
                <label>Detalles:</label>
                <input type="text" name="detalles" id="detalles" value="${param.detalles}" required /><br><br>        
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la categoria?')" /><br><br> 
            </div>
            <div>
                <a href="/wesg7/?accion=GestionarCategorias">Regresar</a><br><br>
            </div>             
        </form>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
