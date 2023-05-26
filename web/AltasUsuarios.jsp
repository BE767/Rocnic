<%-- Document :
AltasUsuarios Created on : 19 may. 2023, 22:35:38 
Author : cesar 
--%>

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
        <link rel="stylesheet" href="css/estiloaltas.css">
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
                    <h1 class="titulo">ALTAS USUARIOS</h1>
                </div>
                <div class="rectangulo-dentro1">
                    <form>
                        <label for="nombre">
                            <span>Nombre:</span>
                            <input type="text" id="nombre" name="nombre">
                        </label>

                        <label for="perfil">
                            <span>Perfil:</span>
                            <select name="perfil" id="perfil">
                                <option value="-1">Seleccione Perfil</option>
                                <option value="1">Maestro</option>
                                <option value="2">UDI</option>
                                <option value="3">Alumno</option>
                            </select>
                        </label>


                        <label for="usuario">
                            <span>Usuario:</span>
                            <input type="text" id="usuario" name="usuario">
                        </label>

                        <label for="contrasena">
                            <span>Contraseña:</span>
                            <input type="password" id="contrasena" name="contrasena">
                        </label>

                        <button type="submit" name="accion" id="accion" value="enviar">Enviar</button>
                    </form>
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

                String perfilParam = request.getParameter("perfil");
                
                if (perfilParam != null && !perfilParam.isEmpty()) {
                    usuario.setIdPerfil(Integer.parseInt(perfilParam));
                } else {
                    // Manejar el caso cuando no se ha seleccionado ningún perfil
                    // Puedes asignar un valor por defecto o mostrar un mensaje de error
                    usuario.setIdPerfil(0); // Por ejemplo, asignar un valor 0 como valor por defecto
                }

                // Verificar si el usuario y contraseña ya existen
                if (ususervice.existeUsuario(usuario.getUsuario(), usuario.getContrasena())) {
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