<%-- Document : ReporteSoft Created on : 15 may 2023, 21:33:02 Author : PC --%>

    <%@page import="org.rocnic.dao.service.ReporteServices" %>
        <%@page import="org.rocnic.dao.Reportes" %>
            <%@page import="java.util.Date" %>
                <%@page import="java.text.SimpleDateFormat" %>
                    <%@page import="org.rocnic.dao.service.Conexion" %>
                        <%@page contentType="text/html" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <title>TODO supply a title</title>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <meta name="viewport" content="width=device-width, initial-scale=1">

                                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                                    rel="stylesheet"
                                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                                    crossorigin="anonymous">
                                <link rel="stylesheet" href="css/estilosf.css">
                                <link rel="shortcut icon" href="imagenes/Patita.png">
                                <script src="Funciones/js1.js"></script>
                                <script
                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                                    crossorigin="anonymous"></script>

                            </head>

                            <body style="background-color:#C0CAD2">
                                <div class="containery">
                                    <div class="rectanguloy">
                                        <form>
                                            <div class="encabezado">
                                                <h1 class="titulo">SOFTWARE</h1>
                                            </div>
                                            <div style="margin-top: 20px; margin-left: 50px;">
                                                <label for="numero">#EQUIPO</label>
                                                <input type="text" id="EQUIPO" name="EQUIPO" value=""
                                                    style="margin-left: 20px; width: 30px;">
                                                <span style="margin-left: 60px;">Laboratorio</span>
                                                <input type="text" id="Laboratorio" name="Laboratorio" value=""
                                                    style="display: inline-block; width: 110px; margin-left: 15px;">
                                                <span style="margin-left: 130px;">Boleta</span>
                                                <input type="text" id="Boleta" name="Boleta" value=""
                                                    style="display: inline-block; width: 160px; margin-left: 15px;">
                                                <span style="margin-left: 50px;">Fecha</span>
                                                <input type="text" id="Fecha" name="Fecha" value=""
                                                    style="display: inline-block; width: 110px; margin-left: 15px;"
                                                    readonly="true">
                                                <div>
                                                    <div style="display: flex;  margin-top: 20px; ">
                                                        <div>
                                                            <div style="margin-top: 40px;">SELECCION</div>
                                                            <div class="campo">
                                                                <input type="checkbox" id="internet" name="internet"
                                                                    style="display: inline-block;">
                                                                <label for="internet"
                                                                    style="display: inline-block; margin-left: 5px; vertical-align: middle;">Internet</label>
                                                            </div>
                                                            <div class="campo">
                                                                <input type="checkbox" id="SOFTWARE_MAL_INSTALADO"
                                                                    name="SOFTWARE_MAL_INSTALADO"
                                                                    style="display: inline-block;">
                                                                <label for="SOFTWARE_MAL_INSTALADO"
                                                                    style="display: inline-block; margin-left: 5px; vertical-align: middle;">SOFTWARE
                                                                    MAL INSTALADO</label>
                                                            </div>
                                                        </div>
                                                        <div class="campo"
                                                            style="margin-left: 100px; margin-right: auto;">
                                                            <input type="checkbox" id="otro" name="otro"
                                                                style="display: inline-block;">
                                                            <label for="otro"
                                                                style="display: inline-block; margin-left: 10px; vertical-align: middle;">Otro</label>
                                                            <input type="text" id="campo-texto" name="campo-texto"
                                                                style="margin-top: 120px; margin-right: 40px; width: 100%; height: 100px; resize: vertical;">
                                                        </div>
                                                    </div>
                                                    <button class="boton-enviar" type="submit">Enviar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <% String accion=request.getParameter("accion"); if ("enviar".equals(accion)) {
                                        ReporteServices reporteservice=new ReporteServices(); Reportes reportes=new
                                        Reportes();
                                        reportes.setIdEquipos(Integer.parseInt(request.getParameter("EQUIPO")));
                                        reportes.setIdLaboratorio(Integer.parseInt(request.getParameter("Laboratorio")));
                                        reportes.setIdTipoError(Integer.parseInt(request.getParameter("internet")));
                                        reportes.setIdUsuario(Integer.parseInt(request.getParameter("Usuario"))); if
                                        (reporteservice.addReportes(reportes)) { %>
                                        <script>
                                            alert("Has Levantado un Error");
                                        </script>
                                        <% } else { %>
                                            <script>
                                                alert("Disculpa se ha generado una exepcion");
                                            </script>
                                            <% } } %>
                            </body>

                            </html>