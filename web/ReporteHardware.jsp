<%-- 
    Document   : ReporteHardware
    Created on : 24 may. 2023, 17:39:20
    Author     : Evelyn
--%>

<%@page import="org.rocnic.dao.TipoError"%>
<%@page import="org.rocnic.dao.service.TipoErrorService"%>
<%@page import="org.rocnic.dao.Laboratorio"%>
<%@page import="java.util.List"%>
<%@page import="org.rocnic.dao.service.LaboratorioService"%>
<%@page import="org.rocnic.dao.service.EquipoService"%>
<%@page import="org.rocnic.dao.service.UsuariosService"%>
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
                        <span style="margin-left:130px;">USUARIO</span>
                        <input type="text" id="Usuario" name="Usuario" 
                               style="display: inline-block; width: 160px; margin-left: 15px;">

                        <span style="margin-left: 50px;">Fecha</span>
                        <input type="text" id="Fecha" name="Fecha" 
                               style="display: inline-block; width: 110px; margin-left: 15px;" readonly="true">
                        <div>
                            <div style="display: flex; margin-top: 20px;">
                                <div class="campo">
                                     <%
                                        TipoErrorService errorService = new TipoErrorService();
                                        List<TipoError> errores = errorService.getTipoErrorList();
                                    %>
                                    <select id="idError" name="idError" class="form-select" >
                                        <option value="">Seleccionar Error</option>
                                        <% for (TipoError error : errores) {%>
                                        <option value="<%= error.getIdTipoError()%>"><%= error.getNombreError()%></option>
                                        <% } %>
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
        ReporteServices reporteService = new ReporteServices();
        Reportes reporte = new Reportes();

        // Obtener los valores del formulario
        String nombreEquipo = request.getParameter("equipos");
        int idLaboratorio = Integer.parseInt(request.getParameter("idLaboratorio"));
        int idError = Integer.parseInt(request.getParameter("idError"));
        String nombreUsuario = request.getParameter("Usuario");

        // Obtener el ID del equipo por su nombre
        EquipoService equipoService = new EquipoService();
        int idEquipo = equipoService.obtenerIdEquipoPorNombre(nombreEquipo);

        // Obtener el ID del usuario por su nombre
        UsuariosService usuarioService = new UsuariosService();
        int idUsuario = usuarioService.obtenerIdUsuarioPorNombre(nombreUsuario);

        if (idEquipo != 0 && idUsuario != 0) {
            // Asignar los valores al objeto reporte
            reporte.setIdEquipos(idEquipo);
            reporte.setIdLaboratorio(idLaboratorio);
            reporte.setIdTipoError(idError);
            reporte.setIdUsuario(idUsuario);

            if (reporteService.addReportes(reporte)) {
%>
<script>
    alert("Has Levantado un Reporte");
</script>
<%
    } else {
%>
<script>
    alert("Disculpa se ha generado una excepción");
</script>
<%
    }
} else {
%>
<script>
    alert("El equipo o el usuario no existen");
</script>
<%
    }
}
%>


    </body>
</html>

</body>
</html>
