window.onload = function() {
    var fecha = new Date();
    var dia = fecha.getDate();
    var mes = fecha.getMonth() + 1;
    var anio = fecha.getFullYear();
    document.getElementById("Fecha").value = dia + "/" + mes + "/" + anio;
  }
  