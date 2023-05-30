
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.rocnic.dao.EstatusReporte"%>
<%@page import="org.rocnic.dao.Reportes"%>
<%@page import="org.rocnic.dao.service.ReporteServices"%>
<%@page import="org.rocnic.dao.service.EstatusService"%>
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

        <div class="containery">
            <div class="rectanguloy">
                <div class="encabezado">
                    <img src="imagenes/Usuarioa.png" class="logo">
                    <h1 class="titulo">CONSULTAS Reportes</h1>
                </div>
                <div class="rectangulo-dentro1">
                    <form method="post">
                        <div style="margin-top: 20px; margin-left: 50px;">
                            <span>#FOLIO</span>
                            <input type="text" id="Folio" name="Folio" value=""
                                   style="margin-left: 20px; width: 30px;">
                            <span>#EQUIPO</span>
                            <input type="text" id="EQUIPO" name="EQUIPO" value=""
                                   style="margin-left: 20px; width: 30px;">

                            <span style="margin-left: 60px;">Laboratorio</span>
                            <input type="text" id="Laboratorio" name="Laboratorio" value=""
                                   style="display: inline-block; width: 110px; margin-left: 15px;">

                            <label for="Estatus">
                                <%
                                    EstatusService estatService = new EstatusService();
                                    List<EstatusReporte> estatus = estatService.getEstatusReporteList();
                                %>
                                <select id="idEstatus" name="idEstatus" class="form-select" >
                                    <option value="">Seleccionar Estatus</option>
                                    <% for (EstatusReporte est : estatus) {%>
                                    <option value="<%= est.getIdEstatusReporte()%>"><%= est.getNombreEstatus()%></option>
                                    <% } %>
                                </select>
                            </label>
                        </div>
                        <br>
                        <div style="margin-left: 50px;">
                            <span>Descripcion del Problema</span>
                            <textarea id="Problema" name="Problema" style="display: inline-block; margin-left: 15px; width: 500px; height: 100px;"
                                      readonly="true"></textarea>
                        </div>
                        <br>
                        <tr>
                            <td colspan="2"><input type="submit" name="accion" id="accion" value="enviar"></td>
                            <td colspan="3"><input type="submit" name="accion" id="accion" value="buscar"></td>
                        </tr>
                    </form>
                </div>
            </div>
        </div>
        <%
            String accion = request.getParameter("accion");
            if ("buscar".equals(accion)) {
                ReporteServices reporteServices = new ReporteServices();
                String folio = request.getParameter("Folio");
                Reportes reporte = reporteServices.getReportePorIdConInnerJoin(Integer.parseInt(folio));

                if (reporte != null) {
                    String equipo = reporte.getNombreEquipo();
                    String laboratorio = reporte.getNombreLaboratorio();
                    String problema = reporte.getNombreError();
        %>
        <script>
            document.getElementById("Folio").value = "<%= folio%>";
            document.getElementById("EQUIPO").value = "<%= equipo%>";
            document.getElementById("Laboratorio").value = "<%= laboratorio%>";
            document.getElementById("Problema").value = "<%= problema%>";
        </script>
        <%
        } else {
        %>
        <script>
            alert("No se encontró ningún reporte con el folio ingresado.");
        </script>
        <%
                }
            }
        %>

        <%
            if ("enviar".equals(accion)) {
                ReporteServices reporteservice = new ReporteServices();
                Reportes reporteid = new Reportes();

                String idEstatusParam = request.getParameter("idEstatus");
                if (idEstatusParam != null && !idEstatusParam.isEmpty()) {
                    reporteid.setIdEstatusReporte(Integer.parseInt(idEstatusParam));
                } else {
                    // Manejar el caso cuando no se ha seleccionado ningún estatus
                    // Puedes asignar un valor por defecto o mostrar un mensaje de error
                    reporteid.setIdEstatusReporte(0); // Por ejemplo, asignar un valor 0 como valor por defecto
                }
                
                 reporteid.setIdReporte(Integer.parseInt(request.getParameter("Folio")));
                if (reporteservice.updateReportes(reporteid)) {
        %>
        <script>
            alert("Se ha agregado el estatus al reporte.");
        </script>
        <%
        } else {
        %>
        <script>
            alert("No se pudo guardar el estatus del reporte.");
        </script>
        <%
                }
            }
        %>
    </body>
</html>
</body>
</html>
