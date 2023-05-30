<%@page import="org.rocnic.dao.Reportes"%>
<%@page import="org.rocnic.dao.service.ReporteServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Alumnos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="stylesheet" href="css/estiloscambios.css">
        <link rel="shortcut icon" href="imagenes/Patita.png">
        <script src="Funciones/js1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </head>
    <body style="background-color:#C0CAD2">
        <%
            String idReporte = request.getParameter("idReporte");
            ReporteServices reporteServices = new ReporteServices();
            Reportes reporte = null;

            if (idReporte != null && !idReporte.isEmpty()) {
                reporte = reporteServices.getReportePorIdConInnerJoin(Integer.parseInt(idReporte));
            }
        %>
        <div class="containery">
            <div class="rectanguloy">
                <div class="encabezado">
                    <img src="imagenes/Usuarioa.png" class="logo">
                    <h1 class="titulo">CONSULTAS ALUMNOS</h1>
                </div>
                <div class="rectangulo-dentro1">
                    <div style="margin-top: 20px; margin-left: 50px;">
                        <span>#EQUIPO</span>
                        <input type="text" id="EQUIPO" name="EQUIPO" value="<%= (reporte != null) ? reporte.getNombreEquipo() : ""%>"
                               style="margin-left: 20px; width: 30px;">
                        <span style="margin-left: 60px;">Laboratorio</span>
                        <input type="text" id="Laboratorio" name="Laboratorio" value="<%= (reporte != null) ? reporte.getNombreLaboratorio() : ""%>"
                               style="display: inline-block; width: 110px; margin-left: 15px;">

                        <span style="margin-left: 50px;">Fecha</span>
                        <input type="text" id="Fecha" name="Fecha" value="<%= (reporte != null) ? reporte.getFechaCreacion() : ""%>"
                               style="display: inline-block; width: 110px; margin-left: 15px;" readonly="true">
                    </div>
                    <br>
                    <div style="margin-left: 50px;">
                        <span>Descripcion del Problema</span>
                        <textarea id="Problema" name="Problema" style="display: inline-block; margin-left: 15px; width: 500px; height: 100px;"
                                  readonly="true"><%= (reporte != null) ? reporte.getNombreError() : ""%></textarea>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
