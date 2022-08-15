<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmCuentas.aspx.cs" Inherits="SistemaVentas.frmCuentas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                    CUENTAS
                  </div>
                  <div class="card-body">
                        <div class="row">
                            <div class="col-sm-2">
                                <button id="btnNuevaCuenta" type="button" class="btn btn-sm btn-success">Nuevo</button>
                            </div>
                        </div>
                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <table id="tbPlanCuentasRubros" class="table table-striped table-bordered nowrap compact" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>*</th>
                                            <th>Numero</th>
                                            <th>Plan Cuenta</th>
                                            <th>Rubro</th>
                                            <th>Cuenta</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  </div>
                  <div class="card-footer">
                  </div>
                </div>
            </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalCuenta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Cuentas</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>  
              
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Plan Cuenta</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboPlanCuenta" name="Rubro">
                        <option value="1">Activo</option>
                        <option value="2">Pasivo</option>
                        <option value="3">Patrimonio Neto</option>
                        <option value="4">Ingreso</option>
                        <option value="5">Egreso</option>
                    </select>
                </div>
              </div>

              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label col-form-label-sm">Rubro</label>
                <div class="col-sm-10">
                    <select class="form-control form-control-sm model" id="cboRubro" name="Rubro">
                        <option value="1">Caja y Bancos</option>
                        <option value="2">Inversiones</option>
                        <option value="3">Creditos</option>
                        <option value="4">Bienes de Cambio</option>
                        <option value="5">Bienes de Uso</option>
                        <option value="6">Bienes Intangibles</option>
                    </select>
                </div>
              </div>
              
              <div class="form-group row">
                <label for="staticNombreCuenta" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control form-control-sm model" id="txtNombreCuenta" name="NombreCuenta">
                </div>
              </div>

            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cerrar</button>
            <button id="btnGuardarCambios" type="button" class="btn btn-sm btn-primary">Guardar Cambios</button>
          </div>
        </div>
      </div>
    </div>
    <script src="Controlador/frmCuenta/frmCuenta.js"></script>
</asp:Content>

