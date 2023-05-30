<%-- Document : InicioMaestro Created on : 19 may. 2023, 22:30:47 Author : cesar --%>

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
            <link rel="stylesheet" href="css/estiloinimae.css">

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
                        <h1 class="titulo">Maestros</h1>
                    </div>
                    <div class="rectangulo-dentro">


                        <h1 class="titulo" style="text-align: center; color: white;">REPORTES</h1>
                        <div class="botones-container" style="text-align: center;">
                            <a href="ReporteSoft.jsp">
                                <button class="boton">SOFTWARE</button>
                            </a>
                            <a href="ReporteHardware.jsp">
                                <button class="boton">HARDWARE</button>
                            </a>
                        </div>
                    </div>
                    <div class="rectangulo-dentro2">


                        <h1 class="titulo" style="text-align: center; color: white;">HISTORIAL</h1>
                        <div class="botones-container" style="text-align: center;">
                            <a href="Consulta.jsp">
                                <button class="boton1">BUSCAR</button>
                            </a>
                            
                        </div>
                    </div>

                    <div class="rectangulo-dentro4">


                        <h1 class="titulo" style="text-align: center; color: #455C6A;">CONSULTA</h1>
                        <h2 class="titulo-folio">Folio</h2>
                            <div class="campo-entrada">
                                <input type="text" id="folioInput" name="folioInput" placeholder="Escriba aquí">
                            
                            </div>
                            
                            <button class="boton" type="button" onclick="buscarReporte()" >BUSCAR</button>
                        </div>
                    </div>
                </div>
            <script>
            function buscarReporte() {
                var folioInput = document.getElementById("folioInput").value;
                var url = "ConsultaAlu.jsp?idReporte=" + folioInput;
                window.location.href = url;
            }
        </script>
        </body>

        </html>