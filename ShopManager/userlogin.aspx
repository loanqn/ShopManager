<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="ShopManager.WebForm3" %>
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
                        <img width="150px" src="imgs/use.png" />
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <center>
                        <h3>MemMember Login</h3>
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
                        <asp:TextBox class="form-control" ID="tbUserID" runat="server" placeholder="Member ID" ></asp:TextBox>
                     </div>
                     
                     <div class="form-group mb-3">
                        <asp:TextBox class="form-control" ID="tbPassword" runat="server" placeholder="*********" TextMode="Password"></asp:TextBox>
                     </div>
                     <div class="form-group  mb-3">
                        <asp:Button class="btn btn-success btn-block " ID="btnLogin" runat="server" Text="Đăng Nhập" Width="603px" OnClick="btnLogin_Click"/>
                     </div>
                     <div class="form-group">
                      <p>Bạn Chưa Có Tài Khoản ? href="signup.aspx" id="btnSignUp">Đăng Ký</a></p> 
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
