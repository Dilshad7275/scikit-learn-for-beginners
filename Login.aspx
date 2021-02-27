<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Examination_System.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <div class="col-md-4 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                      <img src="Image/User-Icon%201.jpg" width="150px" />
                                    </center>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col">
                                    <center>
                                      <h3>Student Login </h3>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label>User Name</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" placeholder="Mobile"></asp:TextBox>
                                    </div>

                                    <label>Password</label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" />
                                    </div>

                                    <div class="form-group text-center">
                                        <span class="badge rounded-pill bg-warning text-dark">New User?</span>
                                        <asp:Button ID="Button2" runat="server" Text="Register" CssClass="btn btn-success " OnClick="Button2_Click" />
                                    </div>
                                </div>
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
