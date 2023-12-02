<%-- 
    Document   : Login
    Created on : 7 oct. 2023, 09:46:02
    Author     : A21-PC11
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body class="bg-light container">
    <div class="container mt-5">
        <div class="text-center">
            <h1 class="mb-4">Iniciar Sesión</h1>
        </div>
        <div class="card mx-auto mt-5" style="width: 30rem;">
            <div class="card-body">
                <form method="POST" action="/wesg7/ServletPrincipal?accion=Login">
                    <div class="form-group">
                        <label for="tfUser">Usuario:</label>
                        <input type="text" class="form-control" name="tfUser" required>
                    </div>
                    <div class="form-group">
                        <label for="tfPass">Contraseña:</label>
                        <input type="password" class="form-control" name="tfPass" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block mt-3">Iniciar Sesión</button>
                </form>
            </div>
        </div>
    </div>
    </body>
</html>
