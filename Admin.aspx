<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Online_Examination_System.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
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
            <asp:Label ID="Label1" runat="server" Text="ADMIN" CssClass="navbar-brand" ></asp:Label>
                </div>
        </nav>
        <div class="container-fluid">
            <div class="container ">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="row">
                            <div class="col">
                                
                                <div class="form-group">
                                   <br />
                                   <br />
                                   <br />
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlexamid" runat="server" >
                                        <asp:ListItem Text="--Select Exam--" Selected="True" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control" placeholder="Question" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="txtopt1" runat="server"  CssClass="form-control" placeholder="Option1" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                              <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="txtopt2" runat="server"  CssClass="form-control" placeholder="Option2" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="txtopt3" runat="server"  CssClass="form-control" placeholder="Option3" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                              <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="txtopt4" runat="server"  CssClass="form-control" placeholder="Option4" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                       
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="txtCorrectAnswer" runat="server"  CssClass="form-control" placeholder="Correct Answer" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                   <asp:Button ID="btninsert" runat="server" Text="INSERT" CssClass="btn btn-block btn-success" OnClick="btninsert_Click" />
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
