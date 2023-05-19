<%-- Document : InicioAlumno Created on : 7 may. 2023, 07:26:12 Author : Evelyn --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Inicio
            </title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <link rel="stylesheet" href="css/estilos.css">
            <link rel="stylesheet" href="css/estilos2.css">
            <link rel="shortcut icon" href="imagenes/Patita.png">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
        </head>

        <body style="background-color:#C0CAD2">
            <div class="containery">
                <div class="rectanguloy">
                    <div class="encabezado">
                        <img src="imagenes/Usuarioa.png" class="logo">
                        <h1 class="titulo">Alumnos</h1>
                    </div>
                    <div class="rectangulo-consulta">
                        <h1 class="titulo-consulta">CONSULTA</h1>
                    </div>
                    <div class="folio">

                        <h2 class="titulo-folio">Folio</h2>
                        <div class="campo-entrada">
                            <input type="text" id="folioInput" name="folioInput" placeholder="Escriba aquí">
                        </div>
                    </div>
                    <div class="campo-buscar">
                        <button type="submit">Buscar</button>
                    </div>
                </div>
                <div class="rectangulo-dentro">
                    <h1 class="titulo" style="text-align: center; color: white;">REPORTES</h1>
                    <div class="botones text-center">
                        <a href="ReporteSoft.jsp">
                            <button class="btn btn-primary btn-sm" type="button"
                                style="margin-top: 50px; color: #727272;">SOFTWARE</button>
                        </a>
                        <a href="InicioAlumno.jsp">
                            <button class="btn btn-primary btn-sm" type="button"
                                style="color: #727272;">HARDWARE</button>
                        </a>
                    </div>
                </div>
            </div>
        </body>

        </html>