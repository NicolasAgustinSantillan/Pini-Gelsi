let cadena = 'Caja'
var table
$(document).ready(function () {
    cargarDatos(cadena);

});

function cargarDatos(cadena) {

    if ($.fn.DataTable.isDataTable('#tbLibroMayor')) {
        $('#tbLibroMayor').DataTable().destroy();
    }

    $('#tbLibroMayor tbody').html('');

    AjaxGet("../frmLibroMayor.aspx/Obtener",
        function (response) {
            $(".card-body").LoadingOverlay("hide");
            if (response.estado) {

                $.each(response.objeto, function (i, row) {
                    $("<tr>").append(
                        $("<td>").text(row.Fecha),
                        $("<td>").text(row.Asiento),
                        $("<td>").text(row.Numero),
                        $("<td>").text(row.PlanCuentas),
                        $("<td>").text(row.Cuenta),
                        $("<td>").text(row.debe),
                        $("<td>").text(row.HaberCuenta),
                        $("<td>").text(row.Debe),
                        $("<td>").text(row.Haber)
                    ).appendTo("#tbLibroMayor tbody");

                })
            }

            table = $('#tbLibroMayor').DataTable({
                responsive: true
            });
        },
        function () {
            $(".card-body").LoadingOverlay("hide");
        },
        function () {
            $(".card-body").LoadingOverlay("show");
        })
}
