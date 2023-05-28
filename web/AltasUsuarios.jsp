<%-- Document :
AltasUsuarios Created on : 19 may. 2023, 22:35:38 
Author : cesar 
--%>

<%@page import="java.util.List"%>
<%@page import="org.rocnic.dao.service.UsuariosService"%>
<%@page import="org.rocnic.dao.service.PerfilesService"%>
<%@page import="org.rocnic.dao.Usuarios"%>
<%@page import="org.rocnic.dao.Perfiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

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
        <link rel="stylesheet" href="css/estiloaltas.css">
        <link rel="shortcut icon" href="imagenes/Patita.png">
        <script src="Funciones/js1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </head>
    <body style="background-color:#D5D5D5">
        <%
            PerfilesService perfilservice = new PerfilesService();
            List<Perfiles> perfiles = perfilservice.getPerfilesList();
        %>
        <div class="containery">
            <div class="rectanguloy">

                <div class="encabezado">
                    <img src="imagenes/Usuarioa.png" class="logo">
                    <h1 class="titulo">ALTAS USUARIOS</h1>
                </div>
                <div class="rectangulo-dentro1">
                    <div>
                        <form>
                            <label for="nombre">
                                <span>Nombre:</span>
                            </label>
                            <div class="form-floating">
                                <input type="text" class="form-control"  id="nombre" name="nombre" >
                            </div>
                            <label for="perfil">
                                <span>Perfil:</span>
                            </label>

                            <label>
                                <div class="col-md3">
                                    <div class="form-floating">

                                        <select id="perfilescombos" name="perfilescombos"  class="form-select">
                                            <option value="">Seleccionar Perfil</option>
                                            <% for (Perfiles perf : perfiles) {%>
                                            <option value="<%= perf.getIdPerfil()%>"><%= perf.getNombrePerfil()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                            </label>
                            <div>
                                <br>
                                <label for="usuario">
                                    <span>Usuario:</span>
                                </label>
                                <div class="form-floating">
                                    <input type="text" class="form-control"  id="usuario" name="usuario" >
                                </div>
                                <button type="submit" name="accion" id="accion" value="enviar">Enviar</button>
                                <label for="contrasena">
                                    <span>Contraseña:</span>
                                </label>

                                <div class="form-floating">
                                    <input type="password" class="form-control"  id="contrasena" name="contrasena" placeholder="Password">
                                </div>     
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        String accion = request.getParameter("accion");
        if ("enviar".equals(accion)) {
            UsuariosService ususervice = new UsuariosService();
            Usuarios usuario = new Usuarios();
            usuario.setUsuario(request.getParameter("usuario"));
            usuario.setContrasena(request.getParameter("contrasena"));
            usuario.setNombre(request.getParameter("nombre"));

            String perfilParam = request.getParameter("perfilescombos");

            if (perfilParam != null && !perfilParam.isEmpty()) {
                usuario.setIdPerfil(Integer.parseInt(perfilParam));
            } else {
                // Manejar el caso cuando no se ha seleccionado ningún perfil
                // Puedes asignar un valor por defecto o mostrar un mensaje de error
                usuario.setIdPerfil(0); // Por ejemplo, asignar un valor 0 como valor por defecto
            }

            // Verificar si el usuario y contraseña ya existen
            if (ususervice.existeUsuario(usuario.getUsuario(),usuario.getContrasena())) {
    %>
    <script>
        alert("El usuario y contraseña ya existen");
    </script>
    <%
    } else {
        // Proceder con el alta del usuario si no existe
        if (ususervice.addUsuarios(usuario)) {
    %>
    <script>
        alert("Se ha dado de alta al Usuario");
    </script>
    <%
    } else {
    %>
    <script>
        alert("Ha ocurrido un error");
    </script>
    <%
                }
            }
        }
    %>
</body>
</html>