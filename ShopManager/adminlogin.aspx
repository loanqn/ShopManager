<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="ShopManager.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
   <div class="row">
      <div class="col-md-6 mx-auto">
         <div class="card">
            <div class="card-body">
               <div class="row">
                  <div class="col">
                     <center>
                        <img width="150px" src="imgs/adm.png" />
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <center>
                        <h3>Admin Login</h3>
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <hr>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     
                     <div class="form-group mb-3">
                        <asp:TextBox CssClass="form-control" ID="tbAdminId" runat="server" placeholder="Admin ID"></asp:TextBox>
                     </div>
                     
                     <div class="form-group mb-3">
                        <asp:TextBox CssClass="form-control" ID="tbAdminPass" runat="server" placeholder="*********" TextMode="Password"></asp:TextBox>
                     </div>
                     <div class="form-group ">
                        <asp:Button class="btn btn-success btn-block" ID="btnAdminLogin" runat="server" Text="Đăng Nhập" Width="600px" OnClick="btnAdminLogin_Click"/>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <a href="homepage.aspx"><< Quay Lại Trang Chủ</a><br><br>
      </div>
   </div>
</div>
</asp:Content>
