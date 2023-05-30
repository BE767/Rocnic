<%-- Document : InicioUDI Created on : 20 may 2023, 16:08:18 Author : PC --%>

<%@page import="org.rocnic.dao.Usuarios"%>
<%@page import="org.rocnic.dao.service.UsuariosService"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <title>INICIO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/estiloslogin.css">
        <link rel="shortcut icon" href="imagenes/Patita.png">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </head>

    <body style="background-color:#F4F6F7">
        <div class="container1">
            <div class="rectangulo3">
                <div class="imagen-container">
                    <img src="imagenes/N.png" alt="Imagen">
                </div>
                <div class="rectangulo-dentro">
                    <div class="fomdiv">
                        <form>
                            <label for="usuario" style="font-size: 23px;">Usuario:</label>

                            <div class="form-floating">
                                <input type="text" class="form-control" id="usuario" name="usuario">
                                <label for="floatingPassword">Usuario</label>
                            </div>

                            <label for="contrasena" style="font-size: 23px;">Contraseña:</label>
                            <div class="form-floating">
                                <input type="password" class="form-control" id="contrasena"  name="contrasena" placeholder="Password">
                                <label for="floatingPassword">Contraseña</label>
                            </div>

                            <a href="InicioUDI.jsp" >
                                <button type="submit"  name="accion" id="accion" value="inicio">Ingresar</button>
                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="contenedor2">
            <div class="imagena">
                <img src="imagenes/Huron.png" alt="Imagen">
            </div>
        </div>
        <%
    String accion = request.getParameter("accion");
    if ("inicio".equals(accion)) {
        UsuariosService ususervi = new UsuariosService();
        Usuarios usuario = ususervi.getUsuariosByLogin(request.getParameter("usuario"), request.getParameter("contrasena"));
        if (usuario != null) {
            String nombrePerfil = ususervi.getNombrePerfiles(usuario.getIdPerfil());
            if ("MAESTRO".equals(nombrePerfil)) {
                response.sendRedirect("InicioMaestro.jsp");
            } else if ("UDI".equals(nombrePerfil)) {
                response.sendRedirect("InicioUDI.jsp");
            }
        }
    }
%>
    </body>
</html>