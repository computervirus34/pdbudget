<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="PDBudget.user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="styles/jquery-ui.css" rel="stylesheet" />
    <link type="text/css" href="Styles/select2.min.css" rel="stylesheet" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>

    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <style>
        .main_menu {
            width: 100px;
            background-color: #8AE0F2;
            color: #000;
            text-align: center;
            height: 30px;
            line-height: 30px;
            margin-right: 5px;
        }

        .level_menu {
            width: 110px;
            background-color: #000;
            color: #fff;
            text-align: center;
            height: 30px;
            line-height: 30px;
            margin-top: 5px;
        }

        .selected {
            background-color: #852B91;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-sm-12" style="text-align: center; background-color: #007bFF;">
                    <h3>Budget Application</h3>
                    <br />
                </div>
            </div>
            <div class="row clearfix" style="background-color: #28a745;">
                <div class="col-sm-3" style="align-content: center; color: black;">
                    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" StaticSubMenuIndent="10px">
                        <LevelMenuItemStyles>
                            <asp:MenuItemStyle CssClass="main_menu" />
                            <asp:MenuItemStyle CssClass="level_menu" />
                        </LevelMenuItemStyles>
                        <Items>
                            <asp:MenuItem Text="Report" Value="Report" NavigateUrl="~/Report"></asp:MenuItem>
                            <asp:MenuItem Text="Budget Entry" Value="BudgetEntry" NavigateUrl="~/BudgetEntry"></asp:MenuItem>
                            <asp:MenuItem Text="Parameter" Value="Parameter">
                                <asp:MenuItem Text="User Add" Value="addUser" NavigateUrl="~/user"></asp:MenuItem>
                                <asp:MenuItem Text="Presenter Add" Value="addPresenter" NavigateUrl="~/presenter"></asp:MenuItem>
                            </asp:MenuItem>
                        </Items>
                    </asp:Menu>
                    <br />
                </div>
                <div class="col-sm-6" style="text-align: center;">
                </div>
                <div class="col-sm-3" style="text-align: center;">
                    <table>
                        <tr>
                            <td id="userName">Welcome
                                <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
                            </td>
                            <td id="Logout">
                                <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="btn btn-warning" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="dvGrid" style="padding: 10px; width: 600px">
            <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                <tr>
                    <td style="width: 150px">User ID:<br />
                        <asp:TextBox ID="txtUserID" runat="server" Width="140" />
                    </td>
                    <td style="width: 150px">Password:<br />
                        <asp:TextBox ID="txtPassword" runat="server" Width="140" />
                    </td>
                    <td style="width: 150px">Role Type:<br />
                         <asp:DropDownList ID="ddlType" runat="server" Width="140">
                                </asp:DropDownList>
                    </td>
                    <td style="width: 150px">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound" 
                        DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowDeleting="OnRowDeleting" OnRowCancelingEdit="OnRowCancelingEdit" PageSize="15" AllowPaging="true" OnPageIndexChanging="OnPaging"
                        OnRowUpdating="OnRowUpdating" EmptyDataText="No records has been added."
                        Width="600">
                        <Columns>
                            <asp:TemplateField HeaderText="User ID" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUserID" runat="server" Text='<%# Eval("userName") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Password" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='XXXXXXXX'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("password") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("userRole") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtType" runat="server" Text='<%# Eval("userRole") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                                ItemStyle-Width="150" />
                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
