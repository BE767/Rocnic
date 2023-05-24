
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
                            <h1 class="titulo">Hardware</h1>
                        </div>
                        <div style="margin-top: 20px; margin-left: 50px;">
                            <label for="numero">#EQUIPO</label>
                            <input type="text" id="EQUIPO" name="EQUIPO" value=""
                                style="margin-left: 20px; width: 30px;">
                            <span style="margin-left: 60px;">LAB</span>
                            <input type="text" id="LAB" name="LAB" value=""
                                style="display: inline-block; width: 110px; margin-left: 15px;">
                            <span style="margin-left:130px;">USUARIO</span>
                            <input type="text" id="USUARIO" name="USUARIO" value=""
                                style="display: inline-block; width: 160px; margin-left: 15px;">

                            <span style="margin-left: 50px;">Fecha</span>
                            <input type="text" id="Fecha" name="Fecha" value=""
                                style="display: inline-block; width: 110px; margin-left: 15px;" readonly="true">
                                <div>
                                    <div style="display: flex; margin-top: 20px;">
                                        <div>
                                            <div style="margin-top: 40px;">SELECCION</div>
                                            <div class="campo">
                                                <input type="checkbox" id="TECLADO" name="TECLADO" style="display: inline-block;">
                                                <label for="TECLADO" style="display: inline-block; margin-left: 5px; vertical-align: middle;">TECLADO</label>
                                            </div>
                                            <div class="campo">
                                                <input type="checkbox" id="RATON" name="RATON" style="display: inline-block;">
                                                <label for="RATON" style="display: inline-block; margin-left: 5px; vertical-align: middle;">RATON</label>
                                            </div>
                                            <div class="campo">
                                                <input type="checkbox" id="CPU" name="CPU" style="display: inline-block;">
                                                <label for="CPU" style="display: inline-block; margin-left: 5px; vertical-align: middle;">CPU</label>
                                            </div>
                                        
                                        </div>
                                        
                                    </div>
                                    <button class="boton-enviar" type="submit">Enviar</button>
                                </div>
                    </form>
                </div>
            </div>
        </body>


        </html>