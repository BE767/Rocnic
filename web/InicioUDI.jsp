<%-- 
    Document   : InicioUDI
    Created on : 21 may. 2023, 15:46:03
    Author     : cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <h1 class="titulo">Panel de Administración</h1>
                            </div>
                            <div class="encabezado">
                                <div class="card border-light mb-3" style="max-width: 18rem;">
                                  <div class="card-header">Altas</div>
                                    <div class="card-body">
                                        <a href="AltasUsuarios.jsp" class="btn btn-primary">Usuarios</a>
                                        <a href="AltasEquipos.jsp" class="btn btn-primary">Equipos</a>
                                    </div>
                                </div>
                            <div class="card border-light mb-3" style="max-width: 18rem;">
                                <div class="card-header">Bajas</div>
                                <div class="card-body">
                                    <a href="BajasUsuarios.jsp" class="btn btn-primary">Usuarios</a>
                                    <a href="BajasEquipos.jsp" class="btn btn-primary">Equipos</a>
                                </div>
                            </div>
                            <div class="card border-light mb-3" style="max-width: 18rem;">
                                <div class="card-header">Cambios</div>
                                    <div class="card-body">
                                        <a href="CambiosUsuarios.jsp" class="btn btn-primary">Usuarios</a>
                                        <a href="CambiosEquipos.jsp" class="btn btn-primary">Equipos</a>
                                    </div>
                            </div>
                            <div class="card border-light mb-3" style="max-width: 18rem;">
                                <div class="card-header">Consultas</div>
                                    <div class="card-body">
                                        <a href="ConsultaUsuarios.jsp" class="btn btn-primary">Usuarios</a>
                                        <a href="ConsultaEquipos.jsp" class="btn btn-primary">Equipos</a>
                                        <a href="Consulta.jsp" class="btn btn-primary">Reportes</a>
                                    </div>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
        </body>
</html>




