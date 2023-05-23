<%-- 
    Document   : Consulta
    Created on : 19 may. 2023, 22:29:00
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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    </head>
        <body style="background-color:#C0CAD2">
            <div class="containery">
                <div class="rectanguloy">
                    <div class="encabezado">
                        <img src="imagenes/Usuarioa.png" class="logo">
                        <h1 class="titulo">CAMBIOS USUARIOS</h1>
                    </div>
                    <style>
                        .table-container {
                          height: 300px; 
                          overflow: auto;
                        }
                      </style>
                    <div class="form-group">
                        <input type="text" class="form-control pull-right" style="width: 20%; margin-left: 80%;" id="search" placeholder="CONSULTAS">
                    </div>
                       
                       <div class="table-container">
                        <table class="table-bordered table pull-right" id="mytable" cellspacing="0" style="width: 100%;">
                          <thead>
                            <tr role="row">
                              <th>Folio</th>
                              <th>Lab</th>
                              <th>#Maquina</th>
                              <th>Error</th>
                              <th>Usuario</th>
                              
                            </tr>
                          </thead>
                          <tbody>
                           
                          </tbody>
                        </table>
                      </div>
                       <script>
                        
                        $(document).ready(function(){
                        $("#search").keyup(function(){
                        _this = this;
                     
                        $.each($("#mytable tbody tr"), function() {
                        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                        else
                        $(this).show();
                        });
                        });
                       });
                       </script>
                </div>
            </div>
        </body>
</html>
