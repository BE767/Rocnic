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
                            <span>UsuarioCambio:</span>
                            <input type="text" id="campo2" name="campo2">
                        </label>
                    </div>

                    <div>
                        <label for="nombre">
                            <span>Nombre   :</span>
                            <input type="text" id="nombre" name="nombre">
                        </label>
                        <label for="usuario">
                            <span>Usuario:</span>
                            <input type="text" id="usuario" name="usuario">
                        </label>

                        <label for="contrasena">
                            <span>Contraseña:</span>
                            <input type="password" id="contrasena" name="contrasena">
                        </label>
                        <label for="perfil">
                            <span>Perfil:</span>
                            <input type="text" id="perfil" name="perfil">
                        </label>
                    </div>
                    <button type="submit" name="accion" id="accion" value="buscar">Buscar</button>
                    <button type="submit" name="accion" id="accion" value="borrar">Borrar</button>
                </form>
            </div>
        </div>
    </div>
   <%
    String accion = request.getParameter("accion");
    UsuariosService ususervice = new UsuariosService();
    Usuarios usuarios = new Usuarios();
    if ("buscar".equals(accion)) {
        String usuarioCambio = request.getParameter("campo2");

        // Verificar existencia del usuario
        usuarios = ususervice.getUsuarioPorNombre(usuarioCambio);
        if (usuarios != null) {
%>
<script>
    // Mostrar los datos del usuario encontrado
    document.getElementById("nombre").value = "<%= usuarios.getNombre() %>";
    document.getElementById("usuario").value = "<%= usuarios.getUsuario() %>";
    document.getElementById("contrasena").value = "<%= usuarios.getContrasena() %>";
    document.getElementById("perfil").value = "<%= usuarios.getIdPerfil() %>";
</script>
<%
        } else {
%>
<script>
    alert("El usuario no existe");
</script>
<%
        }
    } else if ("borrar".equals(accion)) {
        String nombreUsuario = request.getParameter("campo2");

        // Verificar existencia del usuario
        if (ususervice.existeUsuarioPorNombre(nombreUsuario)) {
%>
<script>
    if (confirm("¿Estás seguro de que deseas borrar este usuario?")) {
        // Se confirmó la eliminación del usuario
    <% if (ususervice.deleteUsuarioPorNombre(nombreUsuario)) { %>
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
