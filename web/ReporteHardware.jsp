<%-- 
    Document   : ReporteHardware
    Created on : 24 may. 2023, 17:39:20
    Author     : Evelyn
--%>

<%@page import="org.rocnic.dao.Reportes"%>
<%@page import="org.rocnic.dao.service.ReporteServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilosf.css">

        <link rel="shortcut icon" href="imagenes/Patita.png">
        <script src="Funciones/js1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <title>Reporte de Hadware</title>
    </head>
    <body style="background-color:#C0CAD2">
        <div class="containery">
            <div class="rectanguloy">
                <form>
                    <div class="encabezado">
                        <h1 class="titulo">Hardware</h1>
                    </div>
                    <div style="margin-top: 20px; margin-left: 50px;">
                        <label for="numero">#EQUIPO</label>
                        <input type="text" id="equipos" name="equipos" style="margin-left: 20px; width: 30px;">

                        <label for="laboratorio">
                            <span>Laboratorio</span>
                            <select name="idLaboratorio" id="idLaboratorio">
                                <option value="-1">Seleccione Laboratorio</option>
                                <option value="1">Base de Datos</option>
                                <option value="2">Nuevas Tecnologias</option>
                                <option value="3">Desarrollo Web</option>
                            </select>
                        </label>


                        <span style="margin-left:130px;">USUARIO</span>
                        <input type="text" id="Usuario" name="Usuario" 
                               style="display: inline-block; width: 160px; margin-left: 15px;">

                        <span style="margin-left: 50px;">Fecha</span>
                        <input type="text" id="Fecha" name="Fecha" 
                               style="display: inline-block; width: 110px; margin-left: 15px;" readonly="true">
                        <div>
                            <div style="display: flex; margin-top: 20px;">
                                <div class="campo">
                                    <span>Errores</span>
                                    <select name="idError" id="idError">
                                        <option value="-1">Seleccione el error</option>
                                        <option value="1">TECLADO</option>
                                        <option value="2">RATON</option>
                                        <option value="3">CPU</option>
                                    </select>
                                </div>
                            </div>
                            <button class="boton-enviar" type="submit" name="accion" id="accion" value="enviar">Enviar</button>
                        </div>
                </form>
            </div>
        </div>
        <%
            String accion = request.getParameter("accion");
            if ("enviar".equals(accion)) {
                ReporteServices reporteservice = new ReporteServices();
                Reportes reportes = new Reportes();
                reportes.setIdEquipos(Integer.parseInt(request.getParameter("equipos")));

                String idLaboratorioParam = request.getParameter("idLaboratorio");
                if (idLaboratorioParam != null && !idLaboratorioParam.isEmpty()) {
                    reportes.setIdLaboratorio(Integer.parseInt(idLaboratorioParam));
                }

                String idErrorParam = request.getParameter("idError");
                if (idErrorParam != null && !idErrorParam.isEmpty()) {
                    reportes.setIdTipoError(Integer.parseInt(idErrorParam));
                }

                reportes.setIdUsuario(Integer.parseInt(request.getParameter("Usuario")));

                if (reporteservice.addReportes(reportes)) {
        %>
        <script>
            alert("Has Levantado un Reporte");
        </script>
        <%
        } else {
        %>
        <script>
            alert("Disculpa se ha generado una exepcion");
        </script>
        <%
                }
            }
        %>
    </body>
</html>
