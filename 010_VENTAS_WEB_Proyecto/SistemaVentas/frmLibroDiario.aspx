<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="frmLibroDiario.aspx.cs" Inherits="SistemaVentas.frmLibroDiario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
            <div class="col-sm-12">
               <div class="card">
                  <div class="card-header">
                    LIBRO DIARIO
                  </div>
                  <div class="card-body">
                        <div class="row">
                            <div class="col-sm-2">
                                <input type="date" id="" name="trip-start"
                                value="2022-09-01"
                                min="2022-01-01" max="2030-12-31"
                                    class="form-control target">
                            </div>
                            <div class="col-sm-2">
                                <button id="buscarFiltro" type="button" class="btn btn-primary">Buscar</button>
                            </div>
                        </div>
                      <hr />
                        <div class="row mt-3">
                            <div class="col-sm-12">
                                <table id="tbLibroDiario" class="table table-striped table-bordered nowrap compact" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>Asiento</th>
                                            <th>Numero</th>
                                            <th>Tipo</th>
                                            <th>Cuenta</th>
                                            <th></th>
                                            <th></th>
                                            <th>Debe</th>
                                            <th>Haber</th>
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

    <script src="Controlador/frmLibroDiario/frmLibroDiario.js"></script>
</asp:Content>
