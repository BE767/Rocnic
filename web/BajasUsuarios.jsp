<%-- Document : BajasUsuarios Created on : 19 may. 2023, 22:35:56 Author : cesar --%>

<%@page import="org.rocnic.dao.service.UsuariosService"%>
<%@page import="org.rocnic.dao.Usuarios"%>
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
        <link rel="stylesheet" href="css/estilobajas.css">
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
                    <h1 class="titulo">BAJAS USUARIOS</h1>
                </div>
                <div class="rectangulo-dentro1">
                    <form>
                        <div>
                            <label for="campo1">
                                <span>Perfil:</span>
                                <input type="text" id="campo1" name="campo1">
                            </label>
                        </div>

                        <div>
                            <label for="campo2">
                                <span>Usuario:</span>
                                <input type="text" id="campo2" name="campo2">
                            </label>
                        </div>

                        <div>
                            <label for="nombre">
                                <span>Nombre   :</span>
                                <input type="text" id="nombre" name="nombre">
                            </label>

                            <label for="perfil">
                                <span>Apellido Paterno                                         :</span>
                                <input type="text" id="perfil" name="perfil">
                            </label>

                            <label for="contrasena">
                                <span>Apellido Materno:</span>
                                <input type="password" id="contrasena" name="contrasena">
                            </label>
                        </div>

                        <button type="delete"  name="accion" id="accion" value="borrar">Borrar</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            String accion = request.getParameter("accion");
            UsuariosService ususervice = new UsuariosService();
            Usuarios usuarios = new Usuarios();
            if ("borrar".equals(accion)) {
                int idUsuario = Integer.parseInt(request.getParameter("campo2"));

                // Verificar existencia del usuario
                if (ususervice.existeUsuario(idUsuario)) {
                    usuarios.setIdUsuario(idUsuario);
        %>
        <script>
            if (confirm("¿Estás seguro de que deseas borrar este usuario?")) {
                // Se confirmó la eliminación del usuario
            <% if (ususervice.deleteUsuario(usuarios)) { %>
                alert("Has borrado el usuario");
            <% } else { %>
                alert("No se pudo borrar el usuario");
            <% } %>
            } else {
                // No se confirmó la eliminación del usuario
                alert("No se ha realizado la eliminación del usuario");
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