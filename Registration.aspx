<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Online_Examination_System.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <link href="Style.css" rel="stylesheet" />

    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="fontawesome/css/all.css" rel="stylesheet" />

    <script src="Bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="Bootstrap/js/popper.min.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container">
                <a href="" class="navbar-brand">ONLINE EXAMINATION SYSTEM</a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#id">
                    <span class="navbar-toggler-icon"></span>
                </button>
               
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                    <img src="../Image/User-Icon%201.jpg" width="100px" />
                                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                                    <label><b>Registration Form</b></label>
                                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server" Placeholder="Enter Your Name"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <label>Father Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtfname" CssClass="form-control" runat="server" Placeholder="Father Name"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>State</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="State" runat="server" CssClass="form-control" OnSelectedIndexChanged="State_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <label>City</label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="City" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Gender</label>
                                    <div class="form-group">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                            <asp:ListItem>Others</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>

                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Profile Pic</label>
                                    <div class="form-group">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <label>Contact No</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMobile" class="form-control " runat="server" Placeholder="Mobile Number" TextMode="Number" ></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:Button ID="Registerbtn" runat="server"  Text="Register" CssClass="btn btn-success btn-block " OnClick="Registerbtn_Click" />
                                    </div>
                                </div>

                            </div>
                             <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                      <asp:Label ID="randompass" runat="server" ForeColor="#990000" ></asp:Label>
                                    </div>
                                </div>

                            </div>
                             <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <asp:LinkButton ID="lnklogin" runat="server" Visible="false" OnClick="lnklogin_Click"><b>Go To Login</b></asp:LinkButton>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
