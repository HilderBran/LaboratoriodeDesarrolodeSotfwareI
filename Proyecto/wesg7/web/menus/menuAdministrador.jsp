<%-- 
    Document   : menuAdministrador
    Created on : 7 oct. 2023, 10:27:07
    Author     : A21-PC11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Administrador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
        <div class="container-fluid">
          <a class="navbar-brand" href="/wesg7">Tienda Electronica</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=Login">LogIn</a></li>
                <%-- gestion --%>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=MostrarUsuarios">Gestionar Usuarios</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionEmpleados">Gestionar Empleados</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionarCargos">Gestionar Cargos</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionClientes">Gestionar Clientes</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionProveedor">Gestionar Proveedores</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=MostrarDirecciones">Gestionar Direcciones</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionProducto">Gestionar Productos</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionarCategorias">Gestionar Categorias</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionarStok">Gestionar Detalles Stok</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionPedido">Gestionar Pedidos</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionCompra">Gestionar Compras</a></li>
                <li class="nav-item"><a class="nav-link" href="/wesg7?accion=GestionarFactura">Gestionar Facturas</a></li>
            </ul>
          </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
