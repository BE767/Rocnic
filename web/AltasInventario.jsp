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
        <title>JSP Page</title>
    </head>
        <body>
        <form id="form1">
            <table border="1">
                <tr>
                    <td>Laboratorio</td>
                    <td><input type="text" name="laboratorio" id="laboratorio"/> </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviar" ></td>
                </tr> 
                 <tr>
                    <td>Perfiles</td>
                    <td><input type="text" name="perfil" id="perfil"/> </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarperfiles" ></td>
                </tr> 
                 <tr>
                    <td>Errores</td>
                    <td><input type="text" name="error" id="error"/> </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarerroes" ></td>
                </tr> 
                <tr>
                    <td>Estatus</td>
                    <td><input type="text" name="estatus" id="estatus"/> </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="accion" id="accion" value="enviarestatus" ></td>
                </tr> 
        </form>   
        <%
            String accion = request.getParameter("accion");
            if ("enviar".equals(accion)) {
                LaboratorioService laboratorioService = new LaboratorioService();
                Laboratorio laboratorio = new Laboratorio();
                laboratorio.setNombreLaboratorio(request.getParameter("laboratorio"));
                if (laboratorioService.addLaboratorio(laboratorio)) {
        %>
        <script>
            alert("Ya lo guarde");
        </script>
        <%
        } else 
{
        %>
        <script>
            alert("no lo guarde");
        </script>
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
        <script>
            alert("Se ha dado de alta un perfil");
        </script>
        <%
        } else 
{
        %>
        <script>
            alert("No se ha guardado");
        </script>
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
        <script>
            alert("Se ha dado de alta un error");
        </script>
        <%
        } else 
{
        %>
        <script>
            alert("No se ha guardado el error");
        </script>
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
        <script>
            alert("Se ha dado de alta un estatus");
        </script>
        <%
        } else 
{
        %>
        <script>
            alert("No se ha guardado el estatus");
        </script>
        <%
                }

            }

        %>
    </body>
</html>
