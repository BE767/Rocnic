<%-- 
    Document   : BajasEquipos
    Created on : 19 may. 2023, 22:37:22
    Author     : cesar
--%>
<%@page import="org.rocnic.dao.Laboratorio"%>
<%@page import="java.util.List"%>
<%@page import="org.rocnic.dao.service.LaboratorioService"%>
<%@page import="org.rocnic.dao.Equipos"%>
<%@page import="org.rocnic.dao.service.EquipoService"%>
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
        <link rel="stylesheet" href="css/estilosf.css">
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
                        <h1 class="titulo">Bajas Equipos</h1>
                    </div>
                    <div style="margin-top: 20px; margin-left: 50px;">
                        <label for="numero">#EQUIPO</label>
                        <input type="text" id="nombreequipo" name="nombreequipo" 
                               style="margin-left: 20px; width: 30px;">


                        <label for="laboratorio">
                            <%
                                LaboratorioService laboratorioService = new LaboratorioService();
                                List<Laboratorio> laboratorios = laboratorioService.getLaboratorioList();
                            %>
                            <select id="idLaboratorio" name="idLaboratorio" class="form-select" >
                                <option value="">Seleccionar laboratorio</option>
                                <% for (Laboratorio laboratorio : laboratorios) {%>
                                <option value="<%= laboratorio.getIdLaboratorio()%>"><%= laboratorio.getNombreLaboratorio()%></option>
                                <% } %>
                            </select>
                        </label>

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
                                        <input type="checkbox" id="SOFTWARE_MAL_INSTALADO" name="SOFTWARE_MAL_INSTALADO" style="display: inline-block;">
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
                                <button class="boton-enviar" type="submit"  name="accion" id="accion" value="borrar" style="margin-top: 20%; margin-left: 50%;";>Borrar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%
            String accion = request.getParameter("accion");
            EquipoService equipoService = new EquipoService();
            Equipos equipo = new Equipos();

            if ("borrar".equals(accion)) {
                equipo.setNombreEquipo(request.getParameter("nombreequipo"));

                String idLaboratorioParam = request.getParameter("idLaboratorio");
                if (idLaboratorioParam != null && !idLaboratorioParam.isEmpty()) {
                    equipo.setIdLaboratorio(Integer.parseInt(idLaboratorioParam));
                } else {
                    // Manejar el caso cuando no se ha seleccionado ningún laboratorio
        %>
        <script>
            alert("No seleccionaste ningun laboratorio");
        </script>
        <%
            }
            // Verificar si el equipo existe antes de eliminarlo
            if (!equipoService.existeEquipoNombre(equipo.getNombreEquipo())) {
        %>        
        <script>
            alert("El equipo no existe");
        </script>
        <%
        } else {
            if (equipoService.deleteEquipoLab(equipo)) {
        %>
        <script>
            alert("El equipo se ha eliminado");
        </script>
        <%
        } else {
        %>
        <script>
            alert("No se pudo eliminar el equipo");
        </script>
        <%
                    }
                }
            }
        %>

    </body>
</html>