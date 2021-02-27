<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionPaper.aspx.cs" Inherits="Online_Examination_System.QuestionPaper" %>

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
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
         <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container">
                <a href="" class="navbar-brand">Question Paper</a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#id">
                    <span class="navbar-toggler-icon"></span>
                </button>
              
            </div>
        </nav>
        <div class="container">
            <div runat="server" id="divQuestionPaper">
                <div class="row text-center text-lg-right bg-info">
                    <asp:Timer runat="server" ID="timer" Interval="1000" OnTick="timer_Tick"></asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Literal ID="timermsg" runat="server"></asp:Literal>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger EventName="tick" ControlID="timer" />
                        </Triggers>

                    </asp:UpdatePanel>
                </div>
                <asp:Label ID="lblqstnid" runat="server" Text=""></asp:Label>
                <asp:Label runat="server" ID="lblques" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                <table border="1" width="100%" height="100px" style="background-color:olivedrab" >

                    <tr>
                        <td>
                            <asp:RadioButton runat="server" ID="rbnans1" GroupName="selans" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton runat="server" ID="rbnans2" GroupName="selans" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton runat="server" ID="rbnans3" GroupName="selans" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton runat="server" ID="rbnans4" GroupName="selans" /></td>
                    </tr>
                </table>
                <asp:Button runat="server" ID="btnsave" CssClass="btn btn-primary" Text="Save and Proceed" OnClick="btnsave_Click" />
                <asp:Button ID="btnskip" runat="server" Text="NEXT" CssClass="btn btn-warning " OnClick="btnskip_Click" Width="134px" />

            </div>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Know Your Score" OnClick="Button1_Click" Visible="False" />
            <br />
            <asp:GridView ID="GridResult" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
