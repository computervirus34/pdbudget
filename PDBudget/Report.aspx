﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="PDBudget.Report" %>

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
    
	.freeze-table{
		border-spacing:0;
        position:relative;
		font-family:"segoe UI",sans-serif, "Helvetica Neue";
		font-size:14px;
		padding:0;
		border:1px solid #ccc;
        height:200px;
	}
	thead th{
		top:0;
		position:sticky;
		background-color:#666;
		color:#fff;
		z-index:1;
		min-height:30px;
		height:30px;
		text-align:left;
        width:auto;
	}
	th,td{
		padding:0;
		outline:1px solid #ccc;
        background-color:aquamarine;
		border:none;
		outline-offset:-1px;
		padding-left:5px;
        z-index:1;
	}
	tr{
		min-height:25px;
		height:25px;
	}
	.col-id-no-1{
		left:20px;
		position:sticky;
	}
	.col-id-no-2{
		left:90px;
		position:sticky;
	}
    .col-id-no-3{
		left:160px;
		position:sticky;
	}
    .col-id-no-4{
		left:230px;
		position:sticky;
	}
    .col-id-no-5{
		left:300px;
		position:sticky;
	}
    .col-id-no-6{
		left:370px;
		position:sticky;
	}
    .col-id-no-7{
		left:440px;
		position:sticky;
	}
    .col-id-no-8{
		left:510px;
		position:sticky;
	}
    .col-id-no-9{
		left:580px;
		position:sticky;
	}
    .col-id-no-10{
		left:650px;
		position:sticky;
	}

    .col-id-no-11{
		left:720px;
		position:sticky;
	}
    .col-id-no-12{
		left:790px;
		position:sticky;
	}
    .col-id-no-13{
		left:860px;
		position:sticky;
	}
    .col-id-no-14{
		left:930px;
		position:sticky;
	}
    .col-id-no-15{
		left:950px;
		position:sticky;
	}
	.fixed-header{
		z-index:50;
	}
	
    .vertical-th {
             writing-mode: vertical-lr;
             
             min-width: 50px; /* for firefox */
        } 
    
    .tableFixHead          { overflow-y: auto; height: 500px; }
    .tableFixHead thead th { position: sticky; top: 0; }

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
            <div class="row clearfix table-responsive" style="background-color:aquamarine;">
                <div class="col-sm-12 tableFixHead">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
