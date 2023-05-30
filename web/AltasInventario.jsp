<%-- 
    Document   : AltasInventario
    Created on : 28 may. 2023, 13:59:10
    Author     : Evelyn
--%>

<%@page import="org.rocnic.dao.Laboratorio"%>
<%@page import="org.rocnic.dao.Perfiles"%>
<%@page import="org.rocnic.dao.TipoError"%>
<%@page import="org.rocnic.dao.EstatusReporte"%>
<%@page import="org.rocnic.dao.service.LaboratorioService"%>
<%@page import="org.rocnic.dao.service.TipoErrorService"%>
<%@page import="org.rocnic.dao.service.PerfilesService"%>
<%@page import="org.rocnic.dao.service.EstatusService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
</head>
<body style="background-color:#C0CAD2">

    <div class="containery">
                <div class="rectanguloy"><form id="form1">
        <table class="table">
            <tr>
                <td>Laboratorio</td>
                <td><input type="text" name="laboratorio" id="laboratorio" class="form-control"/> </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="accion" id="accion" value="enviar" class="btn btn-primary"></td>
            </tr>
            <tr>
                <td>Perfiles</td>
                <td><input type="text" name="perfil" id="perfil" class="form-control"/> </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarperfiles" class="btn btn-primary"></td>
            </tr>
            <tr>
                <td>Errores</td>
                <td><input type="text" name="error" id="error" class="form-control"/> </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarerroes" class="btn btn-primary"></td>
            </tr>
            <tr>
                <td>Estatus</td>
                <td><input type="text" name="estatus" id="estatus" class="form-control"/> </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarestatus" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
    <% 
        String accion = request.getParameter("accion");
        if ("enviar".equals(accion)) {
            LaboratorioService laboratorioService = new LaboratorioService();
            Laboratorio laboratorio = new Laboratorio();
            laboratorio.setNombreLaboratorio(request.getParameter("laboratorio"));
            if (laboratorioService.addLaboratorio(laboratorio)) {
    %>
    <div class="alert alert-success" role="alert">
        Ya lo guardé
    </div>
    <%
    } else {
    %>
    <div class="alert alert-danger" role="alert">
        No lo guardé
    </div>
    <%
    }
    }
    %>
    <!-- Perfiles -->
    <%
        if ("enviarperfiles".equals(accion)) {
            PerfilesService perfilesservice = new PerfilesService();
            Perfiles perfiles = new Perfiles();
            perfiles.setNombrePerfil(request.getParameter("perfil"));
            if (perfilesservice.addPerfiles(perfiles)) {
    %>
    <div class="alert alert-success" role="alert">
        Se ha dado de alta un perfil
    </div>
    <%
    } else {
    %>
    <div class="alert alert-danger" role="alert">
        No se ha guardado
    </div>
    <%
    }
    }
    %>
    <!-- Errores -->
    <%
        if ("enviarerroes".equals(accion)) {
            TipoErrorService erroressservice = new TipoErrorService();
            TipoError tipoerror = new TipoError();
            tipoerror.setNombreError(request.getParameter("error"));
            if (erroressservice.addErrores(tipoerror)) {
    %>
    <div class="alert alert-success" role="alert">
        Se ha dado de alta un error
    </div>
    <%
    } else {
    %>
    <div class="alert alert-danger" role="alert">
        No se ha guardado el error
    </div>
    <%
    }
    }
    %>
    <!-- Estatus -->
    <%
        if ("enviarestatus".equals(accion)) {
            EstatusService estatusservice = new EstatusService();
            EstatusReporte estatus = new EstatusReporte();
            estatus.setNombreEstatus(request.getParameter("estatus"));
            if (estatusservice.addEstatusReporte(estatus)) {
    %>
    <div class="alert alert-success" role="alert">
        Se ha dado de alta un estatus
    </div>
    <%
    } else {
    %>
    <div class="alert alert-danger" role="alert">
        No se ha guardado el estatus
    </div>
    <%
    }
    }
    %>
</div>
    </div></div>
</body>
</html>