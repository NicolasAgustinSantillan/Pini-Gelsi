var table
$(document).ready(function () {
    cargarDatos();

});


function cargarDatos() {

    if ($.fn.DataTable.isDataTable('#tbPlanCuentasRubros')) {
        $('#tbPlanCuentasRubros').DataTable().destroy();
    }

    $('#tbPlanCuentasRubros tbody').html('');

    AjaxGet("../frmCuentas.aspx/Obtener",
        function (response) {
            $(".card-body").LoadingOverlay("hide");
            if (response.estado) {

                $.each(response.objeto, function (i, row) {
                    $("<tr>").append(
                        $("<td>").text(i + 1),
                        $("<td>").text(row.Numero),
                        $("<td>").text(row.PlanCuentas),
                        $("<td>").text(row.Rubro),
                        $("<td>").text(row.Cuenta)
                    ).appendTo("#tbPlanCuentasRubros tbody");

                })
            }

            table = $('#tbPlanCuentasRubros').DataTable({
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

$('#cboPlanCuenta').change(function () {

    $("#cboRubro").empty();

    switch ($("#cboPlanCuenta").val()) {
        case '1':
            $("#cboRubro").append($("<option>", { value: 1, text: 'Caja y Bancos' }));
            $("#cboRubro").append($("<option>", { value: 2, text: 'Inversiones' }));
            $('#cboPlanCuenta').append($("<option>", { value: 3, text: 'Creditos' }));
            $("#cboRubro").append($("<option>", { value: 4, text: 'Bienes de Cambio' }));
            $("#cboRubro").append($("<option>", { value: 5, text: 'Bienes de Uso' }));
            $("#cboRubro").append($("<option>", { value: 6, text: 'Bienes Intangibles' }));
            break;
        case '2':
            $("#cboRubro").append($("<option>", { value: 1, text: 'Obligaciones' }));
            $("#cboRubro").append($("<option>", { value: 2, text: 'Previsiones' }));
            break;
        case '3':
            $("#cboRubro").append($("<option>", { value: 1, text: 'Capital' }));
            $("#cboRubro").append($("<option>", { value: 2, text: 'Resultado Acumulado' }));
            $("#cboRubro").append($("<option>", { value: 3, text: 'Resultado Acumulado' }));
            break;
        case '4':
            $("#cboRubro").append($("<option>", { value: 1, text: 'Ventas' }));
            $("#cboRubro").append($("<option>", { value: 2, text: 'Alquileres Obtenidos' }));
            $("#cboRubro").append($("<option>", { value: 3, text: 'Intereses Adquiridos' }));
            break;
        case '5':
            $("#cboRubro").append($("<option>", { value: 1, text: 'Costo de las Mercaderias Vendidas' }));
            $("#cboRubro").append($("<option>", { value: 2, text: 'Alquileres Cedidos' }));
            $("#cboRubro").append($("<option>", { value: 3, text: 'Intereses cedidos' }));
            $("#cboRubro").append($("<option>", { value: 4, text: 'Gastos Generales' }));
            $("#cboRubro").append($("<option>", { value: 5, text: 'Sueldos y Jornales' }));
            break;
        default:
    }
});

$('#btnNuevaCuenta').on('click', function () {
    $('#modalCuenta').modal('show');
})

$('#btnGuardarCambios').on('click', function () {

    if ($("#txtNombreCuenta").val() != null) {

        var request = {
            oCuenta: {
                Numero: null,
                PlanCuentas: parseInt($('#cboPlanCuenta').val()),
                Rubro: $('#cboRubro').val(),
                Cuenta: $('#txtNombreCuenta').val()
            }
        }

        AjaxPost('../frmCuentas.aspx/Guardar', JSON.stringify(request),
            function (response) {
                $(".modal-body").LoadingOverlay("hide");
                if (response.estado) {
                    cargarDatos();
                    $('#modalrol').modal('hide');
                } else {
                    swal("Mensaje", "No se pudo registrar el producto", "warning")
                }
            },
            function () {
                $(".modal-body").LoadingOverlay("hide");
            },
            function () {
                $(".modal-body").LoadingOverlay("show");
            },
            $('#modalCuenta').modal('hide'))

    } else {
        swal("Mensaje!", "Es necesario completar todos los campos", "warning")
    }


})
