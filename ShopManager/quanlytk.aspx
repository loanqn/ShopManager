<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="quanlytk.aspx.cs" Inherits="ShopManager.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member Details</h4>
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
                     <div class="col-md-3">
                        <label>Member ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="tbMemberID" runat="server" placeholder="Member ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="GoIDMemberBtn" runat="server" OnClick="GoIDMemberBtn_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberName" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberDOB" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberContactNo" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberEmail" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberState" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberCity" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Pin Code</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberPinCode" runat="server" placeholder="Pin Code" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Full Postal Address</label>
                        <div class="form-group mb-3">
                           <asp:TextBox CssClass="form-control text-black bg-secondary-subtle" ID="tbMemberFullAdress" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True" Height="292px"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 ">
                        <asp:Button ID="deleteMemberBtn" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" Width="569px" OnClick="deleteMemberBtn_Click" />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Member List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="MemberDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WebShopDBConnectionString %>" SelectCommand="SELECT * FROM [user_master_tbl]" ProviderName="<%$ ConnectionStrings:WebShopDBConnectionString.ProviderName %>"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="MemberDataTable" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="MemberDataSource">
                            <Columns>
                                <asp:BoundField DataField="user_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                                <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                
                                <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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
