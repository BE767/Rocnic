<%-- 
    Document   : CambiosUsuarios
    Created on : 19 may. 2023, 22:36:17
    Author     : cesar
--%>

<%@page import="org.rocnic.dao.Usuarios"%>
<%@page import="org.rocnic.dao.service.UsuariosService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/estiloscambios.css">
    <link rel="shortcut icon" href="imagenes/Patita.png">
    <script src="Funciones/js1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body style="background-color:#C0CAD2">
<div class="containery">
    <div class="rectanguloy">
        <div class="encabezado">
            <img src="imagenes/Usuarioa.png" class="logo">
            <h1 class="titulo">CAMBIOS USUARIOS</h1>
        </div>
        <div class="rectangulo-dentro1">
            <form>
                <div>
                    <label for="usuario">
                        <span>Usuario:</span>
                        <input type="text" id="usuario" name="usuario">
                    </label>
                    <button type="submit" name="accion" id="accion" value="buscar">Buscar</button>
                </div>
                <div>
                    <label for="perfil">
                        <span>Perfil:</span>
                        <input type="text" id="perfil" name="perfil">
                    </label>
                </div>
                <div>
                    <label for="nombre">
                        <span>Nombre:</span>
                        <input type="text" id="nombre" name="nombre">
                    </label>

                    <label for="contrasena">
                        <span>Contraseña</span>
                        <input type="password" id="contrasena" name="contrasena">
                    </label>
                </div>
                <button type="submit" name="accion" id="accion" value="cambiar">Cambiar</button>
            </form>
        </div>
    </div>
</div>
<%
    String accion = request.getParameter("accion");
    UsuariosService ususervice = new UsuariosService();
    Usuarios usuario = new Usuarios();

    if ("buscar".equals(accion)) {
        String nombreUsuario = request.getParameter("usuario");
        usuario = ususervice.getUsuarioPorNombre(nombreUsuario);

        if (usuario != null) {
            String nombrePerfil = ususervice.getNombrePerfil(usuario);
%>
            <script>
                document.getElementById("perfil").value = "<%= nombrePerfil %>";
                document.getElementById("nombre").value = "<%= usuario.getNombre() %>";
                document.getElementById("contrasena").value = "<%= usuario.getContrasena() %>";
            </script>
<%
        } else {
%>
            <script>
                alert("El usuario no existe");
            </script>
<%
        }




    } else if ("cambiar".equals(accion)) {
        String nombreUsuario = request.getParameter("usuario");
        Usuarios usuarioExistente = ususervice.getUsuarioPorNombre(nombreUsuario);

        if (usuarioExistente != null) {
            usuario.setIdUsuario(usuarioExistente.getIdUsuario());
            usuario.setUsuario(usuarioExistente.getUsuario());
            usuario.setContrasena(request.getParameter("contrasena"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setBoleta(request.getParameter("boleta"));
%>
            <script>
                if (confirm("¿Estás seguro de que deseas realizar los cambios en este usuario?")) {
                    // Se confirmaron los cambios en el usuario
                    <% if (ususervice.updateUsuarios(usuario)) { %>
                        alert("Realizaste un cambio");
                    <% } else { %>
                        alert("No se pudo realizar el cambio");
                    <% } %>
                } else {
                    // No se confirmaron los cambios en el usuario
                    alert("No se ha realizado el cambio en el usuario");
                }
            </script>
<%
        } else {
%>
            <script>
                alert("El usuario no existe");
            </script>
<%
        }
    }
%>
</body>
</html>
