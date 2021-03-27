<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PDBudget.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row clearfix">
                <div class="col-sm-12" style="text-align: center;background-color:#007bFF;">
                    <h3 style="color:white;">Course Budgets</h3>
                    <br />
                </div>
            </div>
        <div class="row clearfix">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div style="max-width: 400px;">
                    <h2 class="form-signin-heading">Login</h2>
                    <label for="txtUsername">
                        Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                        required />
                    <br />
                    <label for="txtPassword">
                        Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
                        placeholder="Enter Password" required />
                    <div class="checkbox">
                        <asp:CheckBox ID="chkRememberMe" Text="Remember Me" runat="server" />
                    </div>
                    <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="ValidateUser" Class="btn btn-primary" />
                    <br />
                    <br />
                    <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                        <strong>Error!</strong>
                        <asp:Label ID="lblMessage" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </form>
</body>
</html>
