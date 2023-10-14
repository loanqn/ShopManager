<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="quanlysp.aspx.cs" Inherits="ShopManager.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
          $(document).ready(function () {
              $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          });
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Quản Lý Sản Phẩm </h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/adm.png" />
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Mã Sản Phẩm</label>
                                <div class="form-group mb-3">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txtProID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="GoBtn" runat="server" Text="Go" OnClick="GoBtn_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Tên Sản Phẩm</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtProName" runat="server" placeholder="Author Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="AddProductBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="AddProductBtn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="UpdateAuthorBtn" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="UpdateProductBtn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="DeleteAuthorBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="DeleteProductBtn_Click" />
                            </div>
                        </div>

                    </div>
                </div>

                <a href="homepage.aspx"><< Quay Lại Trang Chủ</a><br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Author List</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="AuthorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WebShopDBConnectionString %>" SelectCommand="SELECT * FROM [sanpham_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="AuthorDataTable" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSP" DataSourceID="AuthorDataSource">
                                    <Columns>
                                        <asp:BoundField DataField="MaSP" HeaderText="Mã Sản Phẩm " ReadOnly="True" SortExpression="MaSP" />
                                        <asp:BoundField DataField="TenSP" HeaderText="Tên Sản Phẩm" SortExpression="TenSP" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
