<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="presenter.aspx.cs" Inherits="PDBudget.presenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="styles/jquery-ui.css" rel="stylesheet" />
    <link type="text/css" href="Styles/select2.min.css" rel="stylesheet" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>

    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .main_menu {
            width: 100px;
            color: white;
            text-align: center;
            height: 30px;
            line-height: 30px;
            margin-right: 5px;
        }

        .level_menu {
            width: 110px;
            background-color: green;
            color:white;
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
                    <h3 style="color:white;">Course Budgets</h3>
                    <br />
                </div>
            </div>
            <div class="row clearfix" style="background-color: #28a745;">
                <div class="col-sm-3" style="align-content: center;">
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
                            <td style="color:white;" id="userName">Welcome
                                <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
                            </td>
                            <td id="Logout">
                                <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="btn btn-warning" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="dvGrid" style="padding: 10px; width: 1050px">
            <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                <tr>
                    <td style="width: 150px">Title:<br />
                        <asp:TextBox ID="txtTitle" runat="server" Width="140" />
                    </td>
                    <td style="width: 150px">First Name:<br />
                        <asp:TextBox ID="txtFName" runat="server" Width="140" />
                    </td>
                    <td style="width: 150px">Last Name:<br />
                        <asp:TextBox ID="txtLName" runat="server" Width="140" />
                    </td>
                    <td style="width: 150px">City:<br />
                        <asp:TextBox ID="txtCity" runat="server" Width="140" />
                    </td>
                    <td style="width: 150px">State:<br />
                         <asp:DropDownList ID="ddlState" runat="server" Width="140">
                                </asp:DropDownList>
                    </td>
                    <td style="width: 150px">Type:<br />
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
                        Width="1050">
                        <Columns>
                            <asp:TemplateField HeaderText="Title" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTitle" runat="server" Text='<%# Eval("title") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblFName" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFName" runat="server" Text='<%# Eval("firstName") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblLName" runat="server" Text='<%# Eval("lastName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLName" runat="server" Text='<%# Eval("lastName") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("city") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblState" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ddlState" runat="server" Text='<%# Eval("state") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Type" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("type") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="ddlType" runat="server" Text='<%# Eval("type") %>' Width="140"></asp:TextBox>
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
    
    <script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
<script type="text/javascript">
    $(function () {
        BlockUI("dvGrid");
        $.blockUI.defaults.css = {};
    });
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            $("#" + elementID).block({ message: '<div align = "center">' + '<img src="images/loadingAnim.gif"/></div>',
                css: {},
                overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    };
</script>

</body>
</html>
