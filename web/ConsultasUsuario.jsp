<%-- 
    Document   : ConsultasUsuario
    Created on : 24 may. 2023, 21:15:18
    Author     : Evelyn
--%>

<%@page import="org.rocnic.dao.service.PerfilesService"%>
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
                    <h1 class="titulo">CONSULTAS USUARIOS</h1>
                </div>

                <div class="rectangulo-dentro1">
                    <%
                        String accion = request.getParameter("accion");
                        if ("traer".equals(accion)) {
                            UsuariosService ususervice = new UsuariosService();
                            Usuarios usuario = ususervice.getUsuariosByUsuarios(request.getParameter("idu"));
                            if (usuario != null) {
                    %>
                    <form>
                        <div>
                            <label for="idu">
                                <span>ID Usuario:</span>
                                <input type="text" id="idu" name="idu">
                            </label>
                        </div>
                        <div>
                            <label for="perfil">
                                <span>Perfil:</span>
                                <% 
                                    if (usuario != null) {
                                        PerfilesService perfilesService = new PerfilesService();
                                        String perfilNombre = perfilesService.getNombrePerfil(usuario.getIdPerfil());
                                %>
                                <input type="text" id="perfil" name="perfil" value="<%= perfilNombre %>" readonly>
                                <% } else { %>
                                <input type="text" id="perfil" name="perfil" value="" readonly>
                                <% } %>
                            </label>
                        </div>
                        <div>
                            <label for="usuario">
                                <span>Usuario:</span>
                                <input type="text" id="usuario" name="usuario" value="<%= (usuario != null) ? usuario.getUsuario() : ""%>" readonly>
                            </label>
                        </div>
                        <div>
                            <label for="nombre">
                                <span>Nombre:</span>
                                <input type="text" id="nombre" name="nombre" value="<%= (usuario != null) ? usuario.getNombre() : ""%>" readonly>
                            </label>
                        </div>
                        <div>
                            <label for="contrasena">
                                <span>Contraseña:</span>
                                <input type="text" id="contrasena" name="contrasena" value="<%= (usuario != null) ? usuario.getContraseña() : ""%>" readonly>
                            </label>
                        </div>
                        <button type="submit" name="accion" value="traer">Traer</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            alert("Se estara mostrando el usuario");
        </script>
        <%
        } else {
        %>
        <script>
            alert("Disculpe ha ocurrido un error");
        </script>
        <%
                }
            }
        %>
    </body>
</html>
