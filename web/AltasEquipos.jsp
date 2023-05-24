<%-- 
    Document   : AltasEquipos
    Created on : 19 may. 2023, 22:37:04
    Author     : cesar
--%>
<%@page import="org.rocnic.dao.Equipos"%>
<%@page import="org.rocnic.dao.service.EquipoService"%>
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
                <form>
                    <div class="encabezado">
                        <h1 class="titulo">Altas Equipos</h1>
                    </div>
                    <div style="margin-top: 20px; margin-left: 50px;">
                        <label for="numero">#EQUIPO</label>
                        <input type="text" id="EQUIPO" name="EQUIPO" value=""
                               style="margin-left: 20px; width: 30px;">
                        <span style="margin-left: 60px;">Laboratorio</span>
                        <input type="text" id="idLaboratorio" name="idLaboratorio" value=""
                               style="display: inline-block; width: 110px; margin-left: 15px;">
                        <span style="margin-left: 50px;">Fecha</span>
                        <input type="text" id="Fecha" name="Fecha" value=""
                               style="display: inline-block; width: 110px; margin-left: 15px;" readonly="true">
                        <div>
                            <div style="display: flex;  margin-top: 20px; ">
                                <div>
                                    <div style="margin-top: 40px;">SELECCION</div>
                                    <div class="campo">
                                        <input type="checkbox" id="internet" name="internet" style="display: inline-block;">
                                        <label for="internet" style="display: inline-block; margin-left: 5px; vertical-align: middle;">Pantalla</label>
                                    </div>
                                    <div class="campo">
                                        <input type="checkbox" id="Raton" name="Raton" style="display: inline-block;">
                                        <label for="SOFTWARE_MAL_INSTALADO" style="display: inline-block; margin-left: 5px; vertical-align: middle;">Raton</label>
                                    </div>
                                    <div class="campo">
                                        <input type="checkbox" id="CPU" name="CPU" style="display: inline-block;">
                                        <label for="CPU" style="display: inline-block; margin-left: 5px; vertical-align: middle;">CPU</label>
                                    </div>
                                    <div class="campo">
                                        <input type="checkbox" id="CPU" name="CPU" style="display: inline-block;">
                                        <label for="CPU" style="display: inline-block; margin-left: 5px; vertical-align: middle;">Teclado</label>
                                    </div>
                                </div>

                            </div>
                        </div>
                </form>
                <%
                    String accion = request.getParameter("accion");
                    if ("enviar".equals(accion)) {
                        EquipoService equipoService = new EquipoService();
                        Equipos equipo = new Equipos();
                        equipo.setIdLaboratorio(Integer.parseInt(request.getParameter("idLaboratorio")));
                        equipo.setIdPeriferico(Integer.parseInt(request.getParameter("Raton")));
                        equipo.setNombreEquipo(request.getParameter("nombreEquipo"));
                        if (equipoService.addEquipos(equipo)) {
                %>
                <script>
                    alert("Se ha dado de alta al Equipo");
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
                %>

            </div>
        </div>
    </body>


</html>