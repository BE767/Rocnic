<%-- 
    Document   : CambiosEquipos
    Created on : 19 may. 2023, 22:38:18
    Author     : cesar
--%>
<%@page import="org.rocnic.dao.Equipos"%>
<%@page import="org.rocnic.dao.service.EquipoService"%>
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
        <link rel="stylesheet" href="css/estilossoft.css">
        <link rel="shortcut icon" href="imagenes/Patita.png">
        <script src="Funciones/js1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </head>
    <body style="background-color:#C0CAD2">
        <div class="containery">
            <div class="rectanguloy">
            </div>
        </div>



        <%
            String accion = request.getParameter("accion");
            EquipoService equipoService = new EquipoService();
            Equipos equipo = new Equipos();
            if ("cambiar".equals(accion)) {
                equipo.setIdLaboratorio(Integer.parseInt(request.getParameter("idLaboratorio")));
                equipo.setIdPeriferico(Integer.parseInt(request.getParameter("idPeriferico")));
                equipo.setNombreEquipo(request.getParameter("nombreEquipo"));
                if (equipoService.updateEquipos(equipo)) {
        %>
        <script>
            alert("Realizaste un cambio");
        </script>
        <%
        } else {
        %>
        <script>
            alert("No se pudo realizar el cambio");
        </script>
        <%
                }
            }
        %>

    </body>
</html>