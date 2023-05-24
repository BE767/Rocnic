<%-- Document : InicioUDI Created on : 21 may. 2023, 15:46:03 Author : cesar --%>

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
            <link rel="stylesheet" href="css/estiloIniudi.css">


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
                        <h1 class="titulo">Panel de Administracion</h1>
                    </div>
                </div>

                <div class="rectangulo-dentro">


                    <h1 class="titulo" style="text-align: center; color: white;">ALTAS</h1>
                    <div class="botones-container" style="text-align: center;">
                        <a href="AltasUsuarios.jsp" >
                            <button class="boton">USUARIOS</button>
                          </a>
                          <a href="AltasEquipos.jsp" >
                          <button class="boton">EQUIPOS</button>
                          </a>
                    </div>

                </div>
                <div class="rectangulo-dentro2">


                    <h1 class="titulo" style="text-align: center; color: white;">BAJAS</h1>
                    <div class="botones-container" style="text-align: center;">
                        <a href="BajasUsuarios.jsp" >
                            <button class="boton">USUARIOS</button>
                          </a>
                          <a href="BajasEquipos.jsp" >
                            <button class="boton">EQUIPOS</button>
                            </a>
                    </div>
                </div>
                <div class="rectangulo-dentro3">


                    <h1 class="titulo" style="text-align: center; color: white;">CAMBIOS</h1>
                    <div class="botones-container" style="text-align: center;">
                        <a href="CambiosUsuarios.jsp" >
                            <button class="boton">USUARIOS</button>
                          </a>
                          <a href="CambiosEquipos.jsp" >
                            <button class="boton">EQUIPOS</button>
                            </a>
                    </div>

                </div>
                <div class="rectangulo-dentro4">


                    <h1 class="titulo" style="text-align: center; color: white;">CONSULTAS</h1>
                    <div class="botones-container" style="text-align: center;">
                        <a href="ConsultasUsuarios.jsp" >
                            <button class="boton">USUARIOS</button>
                          </a>
                          <a href="CambiosUsuarios.jsp" >
                            <button class="boton">EQUIPOS</button>
                            </a>
                            <a href="Consulta.jsp" >
                                <button class="boton">REPORTES</button>
                                </a>
                    </div>

                </div>
            </div>
        </body>

        </html>