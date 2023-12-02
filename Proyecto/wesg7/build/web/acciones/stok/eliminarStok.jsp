<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EliminarCliente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body class="container bg-light mt-5">
        <h1 class="mb-4">Eliminar Categoria de Prodcuto</h1>
        
        <form method="POST" action="/wesg7/ServletPrincipal?accion=EliminarStok">
            <div class="card mx-auto mt-5">
                <div class="form-group">
                    <label class="form-label">ID Stok ${param.idStok}</label><br>
                    <label class="form-label">Cantidad Stok: ${param.cantidadStok}</label><br>
                    <label class="form-label">Descripcion: ${param.descripcion}</label><br>
                </div>
                  
                <input class="form-label" type="hidden" name="idStok" id="idStok" value="${param.idStok}" /><br><br>
                <input class="btn btn-primary" type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Stok?')" /><br><br>
            </div><br>
            <div class="container">
                <a class="btn btn-primary" href="/wesg7/?accion=GestionarStok">Volver al inicio</a>
            </div>
        </form>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
