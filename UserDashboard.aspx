<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Online_Examination_System.UserDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DashBoard</title>
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
                <div class="collapse navbar-collapse" id="id">
                    <ul class="navbar-nav text-center ml-auto">
                        <li class="nav-item">
                            <asp:Button ID="btnMarks" runat="server" CssClass="nav-link btn btn-danger btn-block" Text="Marks" OnClick="btnMarks_Click" />
                        </li>

                        <li class="nav-item">
                            <asp:Button ID="Button2" runat="server" Text="TAKE TEST" CssClass="nav-link btn btn-success btn-block " OnClick="Button2_Click" />
                        </li>
                        <li class="nav-item">
                            <asp:Button ID="Button1" runat="server" Text="VIEW PROFILE" CssClass="nav-link btn btn-primary btn-block" OnClick="Button1_Click" />
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="LinkButton1" CssClass="nav-link text-warning" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <h1 class="text-warning" style="padding-top: 50px">Welcome 
                        <br />
                            <asp:Label ID="lblnameshow" runat="server" Text=""></asp:Label>
                        </h1>
                        <asp:GridView ID="GridProfile" runat="server" CssClass="table-responsive-sm text-primary" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                                <asp:BoundField DataField="State" HeaderText="State" />
                                <asp:BoundField DataField="City" HeaderText="City" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile No." />
                                <asp:BoundField DataField="Password" HeaderText="Password" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("Image") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </div>
                    <div class="col-6">
                        <center>
                        <div runat="server" id="lnktable" visible="false" >
                        <table border="2">
                            <tr><td><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">ASP.NET</asp:LinkButton></td></tr>
                            <tr><td><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">ASP.NET CORE</asp:LinkButton></td></tr>
                            <tr><td><asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">PHP</asp:LinkButton></td></tr>
                           
                        </table>
                             </center>
                            </div>
                        <div runat="server" id="btnusermarks" visible="false">
                            <table>
                                <tr>
                                    <td><asp:Button ID="btnaspnet" runat="server" CssClass="btn  btn-danger btn-block" Text="Asp.Net " OnClick="btnaspnet_Click"></asp:Button></td>

                                </tr>
                                 <tr> 
                                     <td><asp:Button ID="btncore" runat="server" CssClass="btn btn-block btn-warning" Text="Asp.Net Core" OnClick="btncore_Click" Width="199px"></asp:Button>
                                     </td>
                                 </tr>
                                 <tr> 
                                     <td><asp:Button ID="btnphp" runat="server" CssClass="btn btn-block btn-success" Text="PHP" OnClick="btnphp_Click"></asp:Button>                                
                                    </td>
                                </tr>
                            </table>
                            <div id="divgridmarks" runat="server">
                            <asp:GridView ID="gridviewmarks" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <FooterStyle BackColor="Tan" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                                </asp:GridView>

                            </div>
                        </div>
                        
                    
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
