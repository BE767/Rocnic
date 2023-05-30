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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Altas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="shortcut icon" href="imagenes/Patita.png">
    <style>
        body {
            background-color: #C0CAD2;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container .alert {
            margin-top: 10px;
        }
        .custom-button {
            background-color: #727272; /* Color de fondo del botón */
    color: #ffffff; /* Color del texto del botón */
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s; /* Transición suave al cambio de color */
        }
.custom-button:hover {
    background-color: #0063d5; /* Color de fondo del botón al pasar el mouse */
    color: white; /* Color del texto del botón al pasar el mouse */
}

    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <form id="form1">
            <table class="table">
                <tr>
                    <td>Laboratorio</td>
                    <td><input type="text" name="laboratorio" id="laboratorio" class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviar"class="btn btn-primary custom-button"></td>
                </tr>
                <tr>
                    <td>Perfiles</td>
                    <td><input type="text" name="perfil" id="perfil" class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarperfiles"class="btn btn-primary custom-button"></td>
                </tr>
                <tr>
                    <td>Errores</td>
                    <td><input type="text" name="error" id="error" class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarerroes"class="btn btn-primary custom-button"></td>
                </tr>
                <tr>
                    <td>Estatus</td>
                    <td><input type="text" name="estatus" id="estatus" class="form-control"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarestatus"class="btn btn-primary custom-button ">
                    </td>
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
</div>
</body>
</html>
