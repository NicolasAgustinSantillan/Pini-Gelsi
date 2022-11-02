var table
$(document).ready(function () {
    cargarDatos();

});

function cargarDatos() {
    
    if ($.fn.DataTable.isDataTable('#tbLibroDiario')) {
        $('#tbLibroDiario').DataTable().destroy();
    }

    $('#tbLibroDiario tbody').html('');

    AjaxGet("../frmLibroDiario.aspx/Obtener",
        function (response) {
            $(".card-body").LoadingOverlay("hide");
            if (response.estado) {

                $.each(response.objeto, function (i, row) {
                    $("<tr>").append(
                        $("<td>").text(row.Asiento),
                        $("<td>").text(row.Numero),
                        $("<td>").text(row.PlanCuentas),
                        $("<td>").text(row.Cuenta),
                        $("<td>").text(row.debe),
                        $("<td>").text(row.HaberCuenta),
                        $("<td>").text(row.Debe),
                        $("<td>").text(row.Haber)
                    ).appendTo("#tbLibroDiario tbody");

                })
            }

            table = $('#tbLibroDiario').DataTable({
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

$('#buscarFiltro').on('click', function () {
    console.log('Aca');
})

