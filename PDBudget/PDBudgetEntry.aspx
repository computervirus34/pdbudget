<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDBudgetEntry.aspx.cs"
    Inherits="PDBudget.PDBudgetEntry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PD Budget</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="styles/jquery-ui.css" rel="stylesheet" />
    <link type="text/css" href="Styles/select2.min.css" rel="stylesheet" />
    <script type="text/javascript" src="scripts/jquery.min.js"></script>

    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <style type="text/css">
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        .legendCss {
            background-color: #B7E2FF;
        }

        td, th {
            border: 1px solid none;
            text-align: left;
            padding: 0px;
        }

        .OutputValue {
            text-align: center;
            color: Green;
            font-weight: bold;
            font: 14px/1 Verdana,Helvetica;
            width: 20px !important;
        }

        input[type='text'] {
            text-align: left;
        }



        .AssInput {
            text-align: center;
            background-color: #CDCDCD;
            color: #000000;
            font: 12px/1 Verdana,Helvetica;
            font-weight: bold;
        }

        .YellowInput {
            text-align: right;
            background-color: #FFFF00;
            color: #000000;
            font: 12px/1 Verdana,Helvetica;
            font-weight: bold;
            width: 50px !important;
        }

        td .form-group {
            height: 30px;
            margin-top: 0px !important;
            margin-bottom: 0px !important;
            margin-left: 5px;
        }

        td .form-control {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 0px;
            height: 25px;
            width: 100% !important;
            top: 0px;
            left: 0px;
        }

            td .form-control dropdown {
                border: 1px solid #dddddd;
                text-align: right;
                padding: 0px;
                height: 25px;
                width: 180px !important;
            }

        .tableHeight {
            height: 200px;
        }

        .proincminnum {
            /*background-color: #D7E4BC;*/
            background-color: #D8E4BC !important;
            color: Blue;
            font-weight: bold;
            font-size: 12px;
        }

        .proincavgatten {
            background-color: #FCD5B4; /*background-color: rgb(252,213,180) !important;*/
            color: Blue;
            font-size: 12px;
            margin-top: 10px;
            font-weight: bold;
        }

        .proincacv40margin {
            background-color: #CCC0DA; /* background-color: rgb(204,192,218) !important;*/
            color: Blue;
            font-size: 12px;
            margin-top: 10px;
            font-weight: bold;
        }

        .actualFiqure {
            background-color: rgb(184,204,228) !important;
            text-align: center;
        }

        .freePlaceName {
            width: 120px !important;
        }

        .freePlaceName {
            border: 1px solid #dddddd;
            text-align: right;
            padding: 0px;
            height: 25px;
            width: 80px !important;
        }

        .txtexpense {
            width: 60px;
        }

        .horizontalLineCss {
            border-bottom: 2px solid black;
            border-right: 1px solid black;
        }

        .horizontalLineAvgCss {
            border-bottom: 2px solid black;
            border-right: 1px solid black;
            height: 25px;
        }

        .ButtonStyle {
            margin-left: 60px;
        }
    </style>
    <style type="text/css">
        .box-body {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 3px;
            border-bottom-left-radius: 3px;
            padding: 0px;
            position: relative;
        }

        .text-on-pannel {
            background: #fff none repeat scroll 0 0;
            height: auto;
            margin-left: 2px;
            padding: 3px 5px;
            position: absolute;
            margin-top: -35px;
            margin-bottom: -35px;
            border: 1px solid #337ab7;
            border-radius: 8px;
            font-size: 16px;
        }

        .panel {
            /* for text on pannel */
            margin-top: 20px !important;
        }

        .panel-body {
            padding-top: 23px !important;
        }

        thead {
            background: #3c8dbc;
            color: white;
        }

        #paddingDiv {
            padding: 10px 0px 0px 0px;
        }
    </style>
    <style type="text/css">
        /*Adding some css for looks good*/

        span.error {
            display: block;
            visibility: hidden;
            color: red;
            font-size: 90%;
        }

        .tblPresenters table th td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        /*css for table*/
        .container td {
            vertical-align: top;
        }

        .tablecontainer table {
            width: 100%;
            border-collapse: collapse;
            border-top: 1px solid #BFAEAE;
            border-right: 1px solid #BFAEAE;
            background-color: #CDCDCD;
        }

        .tablecontainer th {
            border-bottom: 2px solid #BFAEAE !important;
            text-align: center;
            background-color: #CDCDCD;
            color: Black;
        }

        .tablecontainer td {
            border-left: 1px solid #BFAEAE;
            padding: 5px;
            border-bottom: 1px solid #BFAEAE;
            background-color: #CDCDCD;
            color: Blue;
        }

        .ui-widget {
            font-size: 12px !important;
        }

        .tdExp {
            width: 350px !important;
        }

        .tdSubFT {
            width: 20px !important;
        }

        .tdExSubFT {
            width: 120px !important;
        }

        .tdCwidth {
            width: 80px !important;
        }

        .fixedPriceInput {
            background-color: #CDCDCD;
            text-align: right;
            color: Black;
            font: 18px/1 Verdana,Helvetica;
        }

        .fixedPriceOutput {
            text-align: right;
            color: Black;
            font: 12px/1 Verdana,Helvetica;
        }

        .OtherExpenseInput {
            text-align: center !important;
            color: Black;
            font: 12px/1 Verdana,Helvetica;
            width: 100% !important;
            height: 20px;
            background-color: #E4E0E4 !important;
        }

        .OtherExpenseInput1 {
            text-align: center !important;
            color: Black;
            font: 12px/1 Verdana,Helvetica;
            width: 100% !important;
            height: 20px;
            background-color: #FFFFFF !important;
        }

        /*
        .tblProfitSplit1
        {
            float: left;
            width: 33%;
            background-color: #9BBB59;
            font: 14px/1 Verdana,Helvetica;
        }
        .tblProfitSplit2
        {
            float: left;
            width: 30%;
            background-color: #FCD5B4;
            font: 14px/1 Verdana,Helvetica;
        }
        .tblProfitSplit3
        {
            float: left;
            width: 33%;
            background-color: #CCC0DA;
            font: 14px/1 Verdana,Helvetica;
        }
        .tblProfitSplit1 tr td, .tblProfitSplit2 tr td, .tblProfitSplit3 tr td
        {
            border: 1px solid #100f0f;
            text-align: center;
        }
        
        .tblProfitSplit1 th, .tblProfitSplit2 th, .tblProfitSplit3 th
        {
            border: 1px solid #100f0f;
            text-align: center;
        }*/

        .tblOthers {
            background-color: White;
            color: #000000;
            text-align: center;
        }

        .tdSpecificCss {
            background-color: White !important;
            width: 50px !important;
        }

        .tdSpecificCss1 {
            background-color: White !important;
            width: 120px;
        }

        .PresenterTd {
            background-color: #7092BE;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            height: 20px;
        }

            .PresenterTd td {
                background-color: #7092BE;
                color: #FFFFFF;
                font: 12px/1 Verdana,Helvetica;
                text-align: center !important;
            }

            .PresenterTd th {
                text-align: center !important;
            }

            .PresenterTd tr td {
                text-align: center !important;
                background-color: #E4E0E4;
            }

        .OtherExpenseTd {
            text-align: left !important;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            width: 100% !important;
            height: 20px;
            background-color: #7F7F7F !important;
        }


            .OtherExpenseTd td {
                background-color: #7092BE;
                color: #FFFFFF;
                font: 12px/1 Verdana,Helvetica;
                text-align: center !important;
                height: 20px;
            }

            .OtherExpenseTd th {
                text-align: center !important;
            }

            .OtherExpenseTd tr td {
                text-align: center !important;
                background-color: #E4E0E4;
            }

        .TutorTd {
            background-color: #6F9568;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            height: 20px;
        }

            .TutorTd th {
                text-align: center !important;
            }

            .TutorTd tr td {
                text-align: center !important;
                background-color: #E4E0E4;
            }

        .ConvenorTd {
            background-color: #808000;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            height: 20px;
        }

            .ConvenorTd th {
                text-align: center !important;
            }

            .ConvenorTd tr td {
                text-align: center !important;
                background-color: #E4E0E4;
            }

        .tdInvoiceCss {
            background-color: White;
            color: #B8CCE4;
            text-align: right;
        }

        .spnfoot {
            text-align: right;
        }

        .cateringCss {
            background-color: #8080C0;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            height: 25px;
            border: 0px solid black;
            border-collapse: collapse;
        }

            .cateringCss th {
                text-align: center !important;
            }

            .cateringCss tr td {
                text-align: center !important;
                background-color: #E4E0E4;
                border: 0px solid black;
                border-collapse: collapse;
            }

        .cateringInvCss {
            background-color: #7092BE;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            height: 20px;
            border: 0px solid gray;
        }

        .invCommonCss {
            background-color: #7092BE;
            color: #FFFFFF;
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            height: 20px;
            border: 0px solid gray;
        }

        .tdInvoiceCss {
            text-align: center !important;
            color: White;
            font: 12px/1 Verdana,Helvetica;
            width: 100% !important;
            height: 20px;
            background-color: #7092BE !important;
        }

        .tblOtherExpenseCss {
            text-align: center !important;
            color: White;
            font: 12px/1 Verdana,Helvetica;
            width: 100% !important;
            height: 20px;
            background-color: #B8CCE4 !important;
        }

        .tblOtherInvoiceCss {
            text-align: center !important;
            color: White;
            font: 12px/1 Verdana,Helvetica;
            width: 100% !important;
            height: 20px;
            background-color: #7F7F7F !important;
        }

        .otherExpenseOutputTextBox {
            text-align: center !important;
            font: 12px/1 Verdana,Helvetica;
            color: White;
            width: 810px !important;
            height: 20px;
            background-color: #7F7F7F !important;
        }

        .otherExpenseHeader {
            text-align: center !important;
            color: White;
            font: 12px/1 Verdana,Helvetica;
            width: 810px !important;
            height: 20px;
            background-color: #7F7F7F !important;
        }

        .otherExpenseDynamicHeader {
            text-align: center !important;
            color: Black;
            font: 12px/1 Verdana,Helvetica;
            width: 920px !important;
            height: 20px;
            font-weight: bold;
        }

        .otherExpenseCodeHeader {
            text-align: center !important;
            color: White;
            font: 12px/1 Verdana,Helvetica;
            width: 620px !important;
            height: 20px;
            background-color: #7F7F7F !important;
        }

        .otherExpenseCodeDynamicHeader {
            text-align: center !important;
            color: Black;
            font-weight: bold;
            font: 12px/1 Verdana,Helvetica;
            width: 650px !important;
            height: 20px;
        }

        .otherExpenseAmtHeader {
            text-align: center !important;
            color: White;
            font: 12px/1 Verdana,Helvetica;
            width: 40px !important;
            height: 20px;
            background-color: #7F7F7F !important;
        }

        .otherExpenseAmtDynamicHeader {
            text-align: center !important;
            color: Black;
            font-weight: bold;
            font: 12px/1 Verdana,Helvetica;
            width: 80px !important;
            height: 20px;
        }

        .otherExpenseInvHeader {
            text-align: center !important;
            color: Black;
            font: 12px/1 Verdana,Helvetica;
            width: 90px !important;
            height: 20px;
            background-color: #B8CCE4 !important;
        }

        .otherExpenseInvDateHeader {
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            width: 152px !important;
            height: 20px;
            color: Black;
            background-color: #B8CCE4 !important;
        }

        .dateCss {
            font: 12px/1 Verdana,Helvetica;
            text-align: center !important;
            width: 152px !important;
            height: 20px;
            color: Black;
        }

        .dynamicDateCss {
            text-align: center !important;
            width: 152px !important;
            height: 20px;
            color: White;
            background-color: #B8CCE4 !important;
        }

        .otherExpenseExpCodeHeader {
            text-align: center !important;
            color: Black;
            font: 12px/1 Verdana,Helvetica;
            width: 120px !important;
            height: 20px;
            background-color: #B8CCE4 !important;
        }

        .profitLossCss {
            text-align: right !important;
            font: 12px/1 Verdana,Helvetica;
            width: 80px !important;
            height: 20px;
            background-color: #D8E4BC !important;
        }

        .otherExpenseInputTextBox {
            text-align: left;
            font: 12px/1 Verdana,Helvetica;
            color: Black;
            width: 100% !important;
            height: 20px;
        }
    </style>
    <style type="text/css">
        .expenseTdClass {
            text-align: right !important;
        }

        .expenseTextTdClass {
            text-align: center !important;
        }

        .tblProfitSplit1 {
            border-collapse: collapse;
            border: 1px solid gray;
            width: calc(33% - 10px);
            float: left;
            margin: 2px;
            background-color: #9BBB59;
        }

        .tblProfitSplit2 {
            border-collapse: collapse;
            border: 1px solid gray;
            width: calc(33% - 10px);
            float: left;
            margin: 2px;
            background-color: #FCD5B4;
        }

        .tblProfitSplit3 {
            border-collapse: collapse;
            border: 1px solid gray;
            width: calc(33% - 10px);
            float: left;
            margin: 2px;
            background-color: #CCC0DA;
        }

            .tblProfitSplit1 tr td, .tblProfitSplit2 tr td, .tblProfitSplit3 tr td {
                border: 1px solid #100f0f;
                text-align: center;
            }

            .tblProfitSplit1 th, .tblProfitSplit2 th, .tblProfitSplit3 th {
                border: 1px solid #100f0f;
                text-align: center;
            }
    </style>
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


        .tablink {
            background-color: #555;
            color: white;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            font-size: 15px;
            width: 16.6%;
        }

            .tablink:hover {
                background-color: #777;
            }

        #myBtn {
            display: none;
            position: fixed;
            bottom: 0px;
            right: 10px;
            z-index: 99;
            font-size: 16px;
            border: none;
            outline: none;
            background-color: red;
            color: white;
            cursor: pointer;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 15px;
            padding-right: 15px;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }
            #myBtn:hover {
                background-color: #555;
            }
    </style>
    <link href="Styles/W3.css" rel="stylesheet" />
</head>
<body class="theme-red">
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
                            <asp:MenuItem Text="Report" Value="Report" NavigateUrl="~/report"></asp:MenuItem>
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
            <div class="row" style="position: sticky; background-color: darkcyan">
                <a class="tablink" href="#generalInfo">General Info</a>
                <a class="tablink" href="#locationDate">Location and Date</a>
                <a class="tablink" href="#participant">Participants</a>
                <a class="tablink" href="#projectedIncome">Projected Income</a>
                <a class="tablink" href="#expense">Expense(Ex. GST)</a>
                <a class="tablink" href="#projectedProfitLoss">Projected Profit Loss</a>
            </div>
            <div id="generalInfo" class="panel panel-primary legendCss">
                <div class="panel-body" style="padding-top: 4px;">
                    <h3 class="text-on-pannel text-primary" style="font-weight: bold; color: Green; font: 18px/1 Verdana,Helvetica;"
                        align="left">
                        <strong>General Info </strong>
                    </h3>
                    <div class="row clearfix">
                        <div class="col-sm-4">
                            <label>
                                Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control dropdown">
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Aptify ID
                            </label>
                            <div class="form-group">
                                <asp:TextBox ID="txtAptifyID" runat="server" class="form-control input-sm" placeholder="Please enter aptify id"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Iteration/Course Code
                            </label>
                            <div class="form-group">
                                <input type="text" id="txtCourseCode" runat="server" class="form-control" placeholder="Please enter course code" />
                                <asp:DropDownList ID="ddlCourseCode" runat="server" CssClass="form-control dropdown">
								</asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">

                        <div class="col-sm-4">
                            <label>
                                Course Name</label>
                            <asp:DropDownList ID="ddlCourseName" runat="server" CssClass="form-control dropdown">
                            </asp:DropDownList>
                        </div>

                        <div class="col-sm-4">
                            <label>
                                Host Group</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlGroup" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <label>
                                CPD Hours</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlCPDHours" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">

                        <div class="col-sm-4">
                            <label>
                                Course Level
                            </label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlCourseLevel" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Co-host</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlCoHost" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Duration (Days)</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlDurationDays" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-4">
                            <label>
                                Co-ordinator</label>
                            <div class="form-group">
                                <input type="text" id="txtCoordinator" runat="server" class="form-control" placeholder="Please enter co-ordinator" />
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <label>
                                Additional Group</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlAdditionalGroup" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                            </label>
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="locationDate" class="panel panel-primary legendCss">
                <div class="panel-body" style="padding-top: 4px;">
                    <h3 class="text-on-pannel text-primary" style="font-weight: bold; color: Green; font: 18px/1 Verdana,Helvetica;"
                        align="left">
                        <strong>Location & Date</strong></h3>
                    <div class="row clearfix">
                        <div class="col-sm-4">
                            <label>
                                Country</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                State</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Metro/Regional Location</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlMetroRegionalLocation" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-4">
                            <label>
                                Venue</label>
                            <div class="form-group">
                                <input type="text" runat="server" id="txtAddress" class="form-control" placeholder="Please enter venue" />
                            </div>
                        </div>
                        <div class="col-sm-4" id="ddSuburb" style="display: block;">
                            <label>
                                Suburb/City</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlSuburb" runat="server" CssClass="form-control dropdown">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-sm-4" id="txArea" style="display: none;">
                            <label>
                                Suburb/City</label>
                            <div class="form-group">
                                <input type="text" runat="server" id="txtArea" class="form-control" placeholder="Please enter area" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Zip Code</label>
                            <div class="form-group">
                                <input type="text" runat="server" id="txtZip" class="form-control" placeholder="Please enter zip" />
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-4">
                            <label>
                                Iteration dates</label>
                            <div class="form-group">
                                <input type="text" runat="server" id="txtCourseDate" class="form-control" placeholder="Please enter iteration date" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Iteration begin date</label>
                            <div class="form-group">
                                <input type="date" runat="server" id="txtIterationBeginDate" class="form-control" placeholder="Please enter iteration begin date" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Iteration end date</label>
                            <div class="form-group">
                                <input type="date" runat="server" id="txtIterationEndDate" class="form-control" placeholder="Please enter iteration end date" />
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-4">
                            <label>
                                Created By</label>
                            <div class="form-group">
                                <input type="text" id="txtCreatedBy" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Modified By</label>
                            <div class="form-group">
                                <input type="text" id="txtModifiedBy" runat="server" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12" align="center">
                            <button type="button" id="btnSave" class="btn btn-success">
                                Save</button>&nbsp;&nbsp;
                            <button type="button" id="btnReset" class="btn btn-primary" onclick="ClearFields();">
                                Modify</button>&nbsp;&nbsp;
                            <button type="button" id="Button3" class="btn btn-success" onclick="AddNewCCCustomerComplain();">
                                Submit</button>&nbsp;&nbsp;
                            <button type="button" id="btnPreview" class="btn btn-primary"">
                                Preview</button>
                        </div>
                    </div>
                    <div class="row clearfix" style="display: none;" id="divForecast">
                        <div class="col-sm-4">
                            <label>
                                Forecast approval off By</label>
                            <div class="form-group">
                                <input type="text" id="Text10" runat="server" class="form-control" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <label>
                                Signed off By</label>
                            <div class="form-group">
                                <input type="text" id="txtSignedoffBy" runat="server" class="form-control" />
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <label>
                            </label>
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix" style="display: none;" id="btnForecast">
                        <div class="col-sm-6">
                            <div class="form-group offset-4">
                                <button type="button" id="Button2" class="btn btn-primary">
                                    Forecast Approval
                                </button>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group offset-1">
                                <button type="button" id="Button1" class="btn btn-success">
                                    Final Sign Off
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="participant" class="panel panel-primary legendCss">
                <div class="panel-body" style="padding-top: 4px;">
                    <h3 class="text-on-pannel text-primary" style="font-weight: bold; color: Green; font: 18px/1 Verdana,Helvetica;"
                        align="left">
                        <strong>Participants</strong></h3>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table>
                                <tr>
                                    <th style="width: 300px; text-align: center; font: 12px/1 Verdana,Helvetica;">
                                        <b>Participants</b>
                                    </th>
                                    <th></th>
                                    <th style="width: 100px; text-align: center; font: 12px/1 Verdana,Helvetica; font-weight: bold;">Total
                                    </th>
                                    <th style="width: 100px; text-align: center; font: 12px/1 Verdana,Helvetica; font-weight: bold;">Total Participants/ Students
                                    </th>
                                    <th style="text-align: center; font: 12px/1 Verdana,Helvetica; font-weight: bold;">Free Place Name(S)
                                    </th>
                                </tr>
                                <tr>
                                    <td style="width: 320px !important; font-weight: bold; color: Blue;">Total Numbers of Presenters (Only)
                                    </td>
                                    <td style="width: 100px;">
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalNumberOfPresentersOnly" onkeyup="CalculateTotal();" runat="server"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td colspan="2" rowspan="3"></td>

                                    <td rowspan="7">
                                        <center>
                                            <div class="form-group" style="width: 300px;">
                                                <asp:TextBox ID="TextBox8" runat="server" Style="width: 250px; text-align: center;" class="form-control AssInput"></asp:TextBox>
                                            </div>
                                            <div class="form-group" style="width: 300px;">
                                                <asp:TextBox ID="TextBox9" runat="server" Style="width: 250px; text-align: center;" class="form-control AssInput"></asp:TextBox>
                                            </div>
                                            <div class="form-group" style="width: 300px;">
                                                <asp:TextBox ID="TextBox10" runat="server" Style="width: 250px; text-align: center;" class="form-control AssInput"></asp:TextBox>
                                            </div>
                                            <div class="form-group" style="width: 300px;">
                                                <asp:TextBox ID="TextBox11" runat="server" Style="width: 250px; text-align: center;" class="form-control AssInput"></asp:TextBox>
                                            </div>
                                            <div class="form-group" style="width: 300px;">
                                                <asp:TextBox ID="TextBox12" runat="server" Style="width: 250px; text-align: center;" class="form-control AssInput"></asp:TextBox>
                                            </div>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; color: Blue;">Total No. of Consultants (Incl Presenters)
                                    </td>
                                    <td align="center">
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalNoOfConsultantsInput" onkeyup="CalculateTotal();" runat="server"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; color: Blue;">Number of Free Places
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtNofOfFreePlaces" runat="server" onkeyup="CalculateTotal();"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #D7E4BC !important; font-weight: bold; color: Blue;">Minimum Paying Participants to Run Course
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtMinPayingParticipant" runat="server" onkeyup="CalculateTotal();"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantIncResMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantOnlyMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: rgb(252,213,180) !important; font-weight: bold; color: Blue;">Avarage Paying Participant Number
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtAvgPayingPaticipant" runat="server" onkeyup="CalculateTotal();"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantIncResAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantOnlyAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: rgb(204,192,218) !important; font-weight: bold; color: Blue;">Minimum Paying to Achieve 40+% Margin
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txt40PerPayingParticipant" runat="server" onkeyup="CalculateTotal();"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantIncRes40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantOnly40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; color: Blue;">Maximum Available
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtMaximumAvailable" runat="server" onkeyup="CalculateTotal();"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantIncResMax" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtTotalParticipantOnlyMax" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="projectedIncome" class="panel panel-primary">
                <div class="panel-body" style="padding-top: 4px;">
                    <h3 class="text-on-pannel text-primary" style="font-weight: bold; color: Green; font: 18px/1 Verdana,Helvetica; text-align: left;">
                        <strong>Projected income</strong></h3>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table style="width: 1050px;">
                                <tr style="color: Black;">
                                    <th style="width: 350px; color: #4554AA; font-size: 18px; border-bottom: 2px solid black;">Contribution to Overhead
                                    </th>
                                    <th style="text-align: center; width: 100px; border-bottom: 2px solid black;">
                                        <center>
                                            <asp:TextBox Style="text-align: center;" ID="txtOverheadContribution" min="0.1" onkeyup="CalculateTotal();"
                                                runat="server" onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm AssInput"></asp:TextBox>
                                        </center>
                                    </th>
                                    <th style="text-align: center; width: 100px; border-bottom: 2px solid black;"></th>
                                    <th style="text-align: center; width: 100px; border-bottom: 2px solid black;"></th>
                                    <th style="text-align: center; width: 100px; border-bottom: 2px solid black;"></th>
                                    <th style="text-align: center; width: 100px; border-bottom: 2px solid black;">
                                        <center>
                                            MINIMUM</center>
                                    </th>
                                    <th class="actualFiqure" colspan="2" style="width: 100px!important; border-bottom: 2px solid black;">
                                        <center>
                                            Post Event<br />
                                            Office Use Only</center>
                                    </th>
                                </tr>
                                <%--   <tr>
                                <th style="width: 330px; color: #4554AA; font-size: 18px; border-bottom: 2px solid black;">
                                    Contribution to Overhead
                                </th>
                                <th style="text-align: center; width: 170px; border-bottom: 2px solid black;">
                                    <center>
                                        <asp:TextBox Style="text-align: center;" ID="TextBox5" onkeyup="CalculateTotal();"
                                            runat="server" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                            CssClass="form-control input-sm AssInput"></asp:TextBox>
                                    </center>
                                </th>
                                <th style="text-align: center; width: 100px; border-bottom: 2px solid black;">
                                </th>
                                <th style="text-align: center; width: 50px; border-bottom: 2px solid black;">
                                </th>
                                <th style="text-align: center; width: 170px; border-bottom: 2px solid black;">
                                </th>
                                <th style="text-align: center; width: 100px; border-bottom: 2px solid black;">
                                    <center>
                                        MINIMUM
                                    </center>
                                </th>
                                <th colspan="2" class="actualFiqure" style="text-align: center; width: 160px; border-bottom: 2px solid black;">
                                    <center>
                                        Post Event<br />
                                        Office Use Only
                                    </center>
                                </th>
                            </tr>--%>
                            </table>
                        </div>
                    </div>
                    <div class="row clearfix table-responsive-sm">
                        <div class="col-sm-12">
                            <table class="proincminnum" style="width: 1050px;">
                                <tr style="color: Black;">
                                    <th style="width: 350px;" class="horizontalLineCss">PROJECTED INCOME MINIMUM NUMBERS
                                    </th>
                                    <th style="text-align: center; width: 100px;" class="horizontalLineCss">
                                        <center>
                                            Course Fee (incl. GST)
                                        </center>
                                    </th>
                                    <th style="text-align: center; width: 100px;" class="horizontalLineCss">#Participants
                                    </th>
                                    <th style="text-align: center; width: 100px;" class="horizontalLineCss">Total Paying Participants
                                    </th>
                                    <th style="text-align: center; width: 100px;" class="horizontalLineCss">Course Fee (ex. GST)
                                    </th>
                                    <th style="text-align: center; width: 100px;" class="horizontalLineCss">Total $ (ex GST)
                                    </th>
                                    <th class="actualFiqure" style="width: 100px; border-bottom: 2px solid black; border-right: 1px solid black;">Aatual # Partic
                                    </th>
                                    <th class="actualFiqure" style="width: 100px; border-bottom: 2px solid black;">Actual Income(ex. GST)
                                    </th>
                                </tr>
                                <tr>
                                    <td>Participant Fee - Early Bird Group / Distance Discount Member
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtParticipantFeeEBDistantMin" onkeyup="CalculateTotal();"
                                            pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="Amount"
                                            runat="server" CssClass="form-control input-sm "></asp:TextBox>

                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantEBDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="txtParticipantPerEBDistantMin" onkeyup="CalculateTotal();" Text="70%" BackColor="#D8E4BC" runat="server"
                                            CssClass="form-control input-sm OutputValue"></asp:TextBox>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtCourseFeeEBDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalFeeEBDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActParticipantEBDistantMin" onkeyup="CalculateTotal();" onkeypress="return isFloatNumber(this,event);"
                                                runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActIncomeEBDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Participant Fee - Early Bird APA Member
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantFeeEBApaMin" runat="server" CssClass="form-control input-sm currencyMask OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantEBApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox></center>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="txtParticipantPerEBApaMin" onkeyup="CalculateTotal();" Text="10%" BackColor="#D8E4BC" runat="server"
                                            CssClass="form-control input-sm OutputValue"></asp:TextBox>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtCourseFeeEBApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalFeeEBApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActParticipantEBApaMin" onkeyup="CalculateTotal();" runat="server"
                                                onkeypress="return isFloatNumber(this,event);" CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActIncomeEBApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Participant Fee - Early Bird Non Member
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantFeeEBNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantEBNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="txtParticipantPerEBNonMemberMin" onkeyup="CalculateTotal();" Text="5%" BackColor="#D8E4BC" runat="server"
                                            CssClass="form-control input-sm OutputValue"></asp:TextBox>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtCourseFeeEBNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalFeeEBNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActParticipantEBNonMemberMin" onkeyup="CalculateTotal();" runat="server"
                                                onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActIncomeEBNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: Green;">&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                    <td style="text-align: center;"></td>
                                    <td></td>
                                    <td></td>
                                    <td class="actualFiqure"></td>
                                    <td class="actualFiqure"></td>
                                </tr>
                                <tr>
                                    <td style="color: red; font-weight: bold; height: 30px; font-size: 15px;">Diff b/w EB and standard price
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtDiffBWSPMin" Text="$85.00" runat="server" onkeyup="CalculateTotal();" CssClass="form-control input-sm OutputValue"
                                                pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="Amount" Enabled="true"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td></td>
                                    <td style="text-align: center;"></td>
                                    <td></td>
                                    <td></td>
                                    <td class="actualFiqure"></td>
                                    <td class="actualFiqure"></td>
                                </tr>
                                <tr>
                                    <td style="color: Green;">&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                    <td style="text-align: center;"></td>
                                    <td></td>
                                    <td></td>
                                    <td class="actualFiqure"></td>
                                    <td class="actualFiqure"></td>
                                </tr>
                                <tr>
                                    <td>Participant Fee - Non Early Bird Group / Distance Discount Member
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantFeeNonDistantMin" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantNonDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="txtParticipantPerNonDistantMin" onkeyup="CalculateTotal();" Text="5%" BackColor="#D8E4BC" runat="server" CssClass="form-control input-sm OutputValue"></asp:TextBox>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtCourseFeeNonDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalFeeNonDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActParticipantNonDistantMin" onkeyup="CalculateTotal();" runat="server"
                                                onkeypress="return isFloatNumber(this,event);" CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActIncomeNonDistantMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Participant Fee - Non Early Bird APA Member
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantFeeNonApaMin" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantNonApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="txtParticipantPerNonApaMin" onkeyup="CalculateTotal();" Text="5%" BackColor="#D8E4BC" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtCourseFeeNonApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalFeeNonApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActParticipantNonApaMin" onkeyup="CalculateTotal();" runat="server" onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActIncomeNonApaMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Participant Fee - Non Early Bird Non Member
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantFeeNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtParticipantNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:TextBox ID="txtParticipantPerNonMemberMin" onkeyup="CalculateTotal();" Text="5%" BackColor="#D8E4BC" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="true"></asp:TextBox>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtCourseFeeNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalFeeNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActParticipantNonMemberMin" onkeyup="CalculateTotal();" runat="server" onkeypress="return isFloatNumber(this,event);"
                                                CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActIncomeNonMemberMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false" OnTextChanged="txtActIncomeNonMemberMin_TextChanged"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="text-align: right;" id="percentageTotalMin"></td>
                                    <td></td>
                                    <td></td>
                                    <td class="actualFiqure"></td>
                                    <td class="actualFiqure"></td>
                                </tr>
                                <tr>
                                    <td>Sponsorship
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtSponsorshipMin" Text="$0.00" onkeyup="CalculateTotal();" runat="server"
                                                pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="Amount"
                                                CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td></td>
                                    <td>
                                        <center>
                                            <asp:TextBox ID="txtSponsorshipCourseFeeMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTotalSponsorshipCourseFeeMin" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActualParticSponsorshipMinInput" onkeyup="CalculateTotal();"
                                                onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                runat="server" Enabled="false" CssClass="form-control input-sm"></asp:TextBox>
                                        </center>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtActSponsorshipMin" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5"></td>
                                    <td class="actualFiqure">
                                        <asp:TextBox ID="txtAllMinIncomeGrandTotal" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <asp:TextBox ID="txtFinalActualParticMinOutput" runat="server" CssClass="form-control input-sm OutputValue"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                    <td class="actualFiqure">
                                        <center>
                                            <asp:TextBox ID="txtFinalActualIncomeMinOutput" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </center>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <br />
                        </div>
                    </div>
                    <a href="#tableAvgIncome" class="btn btn-info" data-toggle="collapse">+ Projected Income at Average Participant</a>
                    <div class="collapse" id="tableAvgIncome">
                        <div class="row clearfix  table-responsive-sm">
                            <div class="col-sm-12">

                                <table class="proincavgatten" style="width: 1050px;">
                                    <tr style="color: Black;">
                                        <th style="width: 350px;" class="horizontalLineAvgCss">PROJECTED INCOME AT AVG ATTENDANCE No's
                                        </th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">Course Fee
                                        </th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">#Participants
                                        </th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">Total Paying Participants</th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">Course Fee (Ex GST)
                                        </th>
                                        <th style="text-align: left; width: 100px;" class="horizontalLineAvgCss">Total $ (Ex GST)
                                        </th>
                                        <th style="width: 100px;" class="horizontalLineAvgCss"></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--Participant Fee - Group Member--%>
                                    Participant Fee - Early Bird Group / Distance 
                                    <br />
                                            Discount Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeEBDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantEBDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="EBDistantAvg">

                                            <asp:TextBox ID="TextBox2" Text="70" Style="display: none;" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeEBDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalFeeEBDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="width: 200px;"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--Participant Fee - APA Member--%>
                                    Participant Fee - Early Bird APA Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeEBApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantEBApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="EBApaAvg">
                                            <asp:TextBox ID="TextBox5" Text="10" Style="display: none;" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeEBApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalFeeEBApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left!important;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--Participant Fee - Non Member--%>
                                    Participant Fee - Early Bird Non Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeEBNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantEBNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="EBNonMemberAvg">
                                            <asp:TextBox ID="TextBox6" Text="5" Style="display: none;" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeEBNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalFeeEBNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left!important;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color: Green;">&nbsp;</td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: center;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color: red; font-weight: bold; height: 30px; font-size: 15px;">Diff b/w EB and standard price
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtDiffBWEBSPAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                        <td style="text-align: center;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color: Green;">&nbsp;</td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: center;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Participant Fee - Non Early Bird Group / Distance Discount Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeNonDistantAvg" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantNonDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="NonDistantAvg">
                                            <asp:TextBox ID="txtParticipantPerNonDistantAvg" Text="5" Style="display: none;" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeNonDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalFeeNonDistantAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td>Participant Fee - Non Early Bird APA Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeNonApaAvg" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantNonApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="NonApaAvg">
                                            <asp:TextBox ID="txtParticipantPerNonApaAvg" Text="5" Style="display: none;" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeNonApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalFeeNonApaAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td>Participant Fee - Non Early Bird Non Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="NonMemberAvg">
                                            <asp:TextBox ID="txtParticipantPerNonMemberAvg" Text="5" Style="display: none;" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalFeeNonMemberAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right;" id="totalPercentageAvg"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Sponsorship
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtSponsorshipAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtSponsorshipCourseFeeAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalSponsorshipCourseFeeAvg" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td>
                                            <asp:TextBox ID="txtAvgGrandTotal" runat="server" CssClass="form-control input-sm OutputValue"
                                                Style="float: left!important;" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <br />
                        </div>
                    </div>
                    <a href="#table40PerIncome" class="btn btn-info" data-toggle="collapse">+ Projected Income at 40% Margin Participant</a>
                    <div class="collapse" id="table40PerIncome">
                        <div class="row clearfix  table-responsive-sm">
                            <div class="col-sm-12">
                                <table class="proincacv40margin" style="width: 1050px;">
                                    <tr style="color: Black;">
                                        <th style="width: 350px;" class="horizontalLineAvgCss">PROJECTED INCOME TO ACHIEVE 40+% MARGIN
                                        </th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">Course Fee
                                        </th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">#Participants
                                        </th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">Total Paying Participants</th>
                                        <th style="text-align: center; width: 100px;" class="horizontalLineAvgCss">Course Fee (Ex GST)
                                        </th>
                                        <th style="text-align: left; width: 100px;" class="horizontalLineAvgCss">Total $ (Ex GST)
                                        </th>
                                        <th style="text-align: center; width: 200px;" class="horizontalLineAvgCss"></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--Participant Fee - Group Member--%>
                                    Participant Fee - Early Bird Group / Distance Discount Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeEBDistant40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantEBDistant40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="EBDistant40Per"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeEBDistant40Per" runat="server"
                                                    CssClass="form-control input-sm OutputValue" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalFeeEBDistant40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left!important;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--Participant Fee - APA Member--%>
                                    Participant Fee - Early Bird APA Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeEBApa40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantEBApa40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="EBApa40Per"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeEBApa40Per" runat="server"
                                                    CssClass="form-control input-sm OutputValue" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalFeeEBApa40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left!important;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--Participant Fee - Non Member--%>
                                    Participant Fee - Early Bird Non Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeEBNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantEBNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="EBNonMember40Per"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeEBNonMember40Per" runat="server"
                                                    CssClass="form-control input-sm OutputValue" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalFeeEBNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left!important;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color: Green;">&nbsp;</td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: center;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color: red; font-weight: bold; height: 30px; font-size: 15px;">Diff b/w EB and standard price
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtDiffBWEBSP40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                        <td style="text-align: center;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>

                                    </tr>
                                    <tr>
                                        <td style="color: Green;">&nbsp;</td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: center;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Participant Fee - Non Early Bird Group / Distance Discount Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeNonDistant40Per" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantNonDistant40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="NonDistant40Per"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeNonDistant40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalFeeNonDistant40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td>Participant Fee - Non Early Bird APA Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeNonApa40Per" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantNonApa40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="NonApa40Per"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeNonApa40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalFeeNonApa40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td>Participant Fee - Non Early Bird Non Member
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantFeeNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue" ReadOnly="true"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtParticipantNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: right;" id="NonMember40Per"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtCourseFeeNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalFeeNonMember40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                Enabled="false"></asp:TextBox>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right;" id="totalPertange40Per"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Sponsorship
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtSponsorship40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td style="text-align: center;"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtSponsorshipCourseFee40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtTotalSponsorshipCourseFee40Per" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5"></td>
                                        <td>
                                            <center>
                                                <asp:TextBox ID="txtAcvGrandTotal" runat="server" CssClass="form-control input-sm OutputValue"
                                                    Style="float: left!important;" Enabled="false"></asp:TextBox>
                                            </center>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- <div class="row">
            <div class="col-sm-12">
                <table id="Table3">
                    <tr>
                        <td style="font-weight: bold; background-color: #FF8080; color: White; height: 40px;
                            font: 18px/1 Verdana,Helvetica; text-align: left;">
                            <strong>Presenter/Tutor/Convenor Data Entry</strong>
                        </td>
                    </tr>
                </table>
            </div>
        </div>--%>
            <div id="expense" class="panel panel-primary">
                <div class="panel-body" style="padding-top: 4px;">
                    <h3 class="text-on-pannel text-primary" style="font-weight: bold; color: Green; font: 18px/1 Verdana,Helvetica;"
                        align="left">
                        <strong>EXPENSES EX GST</strong></h3>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table id="presenterTable">
                                <thead>
                                    <tr class="PresenterTd">
                                        <th style="width: 255px;">Presenters - list names
                                        </th>
                                        <th style="text-align: center; width: 70px;">Session
                                        </th>
                                        <th style="text-align: center; width: 70px;">Hours
                                        </th>
                                        <th style="text-align: center; width: 70px;">Rate
                                        </th>
                                        <th style="text-align: center; width: 90px;">Fee Subtotal
                                        </th>
                                        <th style="text-align: center; width: 10px; background-color: White;"></th>
                                        <th style="text-align: center; width: 70px;">Accom.
                                        </th>
                                        <th style="text-align: center; width: 70px;">Travel Exp.
                                        </th>
                                        <th style="text-align: center; width: 50px;">Meal
                                        </th>
                                        <th style="text-align: center; width: 70px;">Taxi/Petrol
                                        </th>
                                        <th style="text-align: center; width: 90px;">Exp Subtotal
                                        </th>
                                        <th style="text-align: center; width: 50px;">Total
                                        </th>
                                        <th style="text-align: center; width: 90px; background-color: White;"></th>
                                        <th style="text-align: center; width: 90px;">Inv. Number
                                        </th>
                                        <th style="text-align: center; width: 90px;">Inv. Amount
                                        </th>
                                        <th style="text-align: center; width: 90px;">Date Paid
                                        </th>
                                        <th style="text-align: center; width: 120px;">Expense Code
                                        </th>
                                        <th style="text-align: center; width: 90px;"></th>
                                    </tr>
                                </thead>
                                <tbody id="presenterCalculation">
                                    <tr class="presenterList">
                                        <td>
                                            <asp:DropDownList ID="ddlPresenters" runat="server" CssClass="form-control presenterID">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <input class="OtherExpenseInput session_" id="sessionPresenter" name="sessionPresenter" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput hours_ expPresenterCalClass" id="hourPresenter" name="hourPresenter" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate"
                                                class="OtherExpenseInput rate expPresenterCalClass" id="ratePresenter" name="ratePresenter" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubTotalPresenter" name="feeSubTotalPresenter" class="OtherExpenseInput feeSubTotalPresenter"
                                                readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput accomadation expPresenterCalClass" id="accomPresenter" name="accomPresenter" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput travelEx expPresenterCalClass" id="travelExpPresenter" name="travelExpPresenter" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput meal expPresenterCalClass" id="mealPresenter" name="mealPresenter" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput taxi expPresenterCalClass" id="taxiPetrolPresenter" name="taxiPetrolPresenter" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput expSubTotalPresenter" id="expSubTotalPresenter" name="expSubTotalPresenter"
                                                readonly="readonly" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput totalPresenter" id="totalPresenter" name="totalPresenter" readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="invNoPresenter" name="invNoPresenter" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss amount expPresenterCalClass invAmountPresenter" id="invAmountPresenter" name="invAmountPresenter" />
                                        </td>
                                        <td>
                                            <input type="date" id="datePaidPresenter" name="datePaidPresenter" class="tdInvoiceCss datePaid"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPresenterExpCode" runat="server" CssClass="tdInvoiceCss expenseCode">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <center>
                                                <button type="button" id="btnAddPresenter" class="btn btn-xs btn-primary classAddPresenter">
                                                    Add</button>
                                            </center>
                                        </td>
                                    </tr>
                                    <tr class="presenterList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="invNoPresenterAccom" name="invNoPresenterAccom" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss amount expPresenterCalClass invAmountPresenter" id="invAmountPresenterAccom" name="invAmountPresenterAccom" />
                                        </td>
                                        <td>
                                            <input type="date" id="datePaidPresenterAccom" name="datePaidPresenterAccom" class="tdInvoiceCss datePaid"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodePresenterAccom" name="expCodePresenterAccom" class="tdInvoiceCss expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="presenterList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="invNoPresenterTvExp" name="invNoPresenterTvExp" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expPresenterCalClass amount invAmountPresenter" id="invAmountPresenterTravel" name="invAmountPresenterTravel" />
                                        </td>
                                        <td>
                                            <input type="date" id="datePaidPresenterTvExp" name="datePaidPresenterTvExp" class="tdInvoiceCss datePaid"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodePresenterTvExp" name="expCodePresenterTvExp" class="tdInvoiceCss expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="presenterList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="invNoPresenterMeal" name="invNoPresenterMeal" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expPresenterCalClass amount invAmountPresenter" id="invAmountPresenterMeal" name="invAmountPresenterMeal" />
                                        </td>
                                        <td>
                                            <input type="date" id="datePaidPresenterMeal" name="datePaidPresenterMeal" class="tdInvoiceCss datePaid"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodePresenterMeal" name="expCodePresenterMeal" class="tdInvoiceCss expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="presenterList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="invNoPresenterTaxi" name="invNoPresenterTaxi" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expPresenterCalClass amount invAmountPresenter" id="invAmountPresenterTaxi" name="invAmountPresenterTaxi" />
                                        </td>
                                        <td>
                                            <input type="date" id="datePaidPresenterTaxi" name="datePaidPresenterTaxi" class="tdInvoiceCss datePaid"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodePresenterTaxi" name="expCodePresenterTaxi" class="tdInvoiceCss expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubTotalFinalPresenter" onkeyup="ResetErrorMsg();" class="OtherExpenseInput"
                                                readonly="readonly" style="color: black;" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="expSubTotalFinalPresenter" name="expSubTotalFinalPresenter"
                                                disabled />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalFinalPresenter" name="totalFinalPresenter"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input class="tdInvoiceCss" id="invSubTotalAmountPresenter" name="invSubTotalAmountPresenter"
                                                readonly="readonly" style="color: black;" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table id="tutorTable">
                                <thead>
                                    <tr class="TutorTd">
                                        <th style="width: 280px;">Tutor - list names
                                        </th>
                                        <th style="text-align: center; width: 70px;">Session
                                        </th>
                                        <th style="text-align: center; width: 70px;">Hour
                                        </th>
                                        <th style="text-align: center; width: 70px;">Rate
                                        </th>
                                        <th style="text-align: center; width: 90px;">Fee Subtotal
                                        </th>
                                        <th style="text-align: center; width: 10px; background-color: White;"></th>
                                        <th style="text-align: center; width: 70px;">Accom.
                                        </th>
                                        <th style="text-align: center; width: 70px;">Travel Exp.
                                        </th>
                                        <th style="text-align: center; width: 50px;">Meal
                                        </th>
                                        <th style="text-align: center; width: 70px;">Taxi/Petrol
                                        </th>
                                        <th style="text-align: center; width: 90px;">Exp Subtotal
                                        </th>
                                        <th style="text-align: center; width: 50px;">Total
                                        </th>
                                        <th style="text-align: center; width: 80px; background-color: White;"></th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Inv. Number
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Inv. Amount
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Date Paid
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 120px;">Expense Code
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px!important;"></th>
                                    </tr>
                                </thead>
                                <tbody id="tutorCalculation">
                                    <tr class="tutorList">
                                        <td>
                                            <asp:DropDownList ID="ddlTutors" runat="server" CssClass="form-control presenterID">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <input class="OtherExpenseInput session_" id="sessionTutor" name="sessionTutor" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput expTutorCalClass hours_" id="hourTutor" name="hourTutor" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate"
                                                class="OtherExpenseInput expTutorCalClass rate" id="rateTutor" name="rateTutor" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubTotalTutor" name="feeSubTotalTutor" class="OtherExpenseInput feeSubTotalTutor" readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expTutorCalClass accomadation" id="accomTutor" name="accomTutor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expTutorCalClass travelEx" id="travelExpTutor" name="travelExpTutor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expTutorCalClass meal" id="mealTutor" name="mealTutor" min="1" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expTutorCalClass taxi" id="taxiPetrolTutor" name="taxiPetrolTutor" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput expSubTotalTutor" id="expSubTotalTutor" name="expSubTotalTutor" readonly="readonly" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput totalTutor" id="totalTutor" name="totalTutor" readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="invTutor" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutor" name="invAmountTutor" />
                                        </td>
                                        <td>
                                            <input type="date" id="Date4" class="tdInvoiceCss datePaid" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlTutorExpCode" runat="server" CssClass="tdInvoiceCss expenseCode">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <center>
                                                <button type="button" id="btnAddTutor" class="btn btn-xs btn-primary classAddTutor">
                                                    Add</button>
                                            </center>
                                        </td>
                                    </tr>
                                    <tr class="tutorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorAccom" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorAccom" name="invAmountTutor" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceTutorAccom" class="tdInvoiceCss dateInvoiceTutor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeTutorAccom" name="expCodeTutorAccom" class="tdInvoiceCss expCodeTutor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="tutorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorTravel" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorTravel" name="invAmountTutorTravel"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceTutorTravel" class="tdInvoiceCss dateInvoiceTutor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeTutorTravel" name="expCodeTutorTravel" class="tdInvoiceCss expCodeTutor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="tutorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorMeal" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorMeal" name="invAmountTutorMeal" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceTutorMeal" class="tdInvoiceCss dateInvoiceTutor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeTutorMeal" name="expCodePresenterAccom" class="tdInvoiceCss expCodeTutor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="tutorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorTaxi" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorTaxi" name="invAmountTutorTaxi"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceTutorTaxi" class="tdInvoiceCss dateInvoiceTutor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeTutorTaxi" name="expCodeTutorTaxi" class="tdInvoiceCss expCodeTutor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubTotalFinalTutor" name="feeSubTotalFinalTutor" class="OtherExpenseInput"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="expSubTotalFinalTutor" name="expSubTotalFinalTutor"
                                                disabled />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalFinalTutor" name="totalFinalTutor" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input class="tdInvoiceCss" id="invSubTotalAmountTutor" name="invSubTotalAmountTutor"
                                                readonly="readonly" style="color: black;" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold; background-color: #00356A; color: White;"
                                            colspan="4">Total Presenters/Tutors & Expenses
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="feeSubTotalFinalPresenterTutor" name="feeSubTotalFinalPresenterTutor"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="expSubTotalFinalPresenterTutor" name="expSubTotalFinalPresenterTutor"
                                                readonly="readonly" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalFinalPresenterTutor" name="totalFinalPresenterTutor"
                                                readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalFinalPresenterTutor2" name="totalFinalPresenterTutor2"
                                                readonly="readonly" />
                                        </td>
                                        <td style="text-align: right; font-weight: bold;"></td>
                                        <td>
                                            <input class="tdInvoiceCss" id="invAmtTotalFinalPresenterTutor" name="invAmtTotalFinalPresenterTutor"
                                                readonly="readonly" style="color: black;" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table id="convenorTable">
                                <thead>
                                    <tr class="ConvenorTd">
                                        <th style="width: 230px;">Convenors - list name
                                        </th>
                                        <th style="text-align: center; width: 70px;">Session
                                        </th>
                                        <th style="text-align: center; width: 70px;">Days
                                        </th>
                                        <th style="text-align: center; width: 70px;">Rate
                                        </th>
                                        <th style="text-align: center; width: 90px;">Fee Subtotal
                                        </th>
                                        <th style="text-align: center; width: 10px; background-color: White;"></th>
                                        <th style="text-align: center; width: 70px;">Accom.
                                        </th>
                                        <th style="text-align: center; width: 70px;">Travel Exp.
                                        </th>
                                        <th style="text-align: center; width: 50px;">Meal
                                        </th>
                                        <th style="text-align: center; width: 70px;">Taxi/Petrol
                                        </th>
                                        <th style="text-align: center; width: 90px;">Exp Subtotal
                                        </th>
                                        <th style="text-align: center; width: 50px;">Total
                                        </th>
                                        <th style="text-align: center; width: 90px; background-color: White;"></th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Inv. Number
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Inv. Amount
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Date Paid
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px;">Expense Code
                                        </th>
                                        <th class="invCommonCss" style="text-align: center; width: 90px!important;"></th>
                                    </tr>
                                </thead>
                                <tbody id="convenorCalculation">
                                    <tr class="convenorList">
                                        <td>
                                            <asp:DropDownList ID="ddlConvenors" runat="server" CssClass="form-control presenterID">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <input class="OtherExpenseInput session_" id="sessionConvenor" name="sessionConvenor" min="1"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput expConvenorCalClass hours_" id="hourConvenor" name="hourConvenor" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate"
                                                class="OtherExpenseInput expConvenorCalClass rate" id="rateConvenor" name="rateConvenor" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubTotalConvenor" name="feeSubTotalConvenor" class="OtherExpenseInput feeSubTotalConvenor"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expConvenorCalClass accomadation" id="accomConvenor" name="accomConvenor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expConvenorCalClass travelEx" id="travelExpConvenor" name="travelExpConvenor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expConvenorCalClass meal" id="mealConvenor" name="mealConvenor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                class="OtherExpenseInput expConvenorCalClass taxi" id="taxiPetrolConvenor" name="taxiPetrolConvenor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput expSubTotalConvenor" id="expSubTotalConvenor" name="expSubTotalConvenor"
                                                disabled />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput totalConvenor" id="totalConvenor" name="totalConvenor" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td>
                                            <input class="tdInvoiceCss invNumber" id="Text95" min="1" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenor" name="invAmountConvenor"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input type="date" id="Date5" class="tdInvoiceCss datePaid" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlConvenorExpCode" runat="server" CssClass="tdInvoiceCss ddlConvenorExpCode expenseCode">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <center>
                                                <button type="button" id="btnAddConvenor" class="btn btn-xs btn-primary classAddConvenor">
                                                    Add</button></center>
                                        </td>
                                    </tr>
                                    <tr class="convenorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorAccom" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorAccom" name="invAmountConvenor" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceConvenorAccom" class="tdInvoiceCss dateInvoiceConvenor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeConvenorAccom" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="convenorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorTravel" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorTravel" name="invAmountConvenorTravel"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceConvenorTravel" class="tdInvoiceCss dateInvoiceConvenor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeConvenorTravel" name="expCodeConvenorTravel" class="tdInvoiceCss expCodeConvenor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="convenorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorMeal" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorMeal" name="invAmountConvenorMeal" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceConvenorMeal" class="tdInvoiceCss dateInvoiceConvenor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeConvenorMeal" name="expCodeConvenorMeal" class="tdInvoiceCss expCodeConvenor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="convenorList">
                                        <td colspan="13"></td>
                                        <td>
                                            <input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorTaxi" />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorTaxi" name="invAmountConvenorTaxi"
                                                min="1" />
                                        </td>
                                        <td>
                                            <input type="date" id="dateInvoiceConvenorTaxi" class="tdInvoiceCss dateInvoiceConvenor datePaid" />
                                        </td>
                                        <td>
                                            <input type="text" id="expCodeConvenorTaxi" name="expCodeConvenorTaxi" class="tdInvoiceCss expCodeConvenor expenseCode"
                                                onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="float: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubTotalFinalConvenor" name="feeSubTotalFinalConvenor" class="OtherExpenseInput"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="expSubTotalFinalConvenor" name="expSubTotalFinalConvenor"
                                                disabled />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalFinalConvenor" name="totalFinalConvenor" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input class="tdInvoiceCss invSubTotalAmountConvenor" id="invSubTotalAmountConvenor" name="invSubTotalAmountConvenor"
                                                readonly="readonly" style="color: black;" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left; font-weight: bold; background-color: #00356A; color: White;"
                                            colspan="4">Total Convenors & Expenses
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="feeSubGrandTotalFinalConvenor" name="feeSubGrandTotalFinalConvenor"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="expSubGrandTotalConvenor" name="expSubGrandTotalConvenor"
                                                disabled />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalGrandFinalConvenor" name="totalGrandFinalConvenor"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 90px; background-color: White;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalGrandFinalConvenor2" name="totalGrandFinalConvenor2"
                                                readonly="readonly" />
                                        </td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss" id="totalInvAmtGrandFinalConvenor" readonly="readonly" style="color: black;" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="18">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold; font-size: 12px; background-color: #0080C0; color: White;"
                                            colspan="4">SUBTOTAL PRESENTER, TUTOR & CONVENOR
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="feeSubGrandTotal" name="feeSubGrandTotal" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td style="text-align: right; font-weight: bold;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="expSubGrandTotal" name="expSubGrandTotal" disabled />
                                        </td>
                                        <td>
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="totalGrandTotal" name="totalGrandTotal" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td style="text-align: right; font-weight: bold;"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="18">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="18">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">Catering(fixed price)
                                        </td>
                                        <td>
                                            <center>
                                                Days</center>
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <center>
                                                Rate</center>
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td style="text-align: center; width: 50px;">
                                            <center>
                                                Total</center>
                                        </td>
                                        <td style="text-align: center; width: 90px; background-color: White;"></td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px;">Inv. Number
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px;">Inv. Amount
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px;">Date Paid
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px;">Expense Code
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right;">Morning Tea</span>
                                        </td>
                                        <td>
                                            <input type="text" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="txtDaysMTMin" name="txtDaysMTMin" class="OtherExpenseInput" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input type="text" id="txtRateMTMin" name="txtRateMTMin" class="OtherExpenseInput" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="rate"
                                                onkeyup="CalculateTotal();" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input class="OtherExpenseInput" id="txtMTTotalMin" name="txtMTTotalMin" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="txtMorningTeaInvNum" min="1" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass" id="txtMorningTeaInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="Date1" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlMTMinExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right;">Lunch</span>
                                        </td>
                                        <td>
                                            <input type="text" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="txtDaysLMin" name="txtDaysLMin" class="OtherExpenseInput" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input type="text" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="rate"
                                                id="txtRateLMin" name="txtRateLMin" class="OtherExpenseInput" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input class="OtherExpenseInput" id="txtLunchTotalMin" name="txtLunchTotalMin" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="Text9" min="1" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass" id="txtLunchInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="Date2" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlLMinExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4" style="border-bottom: 1px solid white; margin-bottom: 5px!important;">
                                            <span style="float: right;">Afternoon Tea</span>
                                        </td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input type="text" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                id="txtDaysATMin" name="txtDaysATMin" class="OtherExpenseInput" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input type="text" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="rate"
                                                id="txtRateATMin" name="txtRateATMin" class="OtherExpenseInput" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input class="OtherExpenseInput" id="txtATTotalMin" name="txtATTotalMin" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input type="text" id="txtAllCateringGrandTotalMin" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="Text17" min="1" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass" id="txtAfternoonTeaInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="Date3" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlATMinExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td style="background-color: #E8E8E8!important; text-align: left" colspan="13">
                                            <a href="#cateringGroup" class="btn btn-info" data-toggle="collapse">+ Catering details at average numbers and 40% margin</a>
                                        </td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;">
                                            <center>
                                                Total
                                            </center>
                                        </td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss expConvenorCalClass" id="cateringInvTotal" readonly="readonly" />
                                        </td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                    </tr>
                                </tbody>
                                <tbody id="cateringGroup" class="collapse">
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: left;">Catering (fixed price) for AVG attendance</span><br />
                                            <span style="float: right; vertical-align: top;">Morning Tea</span>
                                        </td>
                                        <td>
                                            <input type="text" id="txtDaysMTAvg" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input type="text" id="txtRateMTAvg" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input type="text" id="txtMTTotalAvg" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right;">Lunch</span>
                                        </td>
                                        <td>
                                            <input id="txtDaysLAvg" name="txtDaysLAvg" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input id="txtRateLAvg" name="txtRateLAvg" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input class="OtherExpenseInput" id="txtLunchTotalAvg" name="txtLunchTotalAvg" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td colspan="5" style="text-align: center; background-color: White;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4" style="border-bottom: 1px solid white; margin-bottom: 5px!important;">
                                            <span style="float: right;">Afternoon Tea</span>
                                        </td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input id="txtDaysATAvg" name="txtDaysATAvg" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input id="txtRateATAvg" name="txtRateATAvg" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input class="OtherExpenseInput" id="txtATTotalAvg" name="txtATTotalAvg" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input type="text" id="txtAllCateringGrandTotalAvg" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td colspan="5" style="text-align: center; background-color: White;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: left;">Catering (Fixed Price) for 40% margin</span><br />
                                            <span style="float: right; vertical-align: top;">Morning Tea</span>
                                        </td>
                                        <td>
                                            <input id="txtDaysMTMargin" name="txtDaysMTMargin" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input id="txtRateMTMargin" name="txtRateMTMargin" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input class="OtherExpenseInput" id="txtMTTotalMargin" name="txtMTTotalMargin" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td colspan="5" style="text-align: center; background-color: White;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right;">Lunch</span>
                                        </td>
                                        <td>
                                            <input id="txtDaysLMargin" name="txtDaysLMargin" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input id="txtRateLMargin" name="txtRateLMargin" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input class="OtherExpenseInput" id="txtLunchTotalMargin" name="txtLunchTotalMargin"
                                                disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;"></td>
                                        <td colspan="5" style="text-align: center; background-color: White;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4" style="border-bottom: 1px solid white;">
                                            <span style="float: right;">Afternoon Tea</span>
                                        </td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input id="txtDaysATMargin" name="txtDaysATMargin" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input id="txtRateATMargin" name="txtRateATMargin" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td style="border-bottom: 1px solid white;">
                                            <input class="OtherExpenseInput" id="txtATTotalMargin" name="txtATTotalMargin" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input type="text" id="txtAllCateringGrandTotalMargin" class="OtherExpenseInput"
                                                disabled />
                                        </td>
                                        <td colspan="5" style="text-align: center; background-color: White;"></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="cateringCss">
                                        <td style="background-color: #E8E8E8!important;" colspan="13"></td>
                                        <td class="cateringInvCss">Inv. Number
                                        </td>
                                        <td class="cateringInvCss">Inv. Amount
                                        </td>
                                        <td class="cateringInvCss">Date Paid
                                        </td>
                                        <td class="cateringInvCss">Expense Code
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right; vertical-align: top;">Venue Hire</span>
                                        </td>
                                        <td>
                                            <input type="text" id="txtVenueHireDays" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                onkeyup="CalculateTotal();" class="OtherExpenseInput" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input type="text" id="txtVenueHireRate" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="rate"
                                                onkeyup="CalculateTotal();" class="OtherExpenseInput" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input type="text" id="txtVenueHireTotal" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input type="text" id="txtVenueHireTotalFinal" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="Text64" min="1" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass" id="txtVenueInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="Date12" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlVenueHireExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right;">Pool Hire</span>
                                        </td>
                                        <td>
                                            <input type="text" id="txtPoolHireDays" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                onkeyup="CalculateTotal();" class="OtherExpenseInput" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input type="text" id="txtPoolHireRate" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="rate"
                                                onkeyup="CalculateTotal();" class="OtherExpenseInput" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input type="text" id="txtPoolHireTotal" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input type="text" id="txtPoolHireTotalFinal" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="Text79" min="1" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass" id="txtPoolInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="Date13" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlPoolHireExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr class="cateringCss">
                                        <td colspan="4">
                                            <span style="float: right;">AV Hire</span>
                                        </td>
                                        <td>
                                            <input type="text" id="txtAVHireDays" onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                onkeyup="CalculateTotal();" class="OtherExpenseInput" />
                                        </td>
                                        <td style="text-align: center; width: 10px; background-color: White;"></td>
                                        <td>
                                            <input type="text" id="txtAVHireRate" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="rate"
                                                onkeyup="CalculateTotal();" class="OtherExpenseInput" />
                                        </td>
                                        <td colspan="4" style="text-align: center; background-color: #E8E8E8!important;"></td>
                                        <td>
                                            <input type="text" id="txtAVHireTotal" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input type="text" id="txtAVHireTotalFinal" class="OtherExpenseInput" disabled />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="Text94" min="1" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss expConvenorCalClass" id="txtAvInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="Date14" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlAVHireExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="11" style="text-align: right; font-weight: bold;">Total&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <input type="text" id="txtVPAGrandTotal" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td>
                                            <input type="text" id="txtVPAGrandTotalFinal" class="OtherExpenseInput" readonly="readonly" />
                                        </td>
                                        <td style="text-align: right; font-weight: bold; background-color: White; color: Black;">
                                            <center>
                                                Total</center>
                                        </td>
                                        <td style="text-align: center; width: 90px; color: White; background-color: #7092BE;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss" id="vAvPoolInvTotal" onkeyup="ResetErrorMsg();" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="18" style="height: 3px;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="11px" style="background: #7F7F7F; color: #FFFFFF;">Course Manuals - cost per participants (generally fixed price)
                                        </td>
                                        <td style="background: #7F7F7F; color: #FFFFFF;">
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate"
                                                value="$0.00" class="OtherExpenseInput" id="txtCourseManualFeeMin" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" readonly="readonly" id="txtTotalManualFeeMin" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input class="tdInvoiceCss" id="txtManualInv" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss" id="txtManualInvAmount" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <input type="date" id="manualInvDate" class="tdInvoiceCss" />
                                        </td>
                                        <td class="cateringInvCss">
                                            <asp:DropDownList ID="ddlCourseManualsExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="11px" style="background: #7F7F7F; color: #FFFFFF;">Course Manuals - cost per participants (generally fixed price)
                                        </td>
                                        <td style="background: #7F7F7F; color: #FFFFFF;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="txtCourseManualFeeAvg" value="30" readonly="readonly" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="txtTotalManualFeeAvg" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="11px" style="background: #7F7F7F; color: #FFFFFF;">Course Manuals - cost per participants (generally fixed price)
                                        </td>
                                        <td style="background: #7F7F7F; color: #FFFFFF;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="txtCourseManualFee40Per" value="30" readonly="readonly" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="OtherExpenseInput" id="txtTotalManualFee40Per" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss"></td>
                                        <td class="cateringInvCss" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="18" style="height: 3px;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="11px" style="background: #7F7F7F; color: #FFFFFF;">Sunday Supplies (fixed price)
                                        </td>
                                        <td style="background: #7F7F7F; color: #FFFFFF;">
                                            <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate"
                                                class="OtherExpenseInput" id="txtSundryAmount" value="$0.00" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td style="text-align: center; width: 60px; background-color: White;">
                                            <input class="OtherExpenseInput" id="txtSundryAmountFinal" value="0" readonly="readonly" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="PresenterTd">
                                            <input class="tdInvoiceCss" id="sundryInvTotal" onkeyup="ResetErrorMsg();" />
                                        </td>
                                        <td class="PresenterTd">
                                            <input onkeypress="return event.charCode === 0 || /\d/.test(String.fromCharCode(event.charCode));"
                                                class="tdInvoiceCss" id="txtSundryInvoice" onkeyup="CalculateTotal();" />
                                        </td>
                                        <td class="PresenterTd">
                                            <input type="date" id="Date7" class="tdInvoiceCss" />
                                        </td>
                                        <td class="PresenterTd">
                                            <asp:DropDownList ID="ddlSundaySuppliesExpCode" runat="server" CssClass="tdInvoiceCss">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="PresenterTd" style="text-align: center; width: 90px!important;"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table id="otherExpenseTable1" style="display: none;">
                                <thead>
                                    <tr style="background-color: grey; color: Black;">
                                        <td class="otherExpenseDynamicHeader">Other expense
                                        </td>
                                        <td style="text-align: center; width: 10px;"></td>
                                        <td class="otherExpenseCodeDynamicHeader">
                                            <b>Expense code</b>
                                        </td>
                                        <td style="text-align: center; width: 90px;"></td>
                                        <td class="otherExpenseAmtDynamicHeader">
                                            <b>Total</b>
                                        </td>
                                        <td style="text-align: center; width: 100px; background-color: gray;"></td>
                                        <td style="text-align: center; color: Black; width: 90px; background-color: gray;">Inv. Number
                                        </td>
                                        <td style="text-align: center; color: Black; width: 90px; background-color: gray;">Amount
                                        </td>
                                        <td style="text-align: center; color: Black; width: 90px; background-color: gray;">Date paid
                                        </td>
                                        <td style="text-align: center; color: Black; width: 120px; background-color: gray;">Expense code
                                        </td>
                                        <td style="text-align: center; color: Black; width: 90px; background-color: gray;"></td>
                                    </tr>
                                </thead>
                                <tbody id="Tbody4">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table id="otherExpenseTable">
                                <thead>
                                    <%-- <tr>
                                    <td style="text-align: left; font-weight: bold; font-size: 14px; background-color: #0080C0;
                                        color: White;" colspan="14">
                                        Other Expense Entry
                                    </td>
                                     <br />
                                </tr>--%>
                                    <tr style="background-color: White; color: Black;">
                                        <th class="otherExpenseHeader">Other expense
                                        </th>
                                        <th class="otherExpenseAmtHeader" style="text-align: center; width: 10px;"></th>
                                        <th class="otherExpenseCodeHeader">Expense code
                                        </th>
                                        <th class="otherExpenseAmtHeader" style="text-align: center; width: 90px;"></th>
                                        <th class="otherExpenseAmtHeader">Amount
                                        </th>
                                        <th class="otherExpenseAmtHeader" style="text-align: center; width: 90px; background-color: White;"></th>
                                        <th class="otherExpenseInvHeader">Inv. Number
                                        </th>
                                        <th class="otherExpenseInvHeader">Amount
                                        </th>
                                        <th class="otherExpenseInvDateHeader">Date paid
                                        </th>
                                        <th class="otherExpenseExpCodeHeader">Expense code
                                        </th>
                                        <th class="otherExpenseInvHeader"></th>
                                    </tr>
                                </thead>
                                <tbody id="Tbody1">
                                    <tr class="otherExpenseList">
                                        <td>
                                            <center>
                                                <input style="text-align: left;" id="otherExpense" name="otherExpense" class="otherExpenseInputTextBox form-control" />
                                            </center>
                                        </td>
                                        <td style="text-align: center; width: 10px;"></td>
                                        <td>
                                            <center>
                                                <asp:DropDownList ID="ddlOtherExpenseCode" runat="server" Style="text-align: left; width: 100%!important;"
                                                    class="form-control">
                                                </asp:DropDownList>
                                            </center>
                                        </td>

                                        <td colspan="3">
                                            <center>
                                                <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                    id="amountOtherExp" name="amountOtherExp" style="text-align: center; width: 100%!important;" class="otherExpenseInputTextBox form-control" />
                                            </center>
                                        </td>

                                        <td>
                                            <center>
                                                <input style="text-align: left;" id="invNoOtherExp" name="invNoOtherExp" class="otherExpenseInputTextBox form-control" />
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <input pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount"
                                                    style="text-align: center;" id="invAmountOtherExp" name="invAmountOtherExp" class="otherExpenseInputTextBox form-control" />
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <input type="date" id="datePaidOtherExp" name="datePaidOtherExp" class="dateCss form-control" />
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <asp:DropDownList ID="ddlOtherExpCode" runat="server" Style="width: 100%!important;"
                                                    class="form-control">
                                                </asp:DropDownList>
                                            </center>
                                        </td>
                                        <td>
                                            <center>
                                                <button type="button" id="btnAddOtherExpense" class="btn btn-xs btn-primary classAddOtherExpense">
                                                    Add</button>
                                            </center>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <%--<br />--%>
                            <%-- <br />--%>
                            <%--
                        <table id="otherExpenseTable2" style="display: none;">
                            <thead>
                                <tr style="background-color: White; color: Black;">
                                    <th class="otherExpenseDynamicHeader">
                                        Other expense
                                    </th>
                                    <th style="text-align: center; width: 10px;">
                                    </th>
                                    <th class="otherExpenseCodeDynamicHeader">
                                        <b>Expense code</b>
                                    </th>
                                    <th style="text-align: center; width: 90px;">
                                    </th>
                                    <th class="otherExpenseAmtDynamicHeader">
                                        <b>Total</b>
                                    </th>
                                    <th style="text-align: center; width: 100px; background-color: White;">
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                        Inv. Number
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                        Amount
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                        Date paid
                                    </th>
                                    <th style="text-align: center; color: Black; width: 120px; background-color: White;">
                                        Expense code
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="Tbody2">
                            </tbody>
                        </table>
                        
                        <table id="otherExpenseTable3" style="display: none;">
                            <thead>
                                <tr style="background-color: White; color: Black;">
                                    <th class="otherExpenseDynamicHeader">
                                        Other expense
                                    </th>
                                    <th style="text-align: center; width: 10px;">
                                    </th>
                                    <th class="otherExpenseCodeDynamicHeader">
                                        <b>Expense code</b>
                                    </th>
                                    <th style="text-align: center; width: 90px;">
                                    </th>
                                    <th class="otherExpenseAmtDynamicHeader">
                                        <b>Total</b>
                                    </th>
                                    <th style="text-align: center; width: 100px; background-color: White;">
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                        Inv. Number
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                        Amount
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                        Date paid
                                    </th>
                                    <th style="text-align: center; color: Black; width: 120px; background-color: White;">
                                        Expense code
                                    </th>
                                    <th style="text-align: center; color: Black; width: 90px; background-color: White;">
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="Tbody3">
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                            --%>
                        </div>
                    </div>
                </div>
            </div>

            <div id="projectedProfitLoss" class="panel panel-primary" id="adminControl" style="display: block;">
                <div class="panel-body" style="padding-top: 4px;">
                    <h3 class="text-on-pannel text-primary" style="font-weight: bold; color: Green; font: 18px/1 Verdana,Helvetica;"
                        align="left">
                        <strong>Projected Profit/Loss and Gross Margin </strong>
                    </h3>
                    <div class="row clearfix">
                        <div class="col-sm-12">
                            <table>
                                <tbody>
                                    <tr class="proincminnum">
                                        <td colspan="13">Total Cost at Minimum Numbers
                                        </td>
                                        <td class="proincminnum">
                                            <input type="text" id="txtTotalCostMin" class="form-control profitLossCss" readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalCostExMin" style="background-color: #7092BE;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr class="proincminnum">
                                        <td colspan="13">Total Cost per participant at Minimum Numbers
                                        </td>
                                        <td>
                                            <input type="text" id="txtParticipantCostMin" class="form-control proincminnum" disabled />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtParticipantCostExMin" style="background-color: #7092BE;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr class="proincminnum">
                                        <td colspan="13">Total Fee (Including Overheads)
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalFeeMin" class="form-control proincminnum" readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalFeeExMin" style="background-color: #7092BE;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr class="proincminnum">
                                        <td colspan="13">FEE PER PARTICIPANT(including overheads)
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalParticipantFeeIncOvMin" class="form-control proincminnum" readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalParticipantFeeIncOvExMin" style="background-color: #7092BE;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="14" style="height: 5px;"></td>
                                    </tr>
                                    <tr style="background-color: #C4D79B;">
                                        <td colspan="13">
                                            <b>PROJECTED PROFIT/LOSS BASED ON MINIMUM NUMBER</b>
                                        </td>
                                        <td>
                                            <input type="text" id="txtProjectedPLMin" style="background: #92D050!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtActPLMin" style="background: #92D050!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13">
                                            <p style="font-size: 10px; font-weight: bold;">
                                                PROJECTED PROFIT/LOSS (including overheads)
                                            </p>
                                        </td>
                                        <td>
                                            <input type="text" id="txtProjectedPLIncOvMin" class="form-control" readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtActPLIncOvMin" class="form-control" readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr style="background-color: #C4D79B;">
                                        <td colspan="13">
                                            <b>GROSS MARGIN ON MINIMUM NUMBER</b>
                                        </td>
                                        <td>
                                            <input type="text" id="txtGMMin" style="background-color: #C4D79B!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtActGM" style="background-color: #C4D79B!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13">
                                            <p style="font-size: 10px; font-weight: bold;">
                                                Gross Margin (including overheads)
                                            </p>
                                        </td>
                                        <td>
                                            <input type="text" id="txtGMIncOvMin" class="form-control" readonly="readonly" />
                                        </td>
                                        <td style="background-color: White!important;">&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <input type="text" id="txtActGMIncOv" class="form-control" readonly="readonly" />
                                        </td>
                                    </tr>

                                </tbody>
                                <tbody>
                                    <tr>
                                        <td colspan="14" style="height: 5px;">
                                            <a href="#projectedPLMargin" class="btn btn-info" data-toggle="collapse">+ Projected Profit Loss and Margin at Average Numbers and 40% Margin</a>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="projectedPLMargin" class="collapse">
                                    <tr class="proincavgatten">
                                        <td colspan="13">Total Cost at AVG REG Numbers
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalCostAvg" style="background-color: #FCD5B4!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>

                                    <tr class="proincavgatten">
                                        <td colspan="13">COST PER PARTICIPANT AT AVG REG NUMBERS
                                        </td>
                                        <td>
                                            <input type="text" id="txtParticipantCostAvg" style="background-color: #FCD5B4!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr class="proincavgatten">
                                        <td colspan="13">Total Fee (Including Overheads)
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalFeeAvg" style="background-color: #FCD5B4!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr class="proincavgatten">
                                        <td colspan="13">FEE PER PARTICIPANT (including overheads)
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalParticipantFeeIncOvAvg" style="background-color: #FCD5B4!important;" class="form-control"
                                                readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="14" style="height: 5px;"></td>
                                    </tr>
                                    <tr style="background-color: #FCD5B4;">
                                        <td colspan="13">
                                            <b>PROJECTED PROFIT/LOSS ON AVG PARTICIPANT NUMBERS</b>
                                        </td>
                                        <td>
                                            <input type="text" style="background-color: #92D050;" id="txtProjectedPLAvg" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13">
                                            <p style="font-size: 10px; font-weight: bold;">
                                                PROJECTED PROFIT/LOSS (including overheads)
                                            </p>
                                        </td>
                                        <td>
                                            <input type="text" id="txtProjectedPLIncOvAvg" class="form-control" disabled />
                                        </td>
                                    </tr>
                                    <tr style="background-color: #FCD5B4;">
                                        <td colspan="13">
                                            <b>GROSS MARGIN</b>
                                        </td>
                                        <td>
                                            <input type="text" id="txtGMAvg" style="background-color: #FCD5B4!important;" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13">
                                            <p style="font-size: 10px; font-weight: bold;">
                                                GROSS MARGIN (including overheads)
                                            </p>
                                        </td>
                                        <td>
                                            <input type="text" id="txtGMIncOvAvg" class="form-control" disabled />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="14" style="height: 5px;"></td>
                                    </tr>
                                    <tr class="proincacv40margin">
                                        <td colspan="13">TOTAL COST AT 40+% Margin
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalCost40Per" style="background-color: #CCC0DA;" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr class="proincacv40margin">
                                        <td colspan="13">COST PER PARTICIPANT AT 40+% MARGIN
                                        </td>
                                        <td>
                                            <input type="text" id="txtParticipantCost40Per" style="background-color: #CCC0DA;" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr class="proincacv40margin">
                                        <td colspan="13">TOTAL FEE (including overheads)
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalFee40Per" style="background-color: #CCC0DA;" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr class="proincacv40margin">
                                        <td colspan="13">FEE PER PARTICIPANT(including overheads)
                                        </td>
                                        <td>
                                            <input type="text" id="txtTotalParticipantFeeIncOv40Per" style="background-color: #CCC0DA;" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="14" style="height: 5px;"></td>
                                    </tr>
                                    <tr style="background-color: #CCCDDA;">
                                        <td colspan="13">
                                            <b>PROJECTED PROFIT/LOSS ON 40+% MARGIN</b>
                                        </td>
                                        <td>
                                            <input type="text" style="background-color: #92D050;" id="txtProjectedPL40Per" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13">
                                            <p style="font-size: 10px; font-weight: bold;">
                                                PROJECTED PROFIT/LOSS (including overheads)
                                            </p>
                                        </td>
                                        <td>
                                            <input type="text" id="txtProjectedPLIncOv40Per" class="form-control" disabled />
                                        </td>
                                    </tr>
                                    <tr style="background-color: #CCC0DA;">
                                        <td colspan="13">
                                            <b>GROSS MARGIN</b>
                                        </td>
                                        <td>
                                            <input type="text" id="txtGM40Per" style="background-color: #CCC0DA;" class="form-control"
                                                disabled />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="13">
                                            <p style="font-size: 10px; font-weight: bold;">
                                                GROSS MARGIN (including overheads)
                                            </p>
                                        </td>
                                        <td>
                                            <input type="text" id="txtG40PercOv40Per" class="form-control" disabled />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <br />
                                </div>
                            </div>
                            <a href="#divIncomeSplit" class="btn btn-info" data-toggle="collapse">+ Projected Profit Split Details</a>
                            <div class="collapse" id="divIncomeSplit">
                                <div class="row clearfix">
                                    <div class="col-sm-12">
                                        <table id="tblProfitSplit1" class="tblProfitSplit1">
                                            <tr>
                                                <th rowspan="2"></th>
                                                <th colspan="3">PROJECTED PROFIT SPLIT
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>40%
                                                </th>
                                                <th>50%
                                                </th>
                                                <th>60%
                                                </th>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">ex overheads
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="exOvSpilt50Min"></td>
                                                <td>0
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">incl overheads
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="incOvSpilt50Min"></td>
                                                <td>0
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">Margin ex o/head
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="marginSpiltMin"></td>
                                                <td>0
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">Margin inc o/head
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="marginIncSpiltMin"></td>
                                                <td>0
                                                </td>
                                            </tr>
                                        </table>
                                        <table id="tblProfitSplit2" class="tblProfitSplit2">
                                            <tr>
                                                <th rowspan="2"></th>
                                                <th colspan="3" style="text-align: center;">PROJECTED PROFIT SPLIT
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>40%
                                                </th>
                                                <th>50%
                                                </th>
                                                <th>60%
                                                </th>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">ex overheads
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="exOvSpilt50Avg"></td>
                                                <td id="exOvSpilt60Avg"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">incl overheads
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="incOvSpilt50Avg"></td>
                                                <td id="incOvSpilt60Avg"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">Margin ex o/head
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="marginSpilt50Avg"></td>
                                                <td id="marginSpilt60Avg"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">Margin inc o/head
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="marginSpiltInc50Avg"></td>
                                                <td id="marginSpiltInc60Avg"></td>
                                            </tr>
                                        </table>
                                        <table id="tblProfitSplit3" class="tblProfitSplit3">
                                            <tr>
                                                <th rowspan="2"></th>
                                                <th colspan="3" style="text-align: center;">PROJECTED PROFIT SPLIT
                                                </th>
                                            </tr>
                                            <tr>
                                                <th>40%
                                                </th>
                                                <th>50%
                                                </th>
                                                <th>60%
                                                </th>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">ex overheads
                                                </td>
                                                <td>0
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="exSpilt60Mar"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">incl overheads
                                                </td>
                                                <td>0
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="incSpilt60Mar"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">Margin ex o/head
                                                </td>
                                                <td>0
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="marSpilt60Mar"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left!important;">Margin inc o/head
                                                </td>
                                                <td>0
                                                </td>
                                                <td>0
                                                </td>
                                                <td id="marSpiltInc60Mar"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <br />
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-sm-12" style="background-color: aquamarine; text-align: center; height: 20px;">
                    <h4></h4>
                </div>
            </div>
        </div>
    </form>
    <button onclick="topFunction()" id="myBtn" title="Go to top"><img alt="go up" height="20px" width="20px" src="canvas.png" /></button>
</body>
<script type="text/javascript" src="scripts/SaveCourse.js"></script>
<script type="text/javascript">

    window.onscroll = function () { scrollFunction() };
    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("myBtn").style.display = "block";
        } else {
            document.getElementById("myBtn").style.display = "none";
        }
    }
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }

    $(document).ready(function () {

        debugger;

        $("#ddlCourseCode").hide();

        $("#ddlCourseCode").change(function () {
            debugger;
            //var courseCode = $("#ddlCourseCode").val();
            var courseCode = $("#ddlCourseCode option:selected").text();
            if (courseCode != null || courseCode != "-1") {
                $.ajax({
                    url: 'PDBudgetEntry.aspx/GetCourseData',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    data: "{'CourseCode':" + JSON.stringify(courseCode) + "}",
                    success: function (response) {
                        if (response.d != "") {
                            setCourseInfo(response.d.courseEvent);
                            setResourcePerson(response.d.ResourcePersons);
                            setOtherExpenses(response.d.OtherExpenses);
                        }
                        else {

                        }
                    },
                    error: function () {

                    }
                });

                //alert("Error");
            }
        });

        $("#btnPreview").click(function () {
            $("#txtCourseCode").hide();
            $("#ddlCourseCode").show();
            $("#btnSave").attr("disabled", true);
        });

        CalculateTotal();

        var user = '<%= Session["user"]%>';
        $("#txtCreatedBy").val(user);
        $("#txtModifiedBy").val(user + "-" + new Date().toLocaleString());
        $("#Text10").val(user + "-" + new Date().toLocaleString());
        $("#txtSignedoffBy").val(user + "-" + new Date().toLocaleString());

        $("#txtCreatedBy").attr("disabled", true);
        $("#txtModifiedBy").attr("disabled", true);
        $("#Text10").attr("disabled", true);
        $("#txtSignedoffBy").attr("disabled", true);

        if (user != "admin") {
            $("#adminControl").hide();
            $("#divForecast").hide();
            $("#btnForecast").hide();
        } else {
            $("#adminControl").show();
            $("#divForecast").show();
            $("#btnForecast").show();
        }


        var country = $("#ddlCountry").val();
        if (country != "AUSTRALIA") {
            $("#ddlState").val("INTERNATIONAL").change();
            $("#ddlState").attr("disabled", true);


            $("#ddlMetroRegionalLocation").val("International").change();
            $("#ddlMetroRegionalLocation").attr("disabled", true);
        } else {
            $("#ddlState").val("-1").change();
            $("#ddlMetroRegionalLocation").val("-1").change();
            $("#ddlState").attr("disabled", false);
            $("#ddlMetroRegionalLocation").attr("disabled", false);
        }

        debugger;
        $("#ddlCountry").change(function () {
            var country = $("#ddlCountry").val();
            if (country != "AUSTRALIA") {
                $("#ddlState").val("INTERNATIONAL").change();
                $("#ddlState").attr("disabled", true);

                $("#ddlMetroRegionalLocation").val("International").change();
                $("#ddlMetroRegionalLocation").attr("disabled", true);
                $("#ddSuburb").css({ display: "none" });
                $("#txArea").css({ display: "block" });

            } else {
                $("#ddlState").val("-1").change();
                $("#ddlMetroRegionalLocation").val("-1").change();
                $("#ddlState").attr("disabled", false);
                $("#ddlMetroRegionalLocation").attr("disabled", false);
                $("#ddSuburb").css({ display: "block" });
                $("#txArea").css({ display: "none" });
            }
        });

        $("#ddlOtherExpenseCode").change(function () {
            var expCode = $("#ddlOtherExpenseCode").val();
            $("#ddlOtherExpCode").val(expCode).change();
        });

        $("#amountOtherExp").change(function () {
            var amount = parseFloat($("#amountOtherExp").val().replace(/[$,]+/g, ""));

            $("#invNoOtherExp").val("Pending");
            $("#invAmountOtherExp").val(setCurrency(amount));

        });

        $("#txtOverheadContribution").change(function () {
            var overhead = parseFloat($("#txtOverheadContribution").val()) || parseFloat(0);
            $("#txtOverheadContribution").val(overhead + "%");

        });

        $("#amountOtherExpPer").change(function () {
            var amountOtherExpPer = parseFloat($("#amountOtherExpPer").val()) || parseFloat(0);
            $("#amountOtherExpPer").val(amountOtherExpPer + "%");

        });
        $("#txtParticipantPerEBDistantMin").change(function () {
            var txtParticipantPerEBDistantMin = parseFloat($("#txtParticipantPerEBDistantMin").val()) || parseFloat(0);
            $("#txtParticipantPerEBDistantMin").val(txtParticipantPerEBDistantMin + "%");
        });

        $("#txtParticipantPerEBApaMin").change(function () {
            var txtParticipantPerEBApaMin = parseFloat($("#txtParticipantPerEBApaMin").val()) || parseFloat(0);
            $("#txtParticipantPerEBApaMin").val(txtParticipantPerEBApaMin + "%");
        });

        $("#txtParticipantPerEBNonMemberMin").change(function () {
            var txtParticipantPerEBNonMemberMin = parseFloat($("#txtParticipantPerEBNonMemberMin").val()) || parseFloat(0);
            $("#txtParticipantPerEBNonMemberMin").val(txtParticipantPerEBNonMemberMin + "%");
        });

        $("#txtParticipantPerNonDistantMin").change(function () {
            var txtParticipantPerNonDistantMin = parseFloat($("#txtParticipantPerNonDistantMin").val()) || parseFloat(0);
            $("#txtParticipantPerNonDistantMin").val(txtParticipantPerNonDistantMin + "%");
        });

        $("#txtParticipantPerNonApaMin").change(function () {
            var txtParticipantPerNonApaMin = parseFloat($("#txtParticipantPerNonApaMin").val()) || parseFloat(0);
            $("#txtParticipantPerNonApaMin").val(txtParticipantPerNonApaMin + "%");
        });

        $("#txtParticipantPerNonMemberMin").change(function () {
            var txtParticipantPerNonMemberMin = parseFloat($("#txtParticipantPerNonMemberMin").val()) || parseFloat(0);
            $("#txtParticipantPerNonMemberMin").val(txtParticipantPerNonMemberMin + "%");
        });


        $("#ddlState").change(function () {
            debugger;
            var myDropDownList = $("#ddlSuburb");
            var state = $("#ddlState").val();
            $.ajax({
                type: "POST",
                url: 'PDBudgetEntry.aspx/GetSuburb',
                data: "{'state':" + JSON.stringify(state) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#ddlSuburb").empty();
                    var json_data = JSON.parse(response.d);
                    console.log(json_data);
                    $("#ddlSuburb").append($("<option></option>").val("-1").html("--Select--"));
                    $.each(json_data, function (key, value) {
                        $("#ddlSuburb").append($("<option></option>").val(value.id).html(value.name));
                    });
                    /*myDropDownList.empty();
                    for(i=0; i<json_data.Table.length; i++)
                    {
                        myDropDownList.append($("<option></option>").val(json_data.Table[i][0]).html(json_data.Table[i][1]));
                    }*/
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });
    });

    $(document).ready(function () {
        $(document).on("click", ".classAddPresenter", function () {
            var optionsPre = $(this).parent().parent().parent().find('#ddlPresenters').html();
            var optionsPreExpCode = $(this).parent().parent().parent().find('#ddlPresenterExpCode').html();
            var rowCount = $('.presenterList').length + 1;
            var presenterDiv = '<tr class="presenterList">' +
                '<td><center><select id="ddlPresenters" class="form-control presenterID" >' + optionsPre + '</select></center></td>' +
                '<td><input type="text" id="sessionPresenter" class="OtherExpenseInput session_"/></td>' +
                '<td><center><input type="text" id="hourPresenter" class="OtherExpenseInput expPresenterCalClass hours_"/></center></td>' +
                '<td><center><input type="text" id="ratePresenter" class="OtherExpenseInput expPresenterCalClass rate"/></center></td>' +
                '<td><input type="text" id="feeSubTotalPresenter" class="OtherExpenseInput feeSubTotalPresenter" disabled/></td>' +
                '<td></td>' +
                '<td><center><input type="text" id="accomPresenter" class="OtherExpenseInput expPresenterCalClass accomadation" /></center></td>' +
                '<td><center><input type="text" id="travelExpPresenter" class="OtherExpenseInput expPresenterCalClass travelEx" /></center></td>' +
                '<td><center><input type="text" id="mealPresenter" class="OtherExpenseInput expPresenterCalClass meal" /></center></td>' +
                '<td><center><input type="text" id="taxiPetrolPresenter" class="OtherExpenseInput expPresenterCalClass taxi"/></center></td>' +
                '<td><input type="text" id="expSubTotalPresenter" class="OtherExpenseInput expSubTotalPresenter" disabled/></td>' +
                '<td><input type="text" id="totalPresenter" class="OtherExpenseInput totalPresenter" disabled/></td>' +
                '<td></td>' +
                '<td><input type="text" id="invNoPresenter" class="tdInvoiceCss invNumber" /></td>' +
                '<td><center><input type="text" id="invAmountPresenter" class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" /></center></td>' +
                '<td><input type="date" id="datePaidPresenter" class="tdInvoiceCss datePaid" /></td>' +

                '<td><center><select id="ddlPresenterExpCode" class="tdInvoiceCss form-control expenseCode" >' + optionsPreExpCode + '</select></center></td>' +
                '<td><center><button type="button" id="btnDelete" class="deletePresenter btn btn btn-danger btn-xs">Remove</button></center></td>' +
                '</tr>'
                + '<tr class="presenterList">'
                + '<td colspan="13"></td>'
                + '<td><input class="tdInvoiceCss invNumber" id="invNoPresenterAccom" name="invNoPresenterAccom" /></td>'
                + '<td>'
                + '<input '
                + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterAccom" name="invAmountPresenterAccom"/>'
                + '</td>'
                + '<td>'
                + '<input type="date" id="datePaidPresenterAccom" name="datePaidPresenterAccom" class="tdInvoiceCss datePaid"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td>'
                + '<input type="text" id="expCodePresenterAccom" name="expCodePresenterAccom" class="tdInvoiceCss expenseCode"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td></td>'
                + '</tr>'
                + '<tr class="presenterList">'
                + '<td colspan="13"></td>'
                + '<td>'
                + '<input class="tdInvoiceCss invNumber" id="invNoPresenterTvExp" name="invNoPresenterTvExp" />'
                + '</td>'
                + '<td>'
                + '<input '
                + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterTravel" name="invAmountPresenterTravel"/>'
                + '</td>'
                + '<td>'
                + '<input type="date" id="datePaidPresenterTvExp" name="datePaidPresenterTvExp" class="tdInvoiceCss datePaid"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td>'
                + '<input type="text" id="expCodePresenterTvExp" name="expCodePresenterTvExp" class="tdInvoiceCss expenseCode"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td></td>'
                + '</tr>'
                + '<tr class="presenterList">'
                + '<td colspan="13"></td>'
                + '<td>'
                + '<input class="tdInvoiceCss invNumber" id="invNoPresenterMeal" name="invNoPresenterMeal" />'
                + '</td>'
                + '<td>'
                + '<input '
                + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterMeal" name="invAmountPresenterMeal"/>'
                + '</td>'
                + '<td>'
                + '<input type="date" id="datePaidPresenterMeal" name="datePaidPresenterMeal" class="tdInvoiceCss datePaid"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td>'
                + '<input type="text" id="expCodePresenterMeal" name="expCodePresenterMeal" class="tdInvoiceCss expenseCode"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td></td>'
                + '</tr>'
                + '<tr class="presenterList">'
                + '<td colspan="13"></td>'
                + '<td>'
                + '<input class="tdInvoiceCss invNumber" id="invNoPresenterTaxi" name="invNoPresenterTaxi" />'
                + '</td>'
                + '<td>'
                + '<input '
                + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterTaxi" name="invAmountPresenterTaxi"/>'
                + '</td>'
                + '<td>'
                + '<input type="date" id="datePaidPresenterTaxi" name="datePaidPresenterTaxi" class="tdInvoiceCss datePaid"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td>'
                + '<input type="text" id="expCodePresenterTaxi" name="expCodePresenterTaxi" class="tdInvoiceCss expenseCode"'
                + 'onkeyup="ResetErrorMsg();" />'
                + '</td>'
                + '<td></td>'
                + '</tr>';
            $('#presenterTable').append(presenterDiv); // Adding these controls to Main table class  
        });
    });

    $(document).on("click", ".deletePresenter", function () {
        //$(this).closest('tr').next().next().next().next().remove();
        for (var i = 0; i < 4; i++) {
            $(this).closest('tr').next().remove();
        }
        $(this).closest("tr").remove(); // closest used to remove the respective 'tr' in which I have my controls
        fnCalculatePresenterSubTotal();
    });

    $(document).ready(function () {
        debugger;
        $(document).on("click", ".classAddTutor", function () {
            var optionsTutor = $(this).parent().parent().parent().find('#ddlTutors').html();
            var optionsTutorExpCode = $(this).parent().parent().parent().find('#ddlTutorExpCode').html();
            var rowCount = $('.tutorList').length + 1;
            var tutorDiv = '<tr class="tutorList">' +
                '<td><center><select id="ddlTutors" class="form-control" >' + optionsTutor + '</select></center></td>' +
                '<td><input type="text" id="sessionTutor" class="OtherExpenseInput"/></td>' +
                '<td><center><input type="text" id="hourTutor" class="OtherExpenseInput expTutorCalClass"/></center></td>' +
                '<td><center><input type="text" id="rateTutor" class="OtherExpenseInput expTutorCalClass"/></center></td>' +
                '<td><input type="text" id="feeSubTotalTutor" class="OtherExpenseInput feeSubTotalTutor" disabled/></td>' +
                '<td></td>' +
                '<td><center><input type="text" id="accomTutor" class="OtherExpenseInput expTutorCalClass" /></center></td>' +
                '<td><center><input type="text" id="travelExpTutor" class="OtherExpenseInput expTutorCalClass" /></center></td>' +
                '<td><center><input type="text" id="mealTutor" class="OtherExpenseInput expTutorCalClass" /></center></td>' +
                '<td><center><input type="text" id="taxiPetrolTutor" class="OtherExpenseInput expTutorCalClass"/></center></td>' +
                '<td><input type="text" id="expSubTotalTutor" class="OtherExpenseInput expSubTotalTutor" disabled/></td>' +
                '<td><input type="text" id="totalTutor" class="OtherExpenseInput totalTutor" disabled/></td>' +
                '<td></td>' +
                '<td><input type="text" id="invNoTutor" class="tdInvoiceCss" /></td>' +
                '<td><center><input type="text" id="invAmountTutor" class="tdInvoiceCss expTutorCalClass invAmountTutor" /></center></td>' +
                '<td><input type="date" id="datePaidTutor" class="tdInvoiceCss" /></td>' +
                '<td><center><select id="ddlTutorExpCode" class="tdInvoiceCss form-control" >' + optionsTutorExpCode + '</select></center></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteTutor btn btn btn-danger btn-xs">Remove</button></center></td>' +
                '</tr>' +
                '<tr class="tutorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorAccom" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorAccom" name="invAmountTutor" />' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceTutorAccom" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeTutorAccom" name="expCodePresenterAccom" class="tdInvoiceCss expCodePresenter expenseCode"' +
                'onkeyup = "ResetErrorMsg();" /> ' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>' +
                '<tr class="tutorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorTravel" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorTravel" name="invAmountTutorTravel"' +
                '	min="1" />' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceTutorTravel" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeTutorTravel" name="expCodeTutorTravel" class="tdInvoiceCss expCodePresenter expenseCode"' +
                'onkeyup = "ResetErrorMsg();" /> ' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>' +
                '<tr class="tutorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorMeal" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorMeal" name="invAmountTutorMeal"/>' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceTutorMeal" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeTutorMeal" name="expCodePresenterAccom" class="tdInvoiceCss expCodePresenter expenseCode"' +
                'onkeyup = "ResetErrorMsg();" /> ' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>' +
                '<tr class="tutorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorTaxi" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorTaxi" name="invAmountTutorTaxi"' +
                '	min="1" />' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceTutorTaxi" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeTutorTaxi" name="expCodePresenterAccom" class="tdInvoiceCss expCodePresenter expenseCode"' +
                'onkeyup = "ResetErrorMsg();" /> ' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>';
            $('#tutorTable').append(tutorDiv); // Adding these controls to Main table class  
        });
    });

    $(document).on("click", ".deleteTutor", function () {
        for (var i = 0; i < 4; i++) {
            $(this).closest('tr').next().remove();
        }
        $(this).closest("tr").remove(); // closest used to remove the respective 'tr' in which I have my controls
        fnCalculateTutorSubTotal();
    });


    $(document).ready(function () {
        debugger;
        $(document).on("click", ".classAddConvenor", function () {
            var optionsConv = $(this).parent().parent().parent().find('#ddlConvenors').html();
            var optionsConvExpCode = $(this).parent().parent().parent().find('#ddlConvenorExpCode').html();
            var rowCount = $('.convenorList').length + 1;
            var convenorDiv = '<tr class="convenorList">' +
                '<td><center><select id="ddlConvenors" class="form-control presenterID" >' + optionsConv + '</select></center></td>' +
                '<td><input type="text" id="sessionConvenor" class="OtherExpenseInput session_"/></td>' +
                '<td><center><input type="text" id="hourConvenor" class="OtherExpenseInput expConvenorCalClass hours_"/></center></td>' +
                '<td><center><input type="text" id="rateConvenor" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate" class="OtherExpenseInput expConvenorCalClass rate" /></center></td>' +
                '<td><input type="text" id="feeSubTotalConvenor" class="OtherExpenseInput feeSubTotalConvenor" disabled/></td>' +
                '<td></td>' +
                '<td><center><input type="text" id="accomConvenor" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass accomadation" /></center></td>' +
                '<td><center><input type="text" id="travelExpConvenor" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass travelEx meal" /></center></td>' +
                '<td><center><input type="text" id="mealConvenor" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass taxi" /></center></td>' +
                '<td><center><input type="text" id="taxiPetrolConvenor" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass" /></center></td>' +
                '<td><input type="text" id="expSubTotalConvenor" class="OtherExpenseInput expSubTotalConvenor" disabled/></td>' +
                '<td><input type="text" id="totalConvenor" class="OtherExpenseInput totalConvenor" disabled/></td>' +
                '<td></td>' +
                '<td><input type="text" id="invNoConvenor" class="tdInvoiceCss invNumber" /></td>' +
                '<td><center><input type="text" id="invAmountConvenor" class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" /></center></td>' +
                '<td><input type="date" id="datePaidConvenor" class="tdInvoiceCss datePaid" /></td>' +
                '<td><center><select id="ddlConvenorExpCode" class="tdInvoiceCss form-control expenseCode" >' + optionsConvExpCode + '</select></center></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteConvenor btn btn btn-danger btn-xs">Remove</button></center></td>' +
                '</tr>' +
                '<tr class="convenorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorAccom" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorAccom" name="invAmountConvenor" />' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceConvenorAccom" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeConvenorAccom" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                '		onkeyup="ResetErrorMsg();" />' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>' +
                '<tr class="convenorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorTravel" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorTravel" name="invAmountConvenorTravel"' +
                '	min="1" />' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceConvenorTravel" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeConvenorTravel" name="expCodeConvenorTravel" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                '		onkeyup="ResetErrorMsg();" />' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>' +
                '<tr class="convenorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorMeal" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorMeal" name="invAmountConvenorMeal"/>' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceConvenorMeal" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeConvenorMeal" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                '		onkeyup="ResetErrorMsg();" />' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>' +
                '<tr class="convenorList">' +
                '<td colspan="13"></td>' +
                '<td>' +
                '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorTaxi" />' +
                '</td>' +
                '<td>' +
                '<input' +
                '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorTaxi" name="invAmountConvenorTaxi"' +
                '	min="1" />' +
                '</td>' +
                '<td>' +
                '<input type="date" id="dateInvoiceConvenorTaxi" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                '</td>' +
                '<td>' +
                '<input type="text" id="expCodeConvenorTaxi" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                '		onkeyup="ResetErrorMsg();" />' +
                '</td>' +
                '<td>' +
                '</td>' +
                '</tr>';
            $('#convenorTable').append(convenorDiv); // Adding these controls to Main table class  
        });
    });

    $(document).on("click", ".deleteConvenor", function () {
        for (var i = 0; i < 4; i++) {
            $(this).closest('tr').next().remove();
        }
        $(this).closest("tr").remove(); // closest used to remove the respective 'tr' in which I have my controls
        //$(this).closest('tr').next().remove();
        fnCalculateConvenorSubTotal();
    });

    function ResetErrorMsg() {

    }

    $(document).on('keyup', '.expPresenterCalClass', function () {
        debugger;
        //Presenter Calculation
        var hourPresenter = 0;
        var ratePresenter = 0;
        var accomPresenter = 0;
        var travelExpPresenter = 0;
        var mealPresenter = 0;
        var taxiPetrolPresenter = 0;
        var invAmountPresenter = 0;

        var feeSubTotalPresenter = 0;
        var expSubTotalPresenter = 0;
        var totalPresenter = 0;

        hourPresenter = $(this).parent().parent().parent().find('#hourPresenter').val().replace(/[$,]+/g, "") || 0;
        ratePresenter = $(this).parent().parent().parent().find('#ratePresenter').val().replace(/[$,]+/g, "") || 0;
        accomPresenter = $(this).parent().parent().parent().find('#accomPresenter').val().replace(/[$,]+/g, "") || 0;
        travelExpPresenter = $(this).parent().parent().parent().find('#travelExpPresenter').val().replace(/[$,]+/g, "") || 0;
        mealPresenter = $(this).parent().parent().parent().find('#mealPresenter').val().replace(/[$,]+/g, "") || 0;
        taxiPetrolPresenter = $(this).parent().parent().parent().find('#taxiPetrolPresenter').val().replace(/[$,]+/g, "") || 0;
        invAmountPresenter = $(this).parent().parent().parent().find('#invAmountPresenter').val().replace(/[$,]+/g, "") || 0;

        feeSubTotalPresenter = Number(hourPresenter) * Number(ratePresenter);
        expSubTotalPresenter = Number(accomPresenter) + Number(travelExpPresenter) + Number(mealPresenter) + Number(taxiPetrolPresenter);
        totalPresenter = Number(feeSubTotalPresenter) + Number(expSubTotalPresenter);

        $(this).parent().parent().parent().find('#feeSubTotalPresenter').val(setCurrency(feeSubTotalPresenter));
        $(this).parent().parent().parent().find('#expSubTotalPresenter').val(setCurrency(expSubTotalPresenter));
        $(this).parent().parent().parent().find('#totalPresenter').val(setCurrency(totalPresenter));
        $(this).parent().parent().parent().find('#invSubTotalAmountPresenter').val(setCurrency(invAmountPresenter));

        //End of Presenter Calculation
        $(this).closest("tr").find('#invNoPresenter').val("Pending");
        $(this).closest("tr").find("#invAmountPresenter").val(setCurrency(feeSubTotalPresenter || 0));
        $(this).closest("tr").next().find("#ddlPresenterExpCode").val("40492P").change();


        $(this).closest("tr").next().find("#invNoPresenterAccom").val("Pending");
        $(this).closest("tr").next().find("#invAmountPresenterAccom").val(setCurrency(accomPresenter || 0));
        $(this).closest("tr").next().find("#expCodePresenterAccom").val("40494");

        $(this).closest("tr").next().next().find("#invNoPresenterTvExp").val("Pending");
        $(this).closest("tr").next().next().find("#invAmountPresenterTravel").val(setCurrency(travelExpPresenter || 0));
        $(this).closest("tr").next().next().find("#expCodePresenterTvExp").val("40494");

        $(this).closest("tr").next().next().next().find("#invNoPresenterMeal").val("Pending");
        $(this).closest("tr").next().next().next().find("#invAmountPresenterMeal").val(setCurrency(mealPresenter || 0));
        $(this).closest("tr").next().next().next().find("#expCodePresenterMeal").val("40494");

        $(this).closest("tr").next().next().next().next().find("#invNoPresenterTaxi").val("Pending");
        $(this).closest("tr").next().next().next().next().find("#invAmountPresenterTaxi").val(setCurrency(taxiPetrolPresenter || 0));
        $(this).closest("tr").next().next().next().next().find("#expCodePresenterTaxi").val("40494");



        fnCalculatePresenterSubTotal();
    });

    function fnCalculatePresenterSubTotal() {
        debugger;
        var feeSubTotalPresenter = 0;
        var expSubTotalPresenter = 0;
        var totalPresenter = 0;
        var invAmountPresenter = 0;

        $('.feeSubTotalPresenter').each(function () {
            feeSubTotalPresenter += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });
        $('.expSubTotalPresenter').each(function () {
            expSubTotalPresenter += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });
        $('.totalPresenter').each(function () {
            totalPresenter += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });

        $('.invAmountPresenter').each(function () {
            invAmountPresenter += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });

        /*$("#presenterTable tbody tr").each(function () {
            debugger;
            feeSubTotalPresenter = feeSubTotalPresenter + Number($(this).find("#feeSubTotalPresenter").val()) || Number(0);
            expSubTotalPresenter = expSubTotalPresenter + Number($(this).find("#expSubTotalPresenter").val()) || Number(0);
            totalPresenter = totalPresenter + Number($(this).find("#totalPresenter").val()) || Number(0);
            invAmountPresenter = invAmountPresenter + Number($(this).find("#invAmountPresenter").val()) || Number(0);
        });*/
        $("#feeSubTotalFinalPresenter").val(setCurrency(feeSubTotalPresenter));
        $("#expSubTotalFinalPresenter").val(setCurrency(expSubTotalPresenter));
        $("#totalFinalPresenter").val(setCurrency(totalPresenter));

        $("#invSubTotalAmountPresenter").val(setCurrency(invAmountPresenter));
        fnCalculateGrandTotal();
    }

    $(document).on('keyup', '.expTutorCalClass', function () {
        debugger;
        //Tutor Calculation
        var hourTutor = 0;
        var rateTutor = 0;
        var accomTutor = 0;
        var travelExpTutor = 0;
        var mealTutor = 0;
        var taxiPetrolTutor = 0;

        var feeSubTotalTutor = 0;
        var expSubTotalTutor = 0;
        var totalTutor = 0;

        hourTutor = $(this).parent().parent().parent().find('#hourTutor').val().replace(/[$,]+/g, "");
        rateTutor = $(this).parent().parent().parent().find('#rateTutor').val().replace(/[$,]+/g, "");
        accomTutor = $(this).parent().parent().parent().find('#accomTutor').val().replace(/[$,]+/g, "");
        travelExpTutor = $(this).parent().parent().parent().find('#travelExpTutor').val().replace(/[$,]+/g, "");
        mealTutor = $(this).parent().parent().parent().find('#mealTutor').val().replace(/[$,]+/g, "");
        taxiPetrolTutor = $(this).parent().parent().parent().find('#taxiPetrolTutor').val().replace(/[$,]+/g, "");

        feeSubTotalTutor = Number(hourTutor) * Number(rateTutor);
        expSubTotalTutor = Number(accomTutor) + Number(travelExpTutor) + Number(mealTutor) + Number(taxiPetrolTutor);
        totalTutor = Number(feeSubTotalTutor) + Number(expSubTotalTutor);

        $(this).parent().parent().parent().find('#feeSubTotalTutor').val(setCurrency(feeSubTotalTutor || 0));
        $(this).parent().parent().parent().find('#expSubTotalTutor').val(setCurrency(expSubTotalTutor || 0));
        $(this).parent().parent().parent().find('#totalTutor').val(setCurrency(totalTutor || 0));
        //End of Tutor Calculation

        $(this).closest("tr").find('#invTutor').val("Pending");
        $(this).closest("tr").find("#invAmountTutor").val(setCurrency(feeSubTotalTutor || 0));
        $(this).closest("tr").next().find("#ddlTutorExpCode").val("40492T").change();


        $(this).closest("tr").next().find("#txtInvNoTutorAccom").val("Pending");
        $(this).closest("tr").next().find("#invAmountTutorAccom").val(setCurrency(accomTutor || 0));
        $(this).closest("tr").next().find("#expCodeTutorAccom").val("40494");

        $(this).closest("tr").next().next().find("#txtInvNoTutorTravel").val("Pending");
        $(this).closest("tr").next().next().find("#invAmountTutorTravel").val(setCurrency(travelExpTutor || 0));
        $(this).closest("tr").next().next().find("#expCodeTutorTravel").val("40494");

        $(this).closest("tr").next().next().next().find("#txtInvNoTutorMeal").val("Pending");
        $(this).closest("tr").next().next().next().find("#invAmountTutorMeal").val(setCurrency(mealTutor || 0));
        $(this).closest("tr").next().next().next().find("#expCodeTutorMeal").val("40494");

        $(this).closest("tr").next().next().next().next().find("#txtInvNoTutorTaxi").val("Pending");
        $(this).closest("tr").next().next().next().next().find("#invAmountTutorTaxi").val(setCurrency(taxiPetrolTutor || 0));
        $(this).closest("tr").next().next().next().next().find("#expCodeTutorTaxi").val("40494");


        fnCalculateTutorSubTotal();
    });

    function fnCalculateTutorSubTotal() {
        debugger;
        var feeSubTotalTutor = 0;
        var expSubTotalTutor = 0;
        var totalTutor = 0;
        var invAmountTutor = 0;


        $('.feeSubTotalTutor').each(function () {
            feeSubTotalTutor += Number($(this).val().replace(/[$,]+/g, "")) || 0;
        });
        $('.expSubTotalTutor').each(function () {
            expSubTotalTutor += Number($(this).val().replace(/[$,]+/g, "")) || 0;
        });
        $('.totalTutor').each(function () {
            totalTutor += Number($(this).val().replace(/[$,]+/g, "")) || 0;
        });

        $('.invAmountTutor').each(function () {
            invAmountTutor += Number($(this).val().replace(/[$,]+/g, "")) || 0;
        });

        /*$("#tutorTable tbody tr").each(function () {
            debugger;
            feeSubTotalTutor = feeSubTotalTutor + Number($(this).find("#feeSubTotalTutor").val());
            expSubTotalTutor = expSubTotalTutor + Number($(this).find("#expSubTotalTutor").val());
            totalTutor = totalTutor + Number($(this).find("#totalTutor").val());
            invAmountTutor = invAmountTutor + Number($(this).find("#invAmountTutor").val());
        });*/
        $("#feeSubTotalFinalTutor").val(setCurrency(feeSubTotalTutor));
        $("#expSubTotalFinalTutor").val(setCurrency(expSubTotalTutor));
        $("#totalFinalTutor").val(setCurrency(totalTutor));
        $("#invSubTotalAmountTutor").val(setCurrency(invAmountTutor));
        fnCalculateGrandTotal();
    }

    $(document).on('keyup', '.expConvenorCalClass', function () {
        debugger;
        //Convenor Calculation
        var hourConvenor = 0;
        var rateConvenor = 0;
        var accomConvenor = 0;
        var travelExpConvenor = 0;
        var mealConvenor = 0;
        var taxiPetrolConvenor = 0;

        var feeSubTotalConvenor = 0;
        var expSubTotalConvenor = 0;
        var totalConvenor = 0;

        hourConvenor = $(this).parent().parent().parent().find('#hourConvenor').val().replace(/[$,]+/g, "") || 0;
        rateConvenor = $(this).parent().parent().parent().find('#rateConvenor').val().replace(/[$,]+/g, "") || 0;
        accomConvenor = $(this).parent().parent().parent().find('#accomConvenor').val().replace(/[$,]+/g, "") || 0;
        travelExpConvenor = $(this).parent().parent().parent().find('#travelExpConvenor').val().replace(/[$,]+/g, "") || 0;
        mealConvenor = $(this).parent().parent().parent().find('#mealConvenor').val().replace(/[$,]+/g, "") || 0;
        taxiPetrolConvenor = $(this).parent().parent().parent().find('#taxiPetrolConvenor').val().replace(/[$,]+/g, "") || 0;

        feeSubTotalConvenor = Number(hourConvenor) * Number(rateConvenor);
        expSubTotalConvenor = Number(accomConvenor) + Number(travelExpConvenor) + Number(mealConvenor) + Number(taxiPetrolConvenor);
        totalConvenor = Number(feeSubTotalConvenor) + Number(expSubTotalConvenor);

        $(this).parent().parent().parent().find('#feeSubTotalConvenor').val(setCurrency(feeSubTotalConvenor));
        $(this).parent().parent().parent().find('#expSubTotalConvenor').val(setCurrency(expSubTotalConvenor));
        $(this).parent().parent().parent().find('#totalConvenor').val(setCurrency(totalConvenor));
        //End of Convenor Calculation
        $(this).closest("tr").find('#invConvenor').val("Pending");
        $(this).closest("tr").find("#invAmountConvenor").val(setCurrency(feeSubTotalConvenor || 0));
        $(this).closest("tr").next().find("#ddlConvenorExpCode").val("40492C").change();


        $(this).closest("tr").next().find("#txtInvNoConvenorAccom").val("Pending");
        $(this).closest("tr").next().find("#invAmountConvenorAccom").val(setCurrency(accomConvenor || 0));
        $(this).closest("tr").next().find("#expCodeConvenorAccom").val("40494");

        $(this).closest("tr").next().next().find("#txtInvNoConvenorTravel").val("Pending");
        $(this).closest("tr").next().next().find("#invAmountConvenorTravel").val(setCurrency(travelExpConvenor || 0));
        $(this).closest("tr").next().next().find("#expCodeConvenorTravel").val("40494");

        $(this).closest("tr").next().next().next().find("#txtInvNoConvenorMeal").val("Pending");
        $(this).closest("tr").next().next().next().find("#invAmountConvenorMeal").val(setCurrency(mealConvenor || 0));
        $(this).closest("tr").next().next().next().find("#expCodeConvenorMeal").val("40494");

        $(this).closest("tr").next().next().next().next().find("#txtInvNoConvenorTaxi").val("Pending");
        $(this).closest("tr").next().next().next().next().find("#invAmountConvenorTaxi").val(setCurrency(taxiPetrolConvenor || 0));
        $(this).closest("tr").next().next().next().next().find("#expCodeConvenorTaxi").val("40494");



        fnCalculateConvenorSubTotal();
    });

    function fnCalculateConvenorSubTotal() {
        debugger;
        var feeSubTotalConvenor = 0;
        var expSubTotalConvenor = 0;
        var totalConvenor = 0;
        var invAmountConvenor = 0;

        $('.feeSubTotalConvenor').each(function () {
            feeSubTotalConvenor += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });
        $('.expSubTotalConvenor').each(function () {
            expSubTotalConvenor += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });
        $('.totalConvenor').each(function () {
            totalConvenor += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });

        $('.invAmountConvenor').each(function () {
            invAmountConvenor += Number($(this).val().replace(/[$,]+/g, "")) || Number(0);
        });

        /*$("#convenorTable tbody tr").each(function () {
            debugger;
            feeSubTotalConvenor = feeSubTotalConvenor + Number($(this).find("#feeSubTotalConvenor").val());
            expSubTotalConvenor = expSubTotalConvenor + Number($(this).find("#expSubTotalConvenor").val());
            totalConvenor = totalConvenor + Number($(this).find("#totalConvenor").val());
            invAmountConvenor = invAmountConvenor + Number($(this).find("#invAmountConvenor").val());
        });*/
        $("#feeSubTotalFinalConvenor").val(setCurrency(feeSubTotalConvenor));
        $("#expSubTotalFinalConvenor").val(setCurrency(expSubTotalConvenor));
        $("#expSubGrandTotalConvenor").val(setCurrency(expSubTotalConvenor));
        $("#totalFinalConvenor").val(setCurrency(totalConvenor));
        $("#totalGrandFinalConvenor").val(setCurrency(totalConvenor));
        $("#totalGrandFinalConvenor2").val(setCurrency(totalConvenor));
        $("#feeSubGrandTotalFinalConvenor").val(setCurrency(feeSubTotalConvenor));
        $("#invSubTotalAmountConvenor").val(setCurrency(invAmountConvenor));

        fnCalculateGrandTotal();
    }

    $(document).on("click", ".classAddOtherExpense", function () {
        debugger;
        var AllMinIncomeGrandTotal = 0;
        AllMinIncomeGrandTotal = document.getElementById("<%= txtAllMinIncomeGrandTotal.ClientID%>").value;
        var optionsConv = $(this).parent().parent().parent().find("#ddlOtherExpenseCode option:selected").val();
        var optionsConvExpCode = $(this).parent().parent().parent().find("#ddlOtherExpCode option:selected").val();
        var otherExpense = $(this).parent().parent().parent().find("#otherExpense").val();
        var amountOtherExp = $(this).parent().parent().parent().find("#amountOtherExp").val();
        var datePaidOtherExp = $(this).parent().parent().parent().find("#datePaidOtherExp").val();
        var invNoOtherExp = $(this).parent().parent().parent().find("#invNoOtherExp").val();
        var invAmountOtherExp = $(this).parent().parent().parent().find("#invAmountOtherExp").val();
        if (parseFloat(amountOtherExp.replace(/[$,]+/g, "")) > 0 && optionsConv != "-1") {

            var isValidItem = true;
            if (!($('#otherExpense').val().trim() != '')) {
                isValidItem = false;
                $('#otherExpense').siblings('span.error').css('visibility', 'visible');
            }

            if (isValidItem == false) {
                //return;
            }

            var convenorDiv = '<tr class="otherExpenseListOut">' +
                '<td><center><input type="text" id="otherExpense1" name="otherExpense1" class="otherExpenseOutputTextBox othExName" Style="width: 100%!important;" value="' + otherExpense + '" disabled/></center></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input type="text" class="otherExpenseOutputTextBox othExCode" Style="width: 100%!important;" id="otherExpense2" name="otherExpense2" value="' + optionsConv + '" disabled/></td>' +
                //      '<td><input type="text" class="OtherExpenseInput otherExpPerCalClass" onkeyup="fnOtherExpPerCal();" id="amountOtherExpPer"/></td>' +
                '<td><center><input type="text" id="amountOtherExpPer" class="OtherExpenseInput otherExpCalClass othExPer" onkeyup="CalculateTotal();" /></center></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpCalClass othExAmt" id="amountOtherExp1" name="amountOtherExp1" value="' + amountOtherExp + '" disabled/></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input class="tblOtherExpenseCss othExInvNo" id="invNoOtherExp1" name="invNoOtherExp1" value="' + invNoOtherExp + '" disabled/></td>' +
                '<td><input class="tblOtherExpenseCss othExInvAmt" id="invAmountOtherExp1" name="invAmountOtherExp1" value="' + invAmountOtherExp + '" disabled/></td>' +
                '<td><input type="date" class="dynamicDateCss othExInvDate" id="datePaidOtherExp1" name="datePaidOtherExp1" value="' + datePaidOtherExp + '"/></td>' +
                '<td><input type="text" class="tblOtherExpenseCss othExInvCode" id="otherExpenseCode1" name="otherExpenseCode1" value="' + optionsConvExpCode + '" disabled/></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteOtherExp btn btn-danger btn-group-small">-</button></center></td>' +
                '</tr>';

            var convenorDiv1 = '<tr class="otherExpenseListOut">' +
                '<td><center><input type="text" id="otherExpense1" name="otherExpense1" class="otherExpenseOutputTextBox othExName" Style="width: 100%!important;" value="' + otherExpense + '" disabled/></center></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input type="text" class="otherExpenseOutputTextBox othExCode" Style="width: 100%!important;" id="otherExpense2" name="otherExpense2" value="' + optionsConv + '" disabled/></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpPerCalClass othExPer" id="amountOtherExpPer1" disabled/></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpCalClass othExAmt" id="amountOtherExp1" name="amountOtherExp1" value="' + amountOtherExp + '" disabled/></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input class="tblOtherExpenseCss othExInvNo" id="invNoOtherExp1" name="invNoOtherExp1" value="' + invNoOtherExp + '" disabled/></td>' +
                '<td><input class="tblOtherExpenseCss othExInvAmt" id="invAmountOtherExp1" name="invAmountOtherExp1" value="' + invAmountOtherExp + '" disabled/></td>' +
                '<td><input type="date" class="dynamicDateCss othExInvDate" id="datePaidOtherExp1" name="datePaidOtherExp1" value="' + datePaidOtherExp + '"/></td>' +
                '<td><input type="text" class="tblOtherExpenseCss othExInvCode" id="otherExpenseCode1" name="otherExpenseCode1" value="' + optionsConvExpCode + '" disabled/></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteOtherExp btn btn-danger btn-group-small">-</button></center></td>' +
                '</tr>';

            var convenorDiv2 = '<tr class="otherExpenseListOut">' +
                '<td><center><input type="text" id="otherExpense" name="otherExpense" class="otherExpenseOutputTextBox" Style="width: 100%!important;" value=' + otherExpense + ' disabled/></center></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input type="text" class="otherExpenseOutputTextBox" Style="width: 100%!important;" id="otherExpense" name="otherExpense" value=' + optionsConv + ' disabled/></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss" id="otherExpPer" disabled/></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpCalClass" id="amountOtherExp" name="amountOtherExp" value=' + amountOtherExp + ' disabled/></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input class="tblOtherExpenseCss" id="invNoOtherExp" name="invNoOtherExp" value=' + invNoOtherExp + ' disabled/></td>' +
                '<td><input class="tblOtherExpenseCss" id="invAmountOtherExp" name="invAmountOtherExp" value=' + invAmountOtherExp + ' disabled/></td>' +
                '<td><input type="text" class="dynamicDateCss" id="datePaidOtherExp" name="datePaidOtherExp" value=' + datePaidOtherExp + ' disabled/></td>' +
                '<td><input type="text" class="tblOtherExpenseCss" id="otherExpenseCode" name="otherExpenseCode" value=' + optionsConvExpCode + ' disabled/></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteOtherExp btn btn btn-danger btn-xs">Remove</button></center></td>' +
                '</tr>';

            var rowCount = $('#otherExpenseTable1 >tbody >tr').length;
            if (rowCount == 0) {
                $('#otherExpenseTable1').find('tbody').append(convenorDiv);
            }
            else if (rowCount > 0) {
                $('#otherExpenseTable1').find('tbody').append(convenorDiv1);
            }

            /*$('#otherExpenseTable2').find('tbody').append(convenorDiv2);
            $('#otherExpenseTable3').find('tbody').append(convenorDiv2);*/
            $("#otherExpenseTable1").show();
            /*$("#otherExpenseTable2").show();
            $("#otherExpenseTable3").show();*/
            $("#otherExpense").val("");
            $("#ddlOtherExpenseCode").val("-1").change();
            $("#amountOtherExp").val("");
            $("#invNoOtherExp").val("");
            $("#invAmountOtherExp").val("");
            $("#datePaidOtherExp").val("");
            $("#ddlOtherExpCode").val("-1").change();
            CalculateTotal();
        } else {
            alert("Please select an expense code and put an amount!");
        }
    });

    $(document).on("click", ".deleteOtherExp", function () {
        debugger;
        var row_index = $(this).parent().parent().parent().index();
        $("#otherExpenseTable1 tbody tr:eq(" + row_index + ")").remove();
        $("#otherExpenseTable2 tbody tr:eq(" + row_index + ")").remove();
        $("#otherExpenseTable3 tbody tr:eq(" + row_index + ")").remove();

        var rowCount = $('#otherExpenseTable1 >tbody >tr').length;
        if (rowCount == 0) {
            $("#otherExpenseTable1").hide();
            $("#otherExpenseTable2").hide();
            $("#otherExpenseTable3").hide();
        } else {
            $("#otherExpenseTable1").show();
            $("#otherExpenseTable2").show();
            $("#otherExpenseTable3").show();
        }
        CalculateTotal();
    });

    $(document).on('keyup', '.otherExpCalClass', function () {
        debugger;
        //Other Expense Calculation
        var otherExpPer = 0;
        var tt = 0;

        otherExpPer = $(this).parent().parent().parent().find('#amountOtherExpPer').val();

        var AllMinIncomeGrandTotal = 0;
        AllMinIncomeGrandTotal = parseFloat($('#txtAllMinIncomeGrandTotal').val().replace(/[$,]+/g, "")) || parseFloat(0); //document.getElementById("<%= txtAllMinIncomeGrandTotal.ClientID%>").value;

        tt = Number(AllMinIncomeGrandTotal * Number(otherExpPer)) / 100;
        $(this).parent().parent().parent().find('#amountOtherExp1').val(setCurrency(tt));

        //End of Other Expense Calculation

        //fnCalculatePresenterSubTotal();
        CalculateTotal();
    });

    function isFloatNumber(e, t) {
        var n;
        var r;
        if (navigator.appName == "Microsoft Internet Explorer" || navigator.appName == "Netscape") {
            n = t.keyCode;
            r = 1;
            if (navigator.appName == "Netscape") {
                n = t.charCode;
                r = 0
            }
        } else {
            n = t.charCode;
            r = 0
        }
        if (r == 1) {
            if (!(n >= 48 && n <= 57 || n == 46)) {
                t.returnValue = false
            }
        } else {
            if (!(n >= 48 && n <= 57 || n == 0 || n == 46)) {
                t.preventDefault()
            }
        }
    }

    function fnOtherExpPerCal() {
        debugger;
        var otherExpPer = 0;
        var tt = 0;

        otherExpPer = $(this).parent().parent().parent().find('#amountOtherExpPer').val();

        var AllMinIncomeGrandTotal = 0;
        AllMinIncomeGrandTotal = document.getElementById("<%= txtAllMinIncomeGrandTotal.ClientID%>").value;

        tt = Number(AllMinIncomeGrandTotal * Number(otherExpPer)) / 100;
        $(this).parent().parent().parent().find('#amountOtherExp').val(tt);
    }


    function fnCalculateGrandTotal() {
        debugger;
        var feeSubFinalPresenter = Number($("#feeSubTotalFinalPresenter").val().replace(/[$,]+/g, ""));
        var feeSubFinalTutor = Number($("#feeSubTotalFinalTutor").val().replace(/[$,]+/g, ""));
        var feeSubFinalConvenor = Number($("#feeSubTotalFinalConvenor").val().replace(/[$,]+/g, ""));
        var invAmountSubTotalPresenter = Number($("#invSubTotalAmountPresenter").val().replace(/[$,]+/g, ""));
        var invAmountSubTotalTutor = Number($("#invSubTotalAmountTutor").val().replace(/[$,]+/g, ""));
        var invAmountSubTotalConvenor = Number($("#invSubTotalAmountConvenor").val().replace(/[$,]+/g, ""));
        var grandTotalPresenterTutor = Number(feeSubFinalPresenter) + Number(feeSubFinalTutor);
        var InvAmtTotalPresenterTutor = Number(invAmountSubTotalPresenter) + Number(invAmountSubTotalTutor);
        var grandTotalAll = Number(feeSubFinalPresenter) + Number(feeSubFinalTutor) + Number(feeSubFinalConvenor);

        $("#feeSubTotalFinalPresenterTutor").val(setCurrency(grandTotalPresenterTutor));
        $("#invAmtTotalFinalPresenterTutor").val(setCurrency(InvAmtTotalPresenterTutor));
        $("#expSubTotalFinalPresenterTutor").val(setCurrency(Number($("#expSubTotalFinalPresenter").val().replace(/[$,]+/g, "")) + Number($("#expSubTotalFinalTutor").val().replace(/[$,]+/g, ""))));
        $("#totalFinalPresenterTutor").val(setCurrency(Number($("#totalFinalPresenter").val().replace(/[$,]+/g, "")) + Number($("#totalFinalTutor").val().replace(/[$,]+/g, ""))));
        $("#totalFinalPresenterTutor2").val(setCurrency(Number($("#totalFinalPresenter").val().replace(/[$,]+/g, "")) + Number($("#totalFinalTutor").val().replace(/[$,]+/g, ""))));
        $("#feeSubGrandTotal").val(setCurrency(grandTotalAll));
        $("#expSubGrandTotal").val(setCurrency(Number($("#expSubTotalFinalPresenterTutor").val().replace(/[$,]+/g, "")) + Number($("#expSubGrandTotalConvenor").val().replace(/[$,]+/g, ""))));
        $("#totalGrandTotal").val(setCurrency(Number($("#totalFinalPresenterTutor").val().replace(/[$,]+/g, "")) + Number($("#totalGrandFinalConvenor").val().replace(/[$,]+/g, ""))));
        CalculateTotal();
    }

    ///Rony

    var i = 0;
    var j = 0;
    var k = 0;

    function setCourseInfo(courseInfo) {
        debugger;
        $('#txtCourseCode').val(courseInfo.courseCode);
        $('#ddlCourseName').val(courseInfo.courseName).change();
        $('#txtAptifyID').val(courseInfo.aptifyId);
        $('#ddlStatus').val(courseInfo.courseStatus).change();
        $('#ddlGroup').val(courseInfo.group_).change();
        $('#ddlCPDHours').val(parseFloat(courseInfo.CPDHours).toFixed(2)).change();
        $('#ddlCourseLevel').val(courseInfo.CourseLevel).change();
        $('#ddlCoHost').val(courseInfo.co_host).change();
        $('#ddlDurationDays').val(parseFloat(courseInfo.CourseDurationDays).toFixed(2)).change();
        $('#txtCoordinator').val(courseInfo.coordinator);
        $('#ddlAdditionalGroup').val(courseInfo.Additional_group).change();
        $('#ddlCountry').val(courseInfo.country).change();
        $('#ddlState').val(courseInfo.state_).change();
        $('#ddlMetroRegionalLocation').val(courseInfo.reg_metro_int).change();
        $('#txtAddress').val(courseInfo.venue);
        $('#ddlSuburb').val(courseInfo.suburb_city).change();
        $('#txtZip').val(courseInfo.zipcode);
        $('#txtCourseDate').val(courseInfo.courseDate);
        $('#txtIterationBeginDate').val(courseInfo.StartDate);
        $('#txtIterationEndDate').val(courseInfo.EndDate);
        $('#txtTotalNumberOfPresentersOnly').val(courseInfo.NoPresenters);
        $('#txtTotalNoOfConsultantsInput').val(courseInfo.totalConsultantIncPresenter);
        $('#txtNofOfFreePlaces').val(courseInfo.numberofFreePlace);
        $('#txtMinPayingParticipant').val(courseInfo.minimumParticipant);
        $('#txtAvgPayingPaticipant').val(courseInfo.averageParticipant);
        $('#txt40PerPayingParticipant').val(courseInfo.minimumAchieve40PerMargin);
        $('#txtMaximumAvailable').val(courseInfo.maximumAvailable);
        $('#txtOverheadContribution').val(courseInfo.contributionOverheadPercent);
        $('#txtParticipantFeeEBDistantMin').val(setCurrency(courseInfo.participantFeeEBDistantMin));
        $('#txtDiffBWSPMin').val(setCurrency(courseInfo.diffBWEBSP));
        $('#txtParticipantPerEBDistantMin').val(courseInfo.participantPerEBDistant + '%');
        $('#txtParticipantPerEBApaMin').val(courseInfo.participantPerEBApa + '%');
        $('#txtParticipantPerEBNonMemberMin').val(courseInfo.participantPerEBNonMember + '%');
        $('#txtParticipantPerNonDistantMin').val(courseInfo.participantPerNonDistant + '%');
        $('#txtParticipantPerNonApaMin').val(courseInfo.participantPerNonApa + '%');
        $('#txtParticipantPerNonMemberMin').val(courseInfo.participantPerNonMember + '%');
        $('#txtActParticipantEBDistantMin').val(courseInfo.actparticipantEBDistant);
        $('#txtActParticipantEBApaMin').val(courseInfo.actparticipantEBApa);
        $('#txtActParticipantEBNonMemberMin').val(courseInfo.actparticipantEBNonMember);
        $('#txtActParticipantNonDistantMin').val(courseInfo.actparticipantNonDistant);
        $('#txtActParticipantNonApaMin').val(courseInfo.actparticipantNonApa);
        $('#txtActParticipantNonMemberMin').val(courseInfo.actparticipantNonMember);
        $('#txtSponsorshipMin').val(setCurrency(courseInfo.sponsorshipMin));
        $('#txtDaysMTMin').val(courseInfo.morningTeaDays);
        $('#txtRateMTMin').val(setCurrency(courseInfo.morningTeaRate));
        $('#txtMorningTeaInvNum').val(courseInfo.teaInvNo);
        $('#txtMorningTeaInvoice').val(courseInfo.teaInvAMount);
        $('#Date1').val(courseInfo.teaInvDate);
        $('#ddlMTMinExpCode').val(courseInfo.teaInvCode).change();
        $('#txtDaysLMin').val(courseInfo.lunchDays);
        $('#txtRateLMin').val(setCurrency(courseInfo.lunchRate));
        $('#Text9').val(courseInfo.lunchInvNo);
        $('#txtLunchInvoice').val(courseInfo.lunchInvAMount);
        $('#Date2').val(courseInfo.lunchInvDate);
        $('#ddlLMinExpCode').val(courseInfo.lunchInvCode).change();
        $('#txtDaysATMin').val(courseInfo.afternoonTeaDays);
        $('#txtRateATMin').val(setCurrency(courseInfo.afternoonTeaRate));
        $('#Text17').val(courseInfo.aTeaInvNo);
        $('#txtAfternoonTeaInvoice').val(courseInfo.aTeaInvAMount);
        $('#Date3').val(courseInfo.aTeaInvDate);
        $('#ddlATMinExpCode').val(courseInfo.aTeaInvCode).change();
        $('#txtVenueHireDays').val(courseInfo.venueHireDays);
        $('#txtVenueHireRate').val(setCurrency(courseInfo.venueHireRate));
        $('#Text64').val(courseInfo.venueInvNo);
        $('#txtVenueInvoice').val(courseInfo.venueInvAMount);
        $('#Date12').val(courseInfo.venueInvDate);
        $('#ddlVenueHireExpCode').val(courseInfo.venueInvCode).change();
        $('#txtPoolHireDays').val(courseInfo.poolHireDays);
        $('#txtPoolHireRate').val(setCurrency(courseInfo.poolHireRate));
        $('#Text79').val(courseInfo.poolInvNo);
        $('#txtPoolInvoice').val(courseInfo.poolInvAMount);
        $('#Date13').val(courseInfo.poolInvDate);
        $('#ddlPoolHireExpCode').val(courseInfo.poolInvCode).change();
        $('#txtAVHireDays').val(courseInfo.avHireDays);
        $('#txtAVHireRate').val(setCurrency(courseInfo.avHireRate));
        $('#Text94').val(courseInfo.avInvNo);
        $('#txtAvInvoice').val(courseInfo.avInvAMount);
        $('#Date14').val(courseInfo.avInvDate);
        $('#ddlAVHireExpCode').val(courseInfo.avInvCode).change();
        $('#txtCourseManualFeeMin').val(setCurrency(courseInfo.manualFeePerparticipant));
        $('#txtManualInv').val(courseInfo.manualInvNo);
        $('#txtManualInvAmount').val(courseInfo.manualInvAMount);
        $('#manualInvDate').val(courseInfo.manualInvDate);
        $('#ddlCourseManualsExpCode').val(courseInfo.manualInvCode).change();
        $('#txtSundryAmount').val(setCurrency(courseInfo.sundrySupplies));
        $('#sundryInvTotal').val(courseInfo.sundryInvNo);
        $('#txtSundryInvoice').val(courseInfo.sundryInvAMount);
        $('#Date7').val(courseInfo.sundryInvDate);
        $('#ddlSundaySuppliesExpCode').val(courseInfo.sundryInvCode).change();
        
    }

    function setOtherExpenses(otherExpenses) {
        if (otherExpenses.length > 0) {
            otherExpenses.forEach(populateOtherExpence)
        }
        fnCalculatePresenterSubTotal();
        fnCalculateTutorSubTotal();
        fnCalculateConvenorSubTotal();
        CalculateTotal();
    }

    function populateOtherExpence(item, index) {
        //if (index <= 0) {
        //	$('#otherExpense').val(item.otherExpenseName);
        //	$('#ddlOtherExpenseCode').val(item.expenseCode).change();
        //	$('#invNoOtherExp').val(item.invNumber);
        //	$('#invAmountOtherExp').val(item.invAmount);
        //	$('#amountOtherExp').val(item.amount);
        //	$('#datePaidOtherExp').val(item.datePaid);
        //}

        if (index >= 0) {


            debugger;

            var optionsConv = item.invExpCode;
            var optionsConvExpCode = item.expenseCode;
            var otherExpense = item.otherExpenseName;
            var amountOtherExp = item.amount;
            var datePaidOtherExp = item.datePaid;
            var invNoOtherExp = item.invNumber;
            var invAmountOtherExp = item.invAmount;

            var isValidItem = true;
            if (!($('#otherExpense').val().trim() != '')) {
                isValidItem = false;
                $('#otherExpense').siblings('span.error').css('visibility', 'visible');
            }

            var convenorDiv = '<tr class="otherExpenseListOut">' +
                '<td><center><input type="text" id="otherExpense1" name="otherExpense1" class="otherExpenseOutputTextBox othExName" Style="width: 100%!important;" value="' + otherExpense + '" disabled/></center></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input type="text" class="otherExpenseOutputTextBox othExCode" Style="width: 100%!important;" id="otherExpense2" name="otherExpense2" value="' + optionsConv + '" disabled/></td>' +
                //      '<td><input type="text" class="OtherExpenseInput otherExpPerCalClass" onkeyup="fnOtherExpPerCal();" id="amountOtherExpPer"/></td>' +
                '<td><center><input type="text" id="amountOtherExpPer" class="OtherExpenseInput otherExpCalClass othExPer" onkeyup="CalculateTotal();" /></center></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpCalClass othExAmt" id="amountOtherExp1" name="amountOtherExp1" value="' + amountOtherExp + '" disabled/></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input class="tblOtherExpenseCss othExInvNo" id="invNoOtherExp1" name="invNoOtherExp1" value="' + invNoOtherExp + '" disabled/></td>' +
                '<td><input class="tblOtherExpenseCss othExInvAmt" id="invAmountOtherExp1" name="invAmountOtherExp1" value="' + invAmountOtherExp + '" disabled/></td>' +
                '<td><input type="date" class="dynamicDateCss othExInvDate" id="datePaidOtherExp1" name="datePaidOtherExp1" value="' + datePaidOtherExp + '"/></td>' +
                '<td><input type="text" class="tblOtherExpenseCss othExInvCode" id="otherExpenseCode1" name="otherExpenseCode1" value="' + optionsConvExpCode + '" disabled/></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteOtherExp btn btn-danger btn-group-small">-</button></center></td>' +
                '</tr>';
            var convenorDiv1 = '<tr class="otherExpenseListOut">' +
                '<td><center><input type="text" id="otherExpense1" name="otherExpense1" class="otherExpenseOutputTextBox othExName" Style="width: 100%!important;" value="' + otherExpense + '" disabled/></center></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input type="text" class="otherExpenseOutputTextBox othExCode" Style="width: 100%!important;" id="otherExpense2" name="otherExpense2" value="' + optionsConv + '" disabled/></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpPerCalClass othExPer" id="amountOtherExpPer1" disabled/></td>' +
                '<td><input type="text" class="tblOtherInvoiceCss otherExpCalClass othExAmt" id="amountOtherExp1" name="amountOtherExp1" value="' + amountOtherExp + '" disabled/></td>' +
                '<td style="text-align: center; background-color: White;"></td>' +
                '<td><input class="tblOtherExpenseCss othExInvNo" id="invNoOtherExp1" name="invNoOtherExp1" value="' + invNoOtherExp + '" disabled/></td>' +
                '<td><input class="tblOtherExpenseCss othExInvAmt" id="invAmountOtherExp1" name="invAmountOtherExp1" value="' + invAmountOtherExp + '" disabled/></td>' +
                '<td><input type="date" class="dynamicDateCss othExInvDate" id="datePaidOtherExp1" name="datePaidOtherExp1" value="' + datePaidOtherExp + '"/></td>' +
                '<td><input type="text" class="tblOtherExpenseCss othExInvCode" id="otherExpenseCode1" name="otherExpenseCode1" value="' + optionsConvExpCode + '" disabled/></td>' +
                '<td><center><button type="button" id="btnDelete" class="deleteOtherExp btn btn-danger btn-group-small">-</button></center></td>' +
                '</tr>';
            var rowCount = $('#otherExpenseTable1 >tbody >tr').length;
            if (rowCount == 0) {
                $('#otherExpenseTable1').find('tbody').append(convenorDiv);
            }
            else if (rowCount > 0) {
                $('#otherExpenseTable1').find('tbody').append(convenorDiv1);
            }
            $("#otherExpenseTable1").show();
        }
    }

    function setResourcePerson(resourcePersons) {
        i = 0;
        j = 0;
        k = 0;
        if (resourcePersons.length > 0) {
            resourcePersons.forEach(populateResourcePerson,i)
        }
    }

    function populateResourcePerson(item, index) {
        debugger;
        if (item.resource_person_id > 0)
            if (item.rtype == "P") {
                if (index == 0) {
                    $('#ddlPresenters').val(item.resource_person_id).change();
                    $('#hourPresenter').val(item.hours_);
                    $('#sessionPresenter').val(item.session_);
                    $('#ratePresenter').val(setCurrency(item.rate));
                    $('#accomPresenter').val(setCurrency(item.accomadation));
                    $('#travelExpPresenter').val(setCurrency(item.travelEx));
                    $('#taxiPetrolPresenter').val(setCurrency(item.taxi));
                    $('#invNoPresenter').val(setCurrency(item.invNumber));
                    $('#invAmountPresenter').val(setCurrency(item.amount));
                    $('#datePaidPresenter').val(item.datePaid);
                    $('#mealPresenter').val(setCurrency(item.meal));

                    $('#feeSubTotalPresenter').val(setCurrency(item.rate * item.hours_));
                    $('#expSubTotalPresenter').val(setCurrency(item.accomadation + item.travelEx + item.taxi + item.meal));
                    $('#totalPresenter').val(setCurrency((item.accomadation + item.travelEx + item.taxi + item.meal) + (item.rate * item.hours_)));
                } else {
                    var optionsPre = $('#ddlPresenters').html();
                    var optionsPreExpCode = $('#ddlPresenterExpCode').html();
                    //optionsPreExpCode.replace();
                    var presenterDiv = '<tr class="presenterList">' +
                        '<td><center><select id="ddlPresenters" class="form-control presenterID" value="' + item.resource_person_id + '" >' + optionsPre + '</select></center></td>' +
                        '<td><input type="text" id="sessionPresenter" value="' + item.session_ + '" class="OtherExpenseInput session_"/></td>' +
                        '<td><center><input type="text" id="hourPresenter" value="' + item.hours_ + '"  class="OtherExpenseInput expPresenterCalClass hours_"/></center></td>' +
                        '<td><center><input type="text" id="ratePresenter" value="' + setCurrency(item.rate) + '"class="OtherExpenseInput expPresenterCalClass rate"/></center></td>' +
                        '<td><input type="text" id="feeSubTotalPresenter" class="OtherExpenseInput feeSubTotalPresenter" disabled/></td>' +
                        '<td></td>' +
                        '<td><center><input type="text" id="accomPresenter" value="' + setCurrency(item.accomadation) + '" class="OtherExpenseInput expPresenterCalClass accomadation" /></center></td>' +
                        '<td><center><input type="text" id="travelExpPresenter" value="' + setCurrency(item.travelEx) + '" class="OtherExpenseInput expPresenterCalClass travelEx" /></center></td>' +
                        '<td><center><input type="text" id="mealPresenter" value="' + setCurrency(item.meal) + '" class="OtherExpenseInput expPresenterCalClass meal" /></center></td>' +
                        '<td><center><input type="text" id="taxiPetrolPresenter" value="' + setCurrency(item.taxi) + '" class="OtherExpenseInput expPresenterCalClass taxi"/></center></td>' +
                        '<td><input type="text" id="expSubTotalPresenter" class="OtherExpenseInput expSubTotalPresenter" disabled/></td>' +
                        '<td><input type="text" id="totalPresenter" class="OtherExpenseInput totalPresenter" disabled/></td>' +
                        '<td></td>' +
                        '<td><input type="text" id="invNoPresenter" value="' + item.invNumber + '" class="tdInvoiceCss invNumber" /></td>' +
                        '<td><center><input type="text" id="invAmountPresenter"value="' + setCurrency(item.amount) + '" class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" /></center></td>' +
                        '<td><input type="date" id="datePaidPresenter" value="' + item.datePaid + '" class="tdInvoiceCss datePaid" /></td>' +

                        '<td><center><select id="ddlPresenterExpCode" class="tdInvoiceCss form-control expenseCode" >' + setCurrency(optionsPreExpCode) + '</select></center></td>' +
                        '<td><center><button type="button" id="btnDelete" class="deletePresenter btn btn btn-danger btn-xs">Remove</button></center></td>' +
                        '</tr>'
                        + '<tr class="presenterList">'
                        + '<td colspan="13"></td>'
                        + '<td><input class="tdInvoiceCss invNumber" id="invNoPresenterAccom" name="invNoPresenterAccom" /></td>'
                        + '<td>'
                        + '<input '
                        + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterAccom" name="invAmountPresenterAccom"/>'
                        + '</td>'
                        + '<td>'
                        + '<input type="date" id="datePaidPresenterAccom" name="datePaidPresenterAccom" class="tdInvoiceCss datePaid"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td>'
                        + '<input type="text" id="expCodePresenterAccom" name="expCodePresenterAccom" class="tdInvoiceCss expenseCode"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td></td>'
                        + '</tr>'
                        + '<tr class="presenterList">'
                        + '<td colspan="13"></td>'
                        + '<td>'
                        + '<input class="tdInvoiceCss invNumber" id="invNoPresenterTvExp" name="invNoPresenterTvExp" />'
                        + '</td>'
                        + '<td>'
                        + '<input '
                        + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterTravel" name="invAmountPresenterTravel"/>'
                        + '</td>'
                        + '<td>'
                        + '<input type="date" id="datePaidPresenterTvExp" name="datePaidPresenterTvExp" class="tdInvoiceCss datePaid"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td>'
                        + '<input type="text" id="expCodePresenterTvExp" name="expCodePresenterTvExp" class="tdInvoiceCss expenseCode"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td></td>'
                        + '</tr>'
                        + '<tr class="presenterList">'
                        + '<td colspan="13"></td>'
                        + '<td>'
                        + '<input class="tdInvoiceCss invNumber" id="invNoPresenterMeal" name="invNoPresenterMeal" />'
                        + '</td>'
                        + '<td>'
                        + '<input '
                        + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterMeal" name="invAmountPresenterMeal"/>'
                        + '</td>'
                        + '<td>'
                        + '<input type="date" id="datePaidPresenterMeal" name="datePaidPresenterMeal" class="tdInvoiceCss datePaid"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td>'
                        + '<input type="text" id="expCodePresenterMeal" name="expCodePresenterMeal" class="tdInvoiceCss expenseCode"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td></td>'
                        + '</tr>'
                        + '<tr class="presenterList">'
                        + '<td colspan="13"></td>'
                        + '<td>'
                        + '<input class="tdInvoiceCss invNumber" id="invNoPresenterTaxi" name="invNoPresenterTaxi" />'
                        + '</td>'
                        + '<td>'
                        + '<input '
                        + 'class="tdInvoiceCss expPresenterCalClass invAmountPresenter amount" id="invAmountPresenterTaxi" name="invAmountPresenterTaxi"/>'
                        + '</td>'
                        + '<td>'
                        + '<input type="date" id="datePaidPresenterTaxi" name="datePaidPresenterTaxi" class="tdInvoiceCss datePaid"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td>'
                        + '<input type="text" id="expCodePresenterTaxi" name="expCodePresenterTaxi" class="tdInvoiceCss expenseCode"'
                        + 'onkeyup="ResetErrorMsg();" />'
                        + '</td>'
                        + '<td></td>'
                        + '</tr>';
                    $('#presenterTable').append(presenterDiv); // Adding these controls to Main table class  
                    
                }
                if ((index + 1) % 5 == 0) {
                    $('#feeSubTotalPresenter').val(setCurrency(item.rate * item.hours_));
                    $('#expSubTotalPresenter').val(setCurrency(item.accomadation + item.travelEx + item.taxi + item.meal));
                    $('#totalPresenter').val(setCurrency((item.accomadation + item.travelEx + item.taxi + item.meal) + (item.rate * item.hours_)));
                }
                index++;
            } else if (item.rtype == "T") {
                if (j == 0) {
                    $('#ddlTutors').val(item.resource_person_id).change();
                    $('#hourTutor').val(item.hours_);
                    $('#sessionTutor').val(item.session_);
                    $('#rateTutor').val(setCurrency(item.rate));
                    $('#accomTutor').val(setCurrency(item.accomadation));
                    $('#travelExpTutor').val(setCurrency(item.travelEx));
                    $('#taxiPetrolTutor').val(setCurrency(item.taxi));
                    $('#invNoTutor').val(setCurrency(item.invNumber));
                    $('#invAmountTutor').val(setCurrency(item.amount));
                    $('#datePaidTutor').val(item.datePaid);
                    $('#mealTutor').val(setCurrency(item.meal));

                    $('#feeSubTotalTutor').val(setCurrency(item.rate * item.hours_));
                    $('#expSubTotalTutor').val(setCurrency(item.accomadation + item.travelEx + item.taxi + item.meal));
                    $('#totalTutor').val(setCurrency((item.accomadation + item.travelEx + item.taxi + item.meal) + (item.rate * item.hours_)));

                } else {
                    var optionsTutor = $('#ddlTutors').html();
                    var optionsTutorExpCode = $('#ddlTutorExpCode').html();
                    var tutorDiv = '<tr class="tutorList">' +
                        '<td><center><select id="ddlTutors" class="form-control" value="' + item.resource_person_id + '" >' + optionsTutor + '</select></center></td>' +
                        '<td><input type="text" id="sessionTutor" value="' + item.session_ + '" class="OtherExpenseInput"/></td>' +
                        '<td><center><input type="text" id="hourTutor" value="' + item.hours_ + '" class="OtherExpenseInput expTutorCalClass"/></center></td>' +
                        '<td><center><input type="text" id="rateTutor" value="' + setCurrency(item.rate) + '" class="OtherExpenseInput expTutorCalClass"/></center></td>' +
                        '<td><input type="text" id="feeSubTotalTutor" class="OtherExpenseInput feeSubTotalTutor" disabled/></td>' +
                        '<td></td>' +
                        '<td><center><input type="text" id="accomTutor" value="' + setCurrency(item.accomadation) + '" class="OtherExpenseInput expTutorCalClass" /></center></td>' +
                        '<td><center><input type="text" id="travelExpTutor" value="' + setCurrency(item.travelEx) + '"  class="OtherExpenseInput expTutorCalClass" /></center></td>' +
                        '<td><center><input type="text" id="mealTutor" value="' + setCurrency(item.meal) + '"  class="OtherExpenseInput expTutorCalClass" /></center></td>' +
                        '<td><center><input type="text" id="taxiPetrolTutor" value="' + setCurrency(item.taxi) + '"  class="OtherExpenseInput expTutorCalClass"/></center></td>' +
                        '<td><input type="text" id="expSubTotalTutor" class="OtherExpenseInput expSubTotalTutor" disabled/></td>' +
                        '<td><input type="text" id="totalTutor" class="OtherExpenseInput totalTutor" disabled/></td>' +
                        '<td></td>' +
                        '<td><input type="text" id="invNoTutor"  value="' + item.invNumber + '" class="tdInvoiceCss" /></td>' +
                        '<td><center><input type="text" id="invAmountTutor" value="' + setCurrency(item.amount) + '"  class="tdInvoiceCss expTutorCalClass invAmountTutor" /></center></td>' +
                        '<td><input type="date" id="datePaidTutor" value="' + item.datePaid + '"  class="tdInvoiceCss" /></td>' +
                        '<td><center><select id="ddlTutorExpCode" class="tdInvoiceCss form-control" >' + optionsTutorExpCode + '</select></center></td>' +
                        '<td><center><button type="button" id="btnDelete" class="deleteTutor btn btn btn-danger btn-xs">Remove</button></center></td>' +
                        '</tr>' +
                        '<tr class="tutorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorAccom" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorAccom" name="invAmountTutor" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceTutorAccom" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeTutorAccom" name="expCodePresenterAccom" class="tdInvoiceCss expCodePresenter expenseCode"' +
                        'onkeyup = "ResetErrorMsg();" /> ' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>' +
                        '<tr class="tutorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorTravel" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorTravel" name="invAmountTutorTravel"' +
                        '	min="1" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceTutorTravel" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeTutorTravel" name="expCodeTutorTravel" class="tdInvoiceCss expCodePresenter expenseCode"' +
                        'onkeyup = "ResetErrorMsg();" /> ' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>' +
                        '<tr class="tutorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorMeal" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorMeal" name="invAmountTutorMeal"/>' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceTutorMeal" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeTutorMeal" name="expCodePresenterAccom" class="tdInvoiceCss expCodePresenter expenseCode"' +
                        'onkeyup = "ResetErrorMsg();" /> ' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>' +
                        '<tr class="tutorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoTutor invNumber" id="txtInvNoTutorTaxi" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expTutorCalClass invAmountTutor amount" id="invAmountTutorTaxi" name="invAmountTutorTaxi"' +
                        '	min="1" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceTutorTaxi" class="tdInvoiceCss dateInvoiceTutor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeTutorTaxi" name="expCodePresenterAccom" class="tdInvoiceCss expCodePresenter expenseCode"' +
                        'onkeyup = "ResetErrorMsg();" /> ' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>';
                    $('#tutorTable').append(tutorDiv); // Adding these controls to Main table class 
                }


                j++;
            } else if (item.rtype == "C") {

                if (k == 0) {
                    $('#ddlConvenors').val(item.resource_person_id).change();
                    $('#hourConvenor').val(item.hours_);
                    $('#sessionConvenor').val(item.session_);
                    $('#rateConvenor').val(setCurrency(item.rate));
                    $('#accomConvenor').val(setCurrency(item.accomadation));
                    $('#travelExpConvenor').val(setCurrency(item.travelEx));
                    $('#taxiPetrolConvenor').val(setCurrency(item.taxi));
                    $('#invNoConvenor').val(setCurrency(item.invNumber));
                    $('#invAmountConvenor').val(setCurrency(item.amount));
                    $('#datePaidConvenor').val(item.datePaid);
                    $('#mealConvenor').val(setCurrency(item.meal));

                    $('#feeSubTotalConvenor').val(setCurrency(item.rate * item.hours_));
                    $('#expSubTotalConvenor').val(setCurrency(item.accomadation + item.travelEx + item.taxi + item.meal));
                    $('#totalConvenor').val(setCurrency((item.accomadation + item.travelEx + item.taxi + item.meal) + (item.rate * item.hours_)));

                } else {
                    debugger;
                    var optionsConv = $('#ddlConvenors').html();
                    var optionsConvExpCode = $('#ddlConvenorExpCode').html();
                    var convenorDiv = '<tr class="convenorList">' +
                        '<td><center><select id="ddlConvenors" class="form-control presenterID" value="' + item.resource_person_id + '" >' + optionsConv + '</select></center></td>' +
                        '<td><input type="text" id="sessionConvenor"  value="' + item.session_ + '" class="OtherExpenseInput session_"/></td>' +
                        '<td><center><input type="text" id="hourConvenor" value="' + item.hours_ + '" class="OtherExpenseInput expConvenorCalClass hours_"/></center></td>' +
                        '<td><center><input type="text" id="rateConvenor" value="' + setCurrency(item.rate) + '" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="rate" class="OtherExpenseInput expConvenorCalClass rate" /></center></td>' +
                        '<td><input type="text" id="feeSubTotalConvenor" class="OtherExpenseInput feeSubTotalConvenor" disabled/></td>' +
                        '<td></td>' +
                        '<td><center><input type="text" id="accomConvenor" value="' + setCurrency(item.accomadation) + '"  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass accomadation" /></center></td>' +
                        '<td><center><input type="text" id="travelExpConvenor" value="' + setCurrency(item.travelEx) + '" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass travelEx meal" /></center></td>' +
                        '<td><center><input type="text" id="mealConvenor" value="' + setCurrency(item.meal) + '"  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass taxi" /></center></td>' +
                        '<td><center><input type="text" id="taxiPetrolConvenor" value="' + setCurrency(item.taxi) + '"  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency" placeholder="amount" class="OtherExpenseInput expConvenorCalClass" /></center></td>' +
                        '<td><input type="text" id="expSubTotalConvenor" class="OtherExpenseInput expSubTotalConvenor" disabled/></td>' +
                        '<td><input type="text" id="totalConvenor" class="OtherExpenseInput totalConvenor" disabled/></td>' +
                        '<td></td>' +
                        '<td><input type="text" id="invNoConvenor" value="' + item.invNumber + '"  class="tdInvoiceCss invNumber" /></td>' +
                        '<td><center><input type="text" id="invAmountConvenor" value="' + setCurrency(item.amount) + '"   class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" /></center></td>' +
                        '<td><input type="date" id="datePaidConvenor" value="' + item.datePaid + '" class="tdInvoiceCss datePaid" /></td>' +
                        '<td><center><select id="ddlConvenorExpCode" class="tdInvoiceCss form-control expenseCode" >' + optionsConvExpCode + '</select></center></td>' +
                        '<td><center><button type="button" id="btnDelete" class="deleteConvenor btn btn btn-danger btn-xs">Remove</button></center></td>' +
                        '</tr>' +
                        '<tr class="convenorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorAccom" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorAccom" name="invAmountConvenor" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceConvenorAccom" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeConvenorAccom" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                        '		onkeyup="ResetErrorMsg();" />' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>' +
                        '<tr class="convenorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorTravel" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorTravel" name="invAmountConvenorTravel"' +
                        '	min="1" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceConvenorTravel" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeConvenorTravel" name="expCodeConvenorTravel" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                        '		onkeyup="ResetErrorMsg();" />' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>' +
                        '<tr class="convenorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorMeal" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorMeal" name="invAmountConvenorMeal"/>' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceConvenorMeal" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeConvenorMeal" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                        '		onkeyup="ResetErrorMsg();" />' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>' +
                        '<tr class="convenorList">' +
                        '<td colspan="13"></td>' +
                        '<td>' +
                        '<input class="tdInvoiceCss txtInvNoConvenor invNumber" id="txtInvNoConvenorTaxi" />' +
                        '</td>' +
                        '<td>' +
                        '<input' +
                        '	class="tdInvoiceCss expConvenorCalClass invAmountConvenor amount" id="invAmountConvenorTaxi" name="invAmountConvenorTaxi"' +
                        '	min="1" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="date" id="dateInvoiceConvenorTaxi" class="tdInvoiceCss dateInvoiceConvenor datePaid" />' +
                        '</td>' +
                        '<td>' +
                        '<input type="text" id="expCodeConvenorTaxi" name="expCodeConvenorAccom" class="tdInvoiceCss expCodeConvenor expenseCode"' +
                        '		onkeyup="ResetErrorMsg();" />' +
                        '</td>' +
                        '<td>' +
                        '</td>' +
                        '</tr>';
                    $('#convenorTable').append(convenorDiv); // Adding these controls to Main table class 
                }

                k++;
            }
    }
</script>
<script type="text/javascript">
    // Jquery Dependency

    $("input[data-type='currency']").on({
        keyup: function () {
            formatCurrency($(this));
        },
        blur: function () {
            formatCurrency($(this), "blur");
        }
    });


    function formatNumber(n) {
        // format number 1000000 to 1,234,567
        return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    }


    function formatCurrency(input, blur) {
        // appends $ to value, validates decimal side
        // and puts cursor back in right position.

        // get input value
        var input_val = input.val();

        // don't validate empty input
        if (input_val === "") { return; }

        // original length
        var original_len = input_val.length;

        // initial caret position 
        var caret_pos = input.prop("selectionStart");

        // check for decimal
        if (input_val.indexOf(".") >= 0) {

            // get position of first decimal
            // this prevents multiple decimals from
            // being entered
            var decimal_pos = input_val.indexOf(".");

            // split number by decimal point
            var left_side = input_val.substring(0, decimal_pos);
            var right_side = input_val.substring(decimal_pos);

            // add commas to left side of number
            left_side = formatNumber(left_side);

            // validate right side
            right_side = formatNumber(right_side);

            // On blur make sure 2 numbers after decimal
            if (blur === "blur") {
                right_side += "00";
            }

            // Limit decimal to only 2 digits
            right_side = right_side.substring(0, 2);

            // join number by .
            input_val = "$" + left_side + "." + right_side;

        } else {
            // no decimal entered
            // add commas to number
            // remove all non-digits
            input_val = formatNumber(input_val);
            input_val = "$" + input_val;

            // final formatting
            if (blur === "blur") {
                input_val += ".00";
            }
        }

        // send updated string to input
        input.val(input_val);

        // put caret back in the right position
        var updated_len = input_val.length;
        caret_pos = updated_len - original_len + caret_pos;
        input[0].setSelectionRange(caret_pos, caret_pos);
    }

    function setCurrency(amount) {
        if (amount < 0) {
            amount = Math.abs(amount);
            return '-$' + parseFloat(amount, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString()
        } else {
            return '$' + parseFloat(amount, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString()
        }
    }

    function CalculateTotal() {
        var totalPresenter = 0;
        var totalConsultantIncPresenter = 0;
        var totalFreePlaces = 0;
        var participantMin = 0;
        var participantAvg = 0;
        var participant40Per = 0;
        var participantMax = 0;

        totalPresenter = parseFloat($("#txtTotalNumberOfPresentersOnly").val()) || parseFloat(0);
        totalConsultantIncPresenter = parseFloat($("#txtTotalNoOfConsultantsInput").val()) || parseFloat(0);
        totalFreePlaces = parseFloat($("#txtNofOfFreePlaces").val()) || parseFloat(0);
        participantMin = parseFloat($("#txtMinPayingParticipant").val()) || parseFloat(0);
        participantAvg = parseFloat($("#txtAvgPayingPaticipant").val()) || participantMin;
        participant40Per = parseFloat($("#txt40PerPayingParticipant").val()) || participantMin;
        participantMax = parseFloat($("#txtMaximumAvailable").val()) || participantMin;

        var totalParticipantIncResMin = totalConsultantIncPresenter + totalFreePlaces + participantMin;
        var totalParticipantIncResAvg = totalConsultantIncPresenter + totalFreePlaces + participantAvg;
        var totalParticipantIncRes40Per = totalConsultantIncPresenter + totalFreePlaces + participant40Per;
        var totalParticipantIncResMax = totalConsultantIncPresenter + totalFreePlaces + participantMax;

        var totalParticipantOnlyMin = totalFreePlaces + participantMin;
        var totalParticipantOnlyAvg = totalFreePlaces + participantAvg;
        var totalParticipantOnly40Per = totalFreePlaces + participant40Per;
        var totalParticipantOnlyMax = totalFreePlaces + participantMax;

        $("#txtTotalParticipantIncResMin").val(totalParticipantIncResMin || 0);
        $("#txtTotalParticipantOnlyMin").val(totalParticipantOnlyMin || 0);

        $("#txtTotalParticipantIncResAvg").val(totalParticipantIncResAvg || 0);
        $("#txtTotalParticipantOnlyAvg").val(totalParticipantOnlyAvg || 0);

        $("#txtTotalParticipantIncRes40Per").val(totalParticipantIncRes40Per || 0);
        $("#txtTotalParticipantOnly40Per").val(totalParticipantOnly40Per || 0);

        $("#txtTotalParticipantIncResMax").val(totalParticipantIncResMax || 0);
        $("#txtTotalParticipantOnlyMax").val(totalParticipantOnlyMax || 0);

        //Minimum calculation
        var participantFeeEBDistantMin = 0;

        var participantFeeEBDistantMin = parseFloat($("#txtParticipantFeeEBDistantMin").val().replace(/[$,]+/g, "")) || parseFloat(0);


        var sponsorshipMin = parseFloat($("#txtSponsorshipMin").val().replace(/[$,]+/g, "")) || parseFloat(0);
        //Percent Value
        var participantPerEBDistantMin = parseFloat($("#txtParticipantPerEBDistantMin").val()) || parseFloat(0);
        var participantPerEBApaMin = parseFloat($("#txtParticipantPerEBApaMin").val()) || parseFloat(0);
        var participantPerEBNonMemberMin = parseFloat($("#txtParticipantPerEBNonMemberMin").val()) || parseFloat(0);
        var participantPerNonDistantMin = parseFloat($("#txtParticipantPerNonDistantMin").val()) || parseFloat(0);
        var participantPerNonApaMin = parseFloat($("#txtParticipantPerNonApaMin").val()) || parseFloat(0);
        var participantPerNonMemberMin = parseFloat($("#txtParticipantPerNonMemberMin").val()) || parseFloat(0);

        //Percentage value for others//
        var totalPercentage = participantPerEBDistantMin + participantPerEBApaMin + participantPerEBNonMemberMin + participantPerNonDistantMin
            + participantPerNonApaMin + participantPerNonMemberMin;
        $("#percentageTotalMin").html(totalPercentage + '%');

        $("#EBDistantAvg").html(participantPerEBDistantMin + '%');
        $("#EBApaAvg").html(participantPerEBApaMin + '%');
        $("#EBNonMemberAvg").html(participantPerEBNonMemberMin + '%');
        $("#NonDistantAvg").html(participantPerNonDistantMin + '%');
        $("#NonApaAvg").html(participantPerNonApaMin + '%');
        $("#NonMemberAvg").html(participantPerNonMemberMin + '%');
        $("#totalPercentageAvg").html(totalPercentage + '%');


        $("#EBDistant40Per").html(participantPerEBDistantMin + '%');
        $("#EBApa40Per").html(participantPerEBApaMin + '%');
        $("#EBNonMember40Per").html(participantPerEBNonMemberMin + '%');
        $("#NonDistant40Per").html(participantPerNonDistantMin + '%');
        $("#NonApa40Per").html(participantPerNonApaMin + '%');
        $("#NonMember40Per").html(participantPerNonMemberMin + '%');
        $("#totalPertange40Per").html(totalPercentage + '%');

        //End of percentage value for other
        var diff = parseFloat($("#txtDiffBWSPMin").val().replace(/[$,]+/g, "")) || parseFloat(0);
        var participantFeeEBApaMin = participantFeeEBDistantMin + parseFloat(55);
        var participantFeeEBNonMemberMin = participantFeeEBApaMin * parseFloat(1.5);
        var participantFeeNonDistantMin = participantFeeEBDistantMin + parseFloat(diff);
        var participantFeeNonApaMin = participantFeeEBApaMin + parseFloat(diff);
        var participantFeeNonMemberMin = participantFeeEBNonMemberMin + parseFloat(diff);

        $("#txtDiffBWEBSPAvg").val(setCurrency(diff));
        $("#txtDiffBWEBSP40Per").val(setCurrency(diff));
        //$("#txtParticipantFeeEBDistantMin").val(participantFeeEBDistantMin);
        $("#txtParticipantFeeEBApaMin").val(setCurrency(participantFeeEBApaMin));
        $("#txtParticipantFeeEBNonMemberMin").val(setCurrency(participantFeeEBNonMemberMin));
        $("#txtParticipantFeeNonDistantMin").val(setCurrency(participantFeeNonDistantMin));
        $("#txtParticipantFeeNonApaMin").val(setCurrency(participantFeeNonApaMin));
        $("#txtParticipantFeeNonMemberMin").val(setCurrency(participantFeeNonMemberMin));

        var participantEBDistantMin = (participantPerEBDistantMin * participantMin) / 100;
        var participantEBApaMin = (participantPerEBApaMin * participantMin) / 100;
        var participantEBNonMemberMin = (participantPerEBNonMemberMin * participantMin) / 100;
        var participantNonDistantMin = (participantPerNonDistantMin * participantMin) / 100;
        var participantNonApaMin = (participantPerNonApaMin * participantMin) / 100;
        var participantNonMemberMin = (participantPerNonMemberMin * participantMin) / 100;

        $("#txtParticipantEBDistantMin").val(participantEBDistantMin.toFixed(2));
        $("#txtParticipantEBApaMin").val(participantEBApaMin.toFixed(2));
        $("#txtParticipantEBNonMemberMin").val(participantEBNonMemberMin.toFixed(2));
        $("#txtParticipantNonDistantMin").val(participantNonDistantMin.toFixed(2));
        $("#txtParticipantNonApaMin").val(participantNonApaMin.toFixed(2));
        $("#txtParticipantNonMemberMin").val(participantNonMemberMin.toFixed(2));

        var courseFeeEBDistantMin = parseFloat(participantFeeEBDistantMin) / parseFloat(1.1).toFixed(2);
        var courseFeeEBApaMin = participantFeeEBApaMin / parseFloat(1.1).toFixed(2);
        var courseFeeEBNonMemberMin = participantFeeEBNonMemberMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonDistantMin = participantFeeNonDistantMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonApaMin = participantFeeNonApaMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonMemberMin = participantFeeNonMemberMin / parseFloat(1.1).toFixed(2);
        var sponsorshipCourseFeeMin = sponsorshipMin / parseFloat(1.1).toFixed(2);
        $("#txtCourseFeeEBDistantMin").val(setCurrency(courseFeeEBDistantMin));
        $("#txtCourseFeeEBApaMin").val(setCurrency(courseFeeEBApaMin));
        $("#txtCourseFeeEBNonMemberMin").val(setCurrency(courseFeeEBNonMemberMin));
        $("#txtCourseFeeNonDistantMin").val(setCurrency(courseFeeNonDistantMin));
        $("#txtCourseFeeNonApaMin").val(setCurrency(courseFeeNonApaMin));
        $("#txtCourseFeeNonMemberMin").val(setCurrency(courseFeeNonMemberMin));
        $("#txtSponsorshipCourseFeeMin").val(setCurrency(sponsorshipCourseFeeMin));

        var totalFeeEBDistantMin = participantEBDistantMin * courseFeeEBDistantMin;
        var totalFeeEBApaMin = participantEBApaMin * courseFeeEBApaMin;
        var totalFeeEBNonMemberMin = participantEBNonMemberMin * courseFeeEBNonMemberMin;
        var totalFeeNonDistantMin = participantNonDistantMin * courseFeeNonDistantMin;
        var totalFeeNonApaMin = participantNonApaMin * courseFeeNonApaMin;
        var totalFeeNonMemberMin = participantNonMemberMin * courseFeeNonMemberMin;
        var sponsorshipTotalCourseFeeMin = sponsorshipCourseFeeMin;

        $("#txtTotalFeeEBDistantMin").val(setCurrency(totalFeeEBDistantMin.toFixed(2)));
        $("#txtTotalFeeEBApaMin").val(setCurrency(totalFeeEBApaMin.toFixed(2)));
        $("#txtTotalFeeEBNonMemberMin").val(setCurrency(totalFeeEBNonMemberMin.toFixed(2)));
        $("#txtTotalFeeNonDistantMin").val(setCurrency(totalFeeNonDistantMin.toFixed(2)));
        $("#txtTotalFeeNonApaMin").val(setCurrency(totalFeeNonApaMin.toFixed(2)));
        $("#txtTotalFeeNonMemberMin").val(setCurrency(totalFeeNonMemberMin.toFixed(2)));
        $("#txtTotalSponsorshipCourseFeeMin").val(setCurrency(sponsorshipTotalCourseFeeMin.toFixed(2)));

        var incomeGrandTotalMin = parseFloat(totalFeeEBDistantMin) + parseFloat(totalFeeEBApaMin) + parseFloat(totalFeeEBNonMemberMin)
            + parseFloat(totalFeeNonDistantMin) + parseFloat(totalFeeNonApaMin) + parseFloat(totalFeeNonMemberMin) + parseFloat(sponsorshipTotalCourseFeeMin);
        $("#txtAllMinIncomeGrandTotal").val(setCurrency(incomeGrandTotalMin.toFixed(2)));


        //Actual Calculation
        var actParticipantEBDistantMin = parseFloat($("#txtActParticipantEBDistantMin").val()) || parseFloat(0);
        var actParticipantEBApaMin = parseFloat($("#txtActParticipantEBApaMin").val()) || parseFloat(0);
        var actParticipantEBNonMemberMin = parseFloat($("#txtActParticipantEBNonMemberMin").val()) || parseFloat(0);
        var actParticipantNonDistantMin = parseFloat($("#txtActParticipantNonDistantMin").val()) || parseFloat(0);
        var actParticipantNonApaMin = parseFloat($("#txtActParticipantNonApaMin").val()) || parseFloat(0);
        var actParticipantNonMemberMin = parseFloat($("#txtActParticipantNonMemberMin").val()) || parseFloat(0);
        var totalActParticipantMin = actParticipantEBDistantMin + actParticipantEBApaMin + actParticipantEBNonMemberMin + actParticipantNonDistantMin
            + actParticipantNonApaMin + actParticipantNonMemberMin;
        $("#txtFinalActualParticMinOutput").val(totalActParticipantMin);


        var actIncomeEBDistantMin = parseFloat(courseFeeEBDistantMin) * parseFloat(actParticipantEBDistantMin).toFixed(2);
        var actIncomeEBApaMin = parseFloat(courseFeeEBApaMin) * parseFloat(actParticipantEBApaMin).toFixed(2);
        var actIncomeEBNonMemberMin = parseFloat(courseFeeEBNonMemberMin) * parseFloat(actParticipantEBNonMemberMin).toFixed(2);
        var actIncomeNonDistantMin = parseFloat(courseFeeNonDistantMin) * parseFloat(actParticipantNonDistantMin).toFixed(2);
        var actIncomeNonApaMin = parseFloat(courseFeeNonApaMin) * parseFloat(actParticipantNonApaMin).toFixed(2);
        var actIncomeNonMemberMin = parseFloat(courseFeeNonMemberMin) * parseFloat(actParticipantNonMemberMin).toFixed(2);
        var actSponsorshipMin = sponsorshipMin;

        $("#txtActIncomeEBDistantMin").val(setCurrency(actIncomeEBDistantMin));
        $("#txtActIncomeEBApaMin").val(setCurrency(actIncomeEBApaMin));
        $("#txtActIncomeEBNonMemberMin").val(setCurrency(actIncomeEBNonMemberMin));
        $("#txtActIncomeNonDistantMin").val(setCurrency(actIncomeNonDistantMin));
        $("#txtActIncomeNonApaMin").val(setCurrency(actIncomeNonApaMin));
        $("#txtActIncomeNonMemberMin").val(setCurrency(actIncomeNonMemberMin));
        $("#txtActSponsorshipMin").val(setCurrency(actSponsorshipMin.toFixed(2)));

        var totalActIncomeMin = parseFloat(actIncomeEBDistantMin) + parseFloat(actIncomeEBApaMin) + parseFloat(actIncomeEBNonMemberMin) + parseFloat(actIncomeNonDistantMin)
            + parseFloat(actIncomeNonApaMin) + parseFloat(actIncomeNonMemberMin) + parseFloat(actSponsorshipMin);
        $("#txtFinalActualIncomeMinOutput").val(setCurrency(totalActIncomeMin.toFixed(2)));

        //Average Number Calculation
        $("#txtParticipantFeeEBDistantAvg").val(setCurrency(participantFeeEBDistantMin));
        $("#txtParticipantFeeEBApaAvg").val(setCurrency(participantFeeEBApaMin));
        $("#txtParticipantFeeEBNonMemberAvg").val(setCurrency(participantFeeEBNonMemberMin));
        $("#txtParticipantFeeNonDistantAvg").val(setCurrency(participantFeeNonDistantMin));
        $("#txtParticipantFeeNonApaAvg").val(setCurrency(participantFeeNonApaMin));
        $("#txtParticipantFeeNonMemberAvg").val(setCurrency(participantFeeNonMemberMin));
        $("#txtSponsorshipAvg").val(setCurrency(sponsorshipMin));

        var participantEBDistantAvg = (participantPerEBDistantMin * participantAvg) / 100;
        var participantEBApaAvg = (participantPerEBApaMin * participantAvg) / 100;
        var participantEBNonMemberAvg = (participantPerEBNonMemberMin * participantAvg) / 100;
        var participantNonDistantAvg = (participantPerNonDistantMin * participantAvg) / 100;
        var participantNonApaAvg = (participantPerNonApaMin * participantAvg) / 100;
        var participantNonMemberAvg = (participantPerNonMemberMin * participantAvg) / 100;

        $("#txtParticipantEBDistantAvg").val(participantEBDistantAvg.toFixed(2));
        $("#txtParticipantEBApaAvg").val(participantEBApaAvg.toFixed(2));
        $("#txtParticipantEBNonMemberAvg").val(participantEBNonMemberAvg.toFixed(2));
        $("#txtParticipantNonDistantAvg").val(participantNonDistantAvg.toFixed(2));
        $("#txtParticipantNonApaAvg").val(participantNonApaAvg.toFixed(2));
        $("#txtParticipantNonMemberAvg").val(participantNonMemberAvg.toFixed(2));

        var courseFeeEBDistantAvg = participantFeeEBDistantMin / parseFloat(1.1).toFixed(2);
        var courseFeeEBApaAvg = participantFeeEBApaMin / parseFloat(1.1).toFixed(2);
        var courseFeeEBNonMemberAvg = participantFeeEBNonMemberMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonDistantAvg = participantFeeNonDistantMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonApaAvg = participantFeeNonApaMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonMemberAvg = participantFeeNonMemberMin / parseFloat(1.1).toFixed(2);
        var sponsorshipCourseFeeAvg = sponsorshipMin / parseFloat(1.1).toFixed(2);
        $("#txtCourseFeeEBDistantAvg").val(setCurrency(courseFeeEBDistantAvg));
        $("#txtCourseFeeEBApaAvg").val(setCurrency(courseFeeEBApaAvg));
        $("#txtCourseFeeEBNonMemberAvg").val(setCurrency(courseFeeEBNonMemberAvg));
        $("#txtCourseFeeNonDistantAvg").val(setCurrency(courseFeeNonDistantAvg));
        $("#txtCourseFeeNonApaAvg").val(setCurrency(courseFeeNonApaAvg));
        $("#txtCourseFeeNonMemberAvg").val(setCurrency(courseFeeNonMemberAvg));
        $("#txtSponsorshipCourseFeeAvg").val(setCurrency(sponsorshipCourseFeeAvg));

        var totalFeeEBDistantAvg = participantEBDistantAvg * courseFeeEBDistantAvg;
        var totalFeeEBApaAvg = participantEBApaAvg * courseFeeEBApaAvg;
        var totalFeeEBNonMemberAvg = participantEBNonMemberAvg * courseFeeEBNonMemberAvg;
        var totalFeeNonDistantAvg = participantNonDistantAvg * courseFeeNonDistantAvg;
        var totalFeeNonApaAvg = participantNonApaAvg * courseFeeNonApaAvg;
        var totalFeeNonMemberAvg = participantNonMemberAvg * courseFeeNonMemberAvg;
        var sponsorshipTotalCourseFeeAvg = sponsorshipCourseFeeAvg;

        $("#txtTotalFeeEBDistantAvg").val(setCurrency(totalFeeEBDistantAvg));
        $("#txtTotalFeeEBApaAvg").val(setCurrency(totalFeeEBApaAvg));
        $("#txtTotalFeeEBNonMemberAvg").val(setCurrency(totalFeeEBNonMemberAvg));
        $("#txtTotalFeeNonDistantAvg").val(setCurrency(totalFeeNonDistantAvg));
        $("#txtTotalFeeNonApaAvg").val(setCurrency(totalFeeNonApaAvg));
        $("#txtTotalFeeNonMemberAvg").val(setCurrency(totalFeeNonMemberAvg));
        $("#txtTotalSponsorshipCourseFeeAvg").val(setCurrency(sponsorshipTotalCourseFeeAvg));

        var incomeGrandTotalAvg = parseFloat(totalFeeEBDistantAvg) + parseFloat(totalFeeEBApaAvg) + parseFloat(totalFeeEBNonMemberAvg)
            + parseFloat(totalFeeNonDistantAvg) + parseFloat(totalFeeNonApaAvg) + parseFloat(totalFeeNonMemberAvg) + parseFloat(sponsorshipTotalCourseFeeAvg);
        $("#txtAvgGrandTotal").val(setCurrency(incomeGrandTotalAvg.toFixed(2)));

        //40% Margin Calculation
        $("#txtParticipantFeeEBDistant40Per").val(setCurrency(participantFeeEBDistantMin));
        $("#txtParticipantFeeEBApa40Per").val(setCurrency(participantFeeEBApaMin));
        $("#txtParticipantFeeEBNonMember40Per").val(setCurrency(participantFeeEBNonMemberMin));
        $("#txtParticipantFeeNonDistant40Per").val(setCurrency(participantFeeNonDistantMin));
        $("#txtParticipantFeeNonApa40Per").val(setCurrency(participantFeeNonApaMin));
        $("#txtParticipantFeeNonMember40Per").val(setCurrency(participantFeeNonMemberMin));

        var participantEBDistant40Per = ((participantPerEBDistantMin * participant40Per) / 100);
        var participantEBApa40Per = ((participantPerEBApaMin * participant40Per) / 100);
        var participantEBNonMember40Per = ((participantPerEBNonMemberMin * participant40Per) / 100);
        var participantNonDistant40Per = ((participantPerNonDistantMin * participant40Per) / 100);
        var participantNonApa40Per = ((participantPerNonApaMin * participant40Per) / 100);
        var participantNonMember40Per = ((participantPerNonMemberMin * participant40Per) / 100);

        $("#txtParticipantEBDistant40Per").val(participantEBDistant40Per);
        $("#txtParticipantEBApa40Per").val(participantEBApa40Per);
        $("#txtParticipantEBNonMember40Per").val(participantEBNonMember40Per);
        $("#txtParticipantNonDistant40Per").val(participantNonDistant40Per);
        $("#txtParticipantNonApa40Per").val(participantNonApa40Per);
        $("#txtParticipantNonMember40Per").val(participantNonMember40Per);

        var courseFeeEBDistant40Per = participantFeeEBDistantMin / parseFloat(1.1).toFixed(2);
        var courseFeeEBApa40Per = participantFeeEBApaMin / parseFloat(1.1).toFixed(2);
        var courseFeeEBNonMember40Per = participantFeeEBNonMemberMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonDistant40Per = participantFeeNonDistantMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonApa40Per = participantFeeNonApaMin / parseFloat(1.1).toFixed(2);
        var courseFeeNonMember40Per = participantFeeNonMemberMin / parseFloat(1.1).toFixed(2);
        var sponsorshipCourseFee40Per = sponsorshipMin / parseFloat(1.1);
        $("#txtCourseFeeEBDistant40Per").val(setCurrency(courseFeeEBDistant40Per));
        $("#txtCourseFeeEBApa40Per").val(setCurrency(courseFeeEBApa40Per));
        $("#txtCourseFeeEBNonMember40Per").val(setCurrency(courseFeeEBNonMember40Per));
        $("#txtCourseFeeNonDistant40Per").val(setCurrency(courseFeeNonDistant40Per));
        $("#txtCourseFeeNonApa40Per").val(setCurrency(courseFeeNonApa40Per));
        $("#txtCourseFeeNonMember40Per").val(setCurrency(courseFeeNonMember40Per));
        $("#txtSponsorshipCourseFee40Per").val(setCurrency(sponsorshipCourseFee40Per));

        var totalFeeEBDistant40Per = participantEBDistant40Per * courseFeeEBDistant40Per;
        var totalFeeEBApa40Per = participantEBApa40Per * courseFeeEBApa40Per;
        var totalFeeEBNonMember40Per = participantEBNonMember40Per * courseFeeEBNonMember40Per;
        var totalFeeNonDistant40Per = participantNonDistant40Per * courseFeeNonDistant40Per;
        var totalFeeNonApa40Per = participantNonApa40Per * courseFeeNonApa40Per;
        var totalFeeNonMember40Per = participantNonMember40Per * courseFeeNonMember40Per;
        var sponsorshipTotalCourseFee40Per = sponsorshipCourseFee40Per;

        $("#txtTotalFeeEBDistant40Per").val(setCurrency(totalFeeEBDistant40Per));
        $("#txtTotalFeeEBApa40Per").val(setCurrency(totalFeeEBApa40Per));
        $("#txtTotalFeeEBNonMember40Per").val(setCurrency(totalFeeEBNonMember40Per));
        $("#txtTotalFeeNonDistant40Per").val(setCurrency(totalFeeNonDistant40Per));
        $("#txtTotalFeeNonApa40Per").val(setCurrency(totalFeeNonApa40Per));
        $("#txtTotalFeeNonMember40Per").val(setCurrency(totalFeeNonMember40Per));
        $("#txtTotalSponsorshipCourseFee40Per").val(setCurrency(sponsorshipTotalCourseFee40Per));
        $("#txtSponsorship40Per").val(setCurrency(sponsorshipMin));

        var incomeGrandTotal40Per = parseFloat(totalFeeEBDistant40Per) + parseFloat(totalFeeEBApa40Per) + parseFloat(totalFeeEBNonMember40Per)
            + parseFloat(totalFeeNonDistant40Per) + parseFloat(totalFeeNonApa40Per) + parseFloat(totalFeeNonMember40Per) + parseFloat(sponsorshipTotalCourseFee40Per);
        $("#txtAcvGrandTotal").val(setCurrency(incomeGrandTotal40Per.toFixed(2)));


        fnFixedCategoryItemCal();
        //fnOtherExpPerCal();
    }

    function fnFixedCategoryItemCal() {
        //debugger;
        var daysMtMin = 0;
        var rateMtMin = 0;
        var daysLuMin = 0;
        var rateLuMin = 0;
        var daysAtMin = 0;
        var rateAtMin = 0;
        var cateringTotalMin = 0;
        daysMtMin = parseInt($('#txtDaysMTMin').val()) || parseInt(0);
        rateMtMin = parseFloat($('#txtRateMTMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
        daysLuMin = parseInt($('#txtDaysLMin').val()) || parseInt(0);
        rateLuMin = parseFloat($('#txtRateLMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
        daysAtMin = parseInt($('#txtDaysATMin').val()) || parseInt(0);
        rateAtMin = parseFloat($('#txtRateATMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
        //Catering (fixed price)
        $('#txtMTTotalMin').val(setCurrency((daysMtMin * rateMtMin).toFixed(2)));
        $('#txtLunchTotalMin').val(setCurrency((daysLuMin * rateLuMin).toFixed(2)));
        $('#txtATTotalMin').val(setCurrency((daysAtMin * rateAtMin).toFixed(2)));

        var participantMin = parseInt($("#txtTotalParticipantIncResMin").val()) || parseInt(0);
        var grandTotalMin = (daysMtMin * rateMtMin) + (daysLuMin * rateLuMin) + (daysAtMin * rateAtMin);
        $('#txtAllCateringGrandTotalMin').val(setCurrency(parseFloat(grandTotalMin) * parseFloat(participantMin)));

        $('#txtMorningTeaInvNum').val("Pending");
        $('#txtMorningTeaInvoice').val(setCurrency((daysMtMin * rateMtMin * participantMin)));
        $('#ddlMTMinExpCode').val("40496").change();
        $('#Text9').val("Pending");
        $('#txtLunchInvoice').val(setCurrency((daysLuMin * rateLuMin * participantMin)));
        $('#ddlLMinExpCode').val("40496").change();
        $('#Text17').val("Pending");
        $('#txtAfternoonTeaInvoice').val(setCurrency((daysAtMin * rateAtMin * participantMin)));
        $('#ddlATMinExpCode').val("40496").change();
        /*if ($('#txtMTTotalMin').val().trim() != '' && !isNaN($('#txtLunchTotalMin').val().trim()) && $('#txtATTotalMin').val().trim() != '0') {
            $('#txtAllCateringGrandTotalMin').val((eval($('#txtMTTotalMin').val().trim()) + eval($('#txtLunchTotalMin').val().trim()) + eval($('#txtATTotalMin').val().trim())) * eval($('#txtMinParticipantsToRunCourseTotal').val().trim()));
        }*/

        //end


        //Catering (fixed price) for AVG attendance


        $('#txtDaysMTAvg').val(daysMtMin);
        $('#txtDaysMTMargin').val(daysMtMin);
        $('#txtDaysLAvg').val(daysLuMin);
        $('#txtDaysLMargin').val(daysLuMin);
        $('#txtDaysATAvg').val(daysAtMin);
        $('#txtDaysATMargin').val(daysAtMin);

        $('#txtRateMTAvg').val($('#txtRateMTMin').val().trim());
        $('#txtRateMTMargin').val($('#txtRateMTMin').val().trim());

        $('#txtRateLAvg').val($('#txtRateLMin').val().trim());
        $('#txtRateLMargin').val($('#txtRateLMin').val().trim());

        $('#txtRateATAvg').val($('#txtRateATMin').val().trim());
        $('#txtRateATMargin').val($('#txtRateATMin').val().trim());


        $('#txtMTTotalAvg').val(setCurrency((daysMtMin * rateMtMin)));
        $('#txtLunchTotalAvg').val(setCurrency((daysLuMin * rateLuMin)));
        $('#txtATTotalAvg').val(setCurrency((daysAtMin * rateAtMin)));
        var participantAvg = parseInt($("#txtTotalParticipantIncResAvg").val()) || parseInt(0);
        $('#txtAllCateringGrandTotalAvg').val(setCurrency(parseFloat(participantAvg) * parseFloat(grandTotalMin)));

        var participant40Per = parseInt($("#txtTotalParticipantIncRes40Per").val()) || parseInt(0);

        $('#txtMTTotalMargin').val(setCurrency((daysMtMin * rateMtMin)));
        $('#txtLunchTotalMargin').val(setCurrency((daysLuMin * rateLuMin)));
        $('#txtATTotalMargin').val(setCurrency((daysAtMin * rateAtMin)));
        $('#txtAllCateringGrandTotalMargin').val(setCurrency(parseFloat(participant40Per) * parseFloat(grandTotalMin)));

        //Others
        var txtVenueHireDays = parseInt($('#txtVenueHireDays').val()) || parseInt(0);
        var txtVenueHireRate = parseFloat($('#txtVenueHireRate').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var txtPoolHireDays = parseInt($('#txtPoolHireDays').val()) || parseInt(0);
        var txtPoolHireRate = parseFloat($('#txtPoolHireRate').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var txtAVHireDays = parseInt($('#txtAVHireDays').val()) || parseInt(0);
        var txtAVHireRate = parseFloat($('#txtAVHireRate').val().replace(/[$,]+/g, "")) || parseFloat(0);

        $('#txtVenueHireTotal').val(setCurrency(txtVenueHireDays * txtVenueHireRate));
        $('#txtPoolHireTotal').val(setCurrency(txtPoolHireDays * txtPoolHireRate));
        $('#txtAVHireTotal').val(setCurrency(txtAVHireDays * txtAVHireRate));
        $('#txtVPAGrandTotal').val(setCurrency(txtVenueHireDays * txtVenueHireRate) + Math.round(txtPoolHireDays * txtPoolHireRate) + Math.round(txtAVHireDays * txtAVHireRate));

        $('#txtVenueHireTotalFinal').val(setCurrency(txtVenueHireDays * txtVenueHireRate));
        $('#txtPoolHireTotalFinal').val(setCurrency(txtPoolHireDays * txtPoolHireRate));
        $('#txtAVHireTotalFinal').val(setCurrency(txtAVHireDays * txtAVHireRate));
        $('#txtVPAGrandTotalFinal').val(setCurrency(txtVenueHireDays * txtVenueHireRate + txtPoolHireDays * txtPoolHireRate + txtAVHireDays * txtAVHireRate));

        /*if ($('#txtVPAGrandTotal').val().trim() != '' && !isNaN($('#txtVPAGrandTotal').val().trim())) {
            $('#txtVPAGrandTotalFinal').val(setCurrency(Math.round(txtVenueHireDays * txtVenueHireRate) + Math.round(txtPoolHireDays * txtPoolHireRate) + Math.round(txtAVHireDays * txtAVHireRate)));
        }*/

        $('#Text64').val("Pending");
        $('#txtVenueInvoice').val(setCurrency(txtVenueHireDays * txtVenueHireRate));
        $('#ddlVenueHireExpCode').val("40498").change();
        $('#Text79').val("Pending");
        $('#txtPoolInvoice').val(setCurrency(txtPoolHireDays * txtPoolHireRate));
        $('#ddlPoolHireExpCode').val("40498").change();
        $('#Text94').val("Pending");
        $('#txtAvInvoice').val(setCurrency(txtAVHireDays * txtAVHireRate));
        $('#ddlAVHireExpCode').val("40498").change();

        //end
        var manualFee = parseFloat($('#txtCourseManualFeeMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
        $('#txtCourseManualFeeAvg').val(setCurrency(manualFee));
        $('#txtCourseManualFee40Per').val(setCurrency(manualFee));
        //Course Manuals - cost per participants (generally fixed price)
        $('#txtTotalManualFeeMin').val(setCurrency(manualFee * parseFloat(participantMin)));

        $('#txtManualInv').val("Pending");
        $('#txtManualInvAmount').val(setCurrency(manualFee * parseFloat(participantMin)));
        $('#ddlCourseManualsExpCode').val("40500").change();

        $('#txtTotalManualFeeAvg').val(setCurrency(manualFee * parseFloat(participantAvg)));
        $('#txtTotalManualFee40Per').val(setCurrency(manualFee * parseFloat(participant40Per)));

        $('#txtSundryAmountFinal').val(setCurrency(parseFloat($('#txtSundryAmount').val().replace(/[$,]+/g, ""))) || parseFloat(0));

        $('#sundryInvTotal').val("Pending");
        $('#txtSundryInvoice').val(setCurrency(parseFloat($('#txtSundryAmount').val().replace(/[$,]+/g, "")) || parseFloat(0)));
        $('#ddlSundaySuppliesExpCode').val("40501").change();

        //Invoice Amount calculation
        var moringTeaInvoice = parseFloat($('#txtMorningTeaInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var lunchInvoice = parseFloat($('#txtLunchInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var afternoonTeaInvoice = parseFloat($('#txtAfternoonTeaInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var totalCatring = moringTeaInvoice + lunchInvoice + afternoonTeaInvoice;
        $("#cateringInvTotal").val(setCurrency(totalCatring));

        var venueInvoice = parseFloat($('#txtVenueInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var poolInvoice = parseFloat($('#txtPoolInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var avInvoice = parseFloat($('#txtAvInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var totalVAPInvoice = venueInvoice + poolInvoice + avInvoice;
        $("#vAvPoolInvTotal").val(setCurrency(totalVAPInvoice));


        //end of invoice amount calculation
        calculateProfitLoss();
    }

    function calculateProfitLoss() {
        debugger;

        var totalPresenter = 0;
        var totalConsultantIncPresenter = 0;
        var totalFreePlaces = 0;
        var participantMin = 0;
        var participantAvg = 0;
        var participant40Per = 0;
        var participantMax = 0;

        totalPresenter = parseFloat($("#txtTotalNumberOfPresentersOnly").val()) || parseFloat(0);
        totalConsultantIncPresenter = parseFloat($("#txtTotalNoOfConsultantsInput").val()) || parseFloat(0);
        totalFreePlaces = parseFloat($("#txtNofOfFreePlaces").val()) || parseFloat(0);
        participantMin = parseFloat($("#txtMinPayingParticipant").val()) || parseFloat(0);
        participantAvg = parseFloat($("#txtAvgPayingPaticipant").val()) || participantMin;
        participant40Per = parseFloat($("#txt40PerPayingParticipant").val()) || participantMin;
        participantMax = parseFloat($("#txtMaximumAvailable").val()) || participantMin;

        var overHead = parseFloat($("#txtOverheadContribution").val()) || parseFloat(0);

        overHead = (overHead / parseFloat(100)).toFixed(2);
        //alert(overHead);
        var presenterTutorTotal = parseFloat($('#totalFinalPresenterTutor2').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var convenerTotal = parseFloat($('#totalGrandFinalConvenor2').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var cateringTotalMin = parseFloat($('#txtAllCateringGrandTotalMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var catringTotalAvg = parseFloat($('#txtAllCateringGrandTotalAvg').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var catringTotal40Per = parseFloat($('#txtAllCateringGrandTotalMargin').val().replace(/[$,]+/g, "")) || parseFloat(0);

        var manualTotalMin = parseFloat($('#txtTotalManualFeeMin').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var manualTotalAvg = parseFloat($('#txtTotalManualFeeAvg').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var manualTotal40Per = parseFloat($('#txtTotalManualFee40Per').val().replace(/[$,]+/g, "")) || parseFloat(0);

        var vPATotal = parseFloat($('#txtVPAGrandTotalFinal').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var sundryTotal = parseFloat($('#txtSundryAmountFinal').val().replace(/[$,]+/g, "")) || parseFloat(0);

        var amountOtExp = 0;
        var amountInv = 0;
        $("#otherExpenseTable1 tbody tr").each(function () {
            debugger;
            amountOtExp = amountOtExp + Number($(this).find("#amountOtherExp1").val().replace(/[$,]+/g, ""));
            amountInv = amountInv + Number($(this).find("#invAmountOtherExp1").val().replace(/[$,]+/g, ""));
        });

        var totalCostMin = presenterTutorTotal + convenerTotal + cateringTotalMin + vPATotal + manualTotalMin + sundryTotal + amountOtExp;
        $("#txtTotalCostMin").val(setCurrency(totalCostMin));
        //alert(totalCostMin);

        var totalCostIncOvMin = totalCostMin / parseFloat(1 - overHead);
        $("#txtTotalFeeMin").val(setCurrency(totalCostIncOvMin));
        //alert(totalCostIncOvMin);
        if (participantMin > 0) {
            $("#txtParticipantCostMin").val(setCurrency(totalCostMin / parseFloat(participantMin)));
            $("#txtTotalParticipantFeeIncOvMin").val(setCurrency(parseFloat($("#txtTotalFeeMin").val().replace(/[$,]+/g, "")) / parseFloat(participantMin)));
        } else {
            $("#txtParticipantCostMin").val("");
            $("#txtTotalParticipantFeeIncOvMin").val("");
        }
        //Actual value calculation
        var invAmtPresenterTutor = parseFloat($('#invAmtTotalFinalPresenterTutor').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invAmountConvenor = parseFloat($('#invSubTotalAmountConvenor').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invAmountCatering = parseFloat($('#cateringInvTotal').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invAmountVPA = parseFloat($('#vAvPoolInvTotal').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invAmountManual = parseFloat($('#txtManualInvAmount').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invAmountSundry = parseFloat($('#txtSundryInvoice').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var invAmountTotal = invAmtPresenterTutor + invAmountConvenor + invAmountCatering + invAmountVPA + invAmountManual + invAmountSundry + amountInv;

        var actParticipant = parseFloat($('#txtFinalActualParticMinOutput').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var actIncomeAmount = parseFloat($('#txtFinalActualIncomeMinOutput').val().replace(/[$,]+/g, "")) || parseFloat(0);
        $("#txtTotalCostExMin").val(setCurrency(invAmountTotal));


        var totalExIncOvMin = invAmountTotal / parseFloat(1 - overHead);
        $("#txtTotalFeeExMin").val(setCurrency(totalExIncOvMin));
        if (actParticipant > 0) {
            $("#txtParticipantCostExMin").val(setCurrency(invAmountTotal / actParticipant));
            $("#txtTotalParticipantFeeIncOvExMin").val(setCurrency(totalExIncOvMin / actParticipant));
        } else {
            $("#txtParticipantCostExMin").val("");
            $("#txtTotalParticipantFeeIncOvExMin").val("");
        }
        $("#txtActPLMin").val(setCurrency(actIncomeAmount - invAmountTotal));
        $("#txtActPLIncOvMin").val(setCurrency(actIncomeAmount - totalExIncOvMin));
        if (actIncomeAmount > 0) {
            $("#txtActGM").val(Math.round((parseFloat($("#txtActPLMin").val().replace(/[$,]+/g, "")) / actIncomeAmount) * 100) + '%');
            $("#txtActGMIncOv").val(Math.round((parseFloat($("#txtActPLIncOvMin").val().replace(/[$,]+/g, "")) / actIncomeAmount) * 100) + '%');
            //end of actual value calculation
        } else {
            $("#txtActGM").val('%');
            $("#txtActGMIncOv").val('%');
        }
        var totalCostAvg = presenterTutorTotal + convenerTotal + catringTotalAvg + vPATotal + manualTotalAvg + sundryTotal + amountOtExp;
        $("#txtTotalCostAvg").val(setCurrency(totalCostAvg));

        $("#txtTotalFeeAvg").val(setCurrency(totalCostAvg / parseFloat(1 - overHead)));
        if (participantAvg > 0) {
            $("#txtParticipantCostAvg").val(setCurrency(totalCostAvg / parseFloat(participantAvg)));
            $("#txtTotalParticipantFeeIncOvAvg").val(setCurrency(parseFloat($("#txtTotalFeeAvg").val().replace(/[$,]+/g, "")) / parseFloat(participantAvg)));
        } else {
            $("#txtParticipantCostAvg").val("");
            $("#txtTotalParticipantFeeIncOvAvg").val("");
        }
        var totalCost40Per = presenterTutorTotal + convenerTotal + catringTotal40Per + vPATotal + manualTotal40Per + sundryTotal + amountOtExp;
        $("#txtTotalCost40Per").val(setCurrency(totalCost40Per));

        $("#txtTotalFee40Per").val(setCurrency(totalCost40Per / parseFloat(1 - overHead)));
        if (participant40Per > 0) {
            $("#txtParticipantCost40Per").val(setCurrency(totalCost40Per / parseFloat(participant40Per)));
            $("#txtTotalParticipantFeeIncOv40Per").val(setCurrency(parseFloat($("#txtTotalFee40Per").val().replace(/[$,]+/g, "")) / parseFloat(participant40Per)));
        } else {
            $("#txtParticipantCost40Per").val("");
            $("#txtTotalParticipantFeeIncOv40Per").val("");
        }
        var incomeTotalMin = parseFloat($('#txtAllMinIncomeGrandTotal').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var incomeTotalAvg = parseFloat($('#txtAvgGrandTotal').val().replace(/[$,]+/g, "")) || parseFloat(0);
        var incomeTotal40Per = parseFloat($('#txtAcvGrandTotal').val().replace(/[$,]+/g, "")) || parseFloat(0);

        $("#txtProjectedPLMin").val(setCurrency(incomeTotalMin - totalCostMin));
        $("#txtProjectedPLIncOvMin").val(setCurrency(incomeTotalMin - (totalCostMin / parseFloat(1 - overHead))));
        if (incomeTotalMin > 0) {
            $("#txtGMMin").val(Math.round(parseFloat((incomeTotalMin - totalCostMin) / incomeTotalMin) * 100).toFixed(0) + '%');
            $("#txtGMIncOvMin").val(Math.round(((incomeTotalMin - (totalCostMin / parseFloat(1 - overHead))) / incomeTotalMin) * 100) + '%');
        } else {
            $("#txtGMMin").val('%');
            $("#txtGMIncOvMin").val('%');
        }
        var exSpiltMin = (parseFloat($("#txtProjectedPLMin").val().replace(/[$,]+/g, "")) * 50) / 100;
        var incSpiltMin = (parseFloat($("#txtProjectedPLIncOvMin").val().replace(/[$,]+/g, "")) * 50) / 100;
        $("#exOvSpilt50Min").html(setCurrency(exSpiltMin));
        $("#incOvSpilt50Min").html(setCurrency(incSpiltMin));
        if (incomeTotalMin > 0) {
            $("#marginSpiltMin").html(Math.round((exSpiltMin / incomeTotalMin) * 100) + '%');
            $("#marginIncSpiltMin").html(Math.round((incSpiltMin / incomeTotalMin) * 100) + '%');
        } else {
            $("#marginSpiltMin").html('%');
            $("#marginIncSpiltMin").html('%');
        }
        $("#txtProjectedPLAvg").val(setCurrency(incomeTotalAvg - totalCostAvg));
        $("#txtProjectedPLIncOvAvg").val(setCurrency(incomeTotalAvg - (totalCostAvg / parseFloat(1 - overHead))));
        if (incomeTotalAvg > 0) {
            $("#txtGMAvg").val(Math.round(parseFloat((incomeTotalAvg - totalCostAvg) / incomeTotalAvg) * 100).toFixed(0) + '%');
            $("#txtGMIncOvAvg").val(Math.round(((incomeTotalAvg - (totalCostAvg / parseFloat(1 - overHead))) / incomeTotalAvg) * 100) + '%');
        } else {
            $("#txtGMAvg").val('%');
            $("#txtGMIncOvAvg").val('%');
        }
        var exSpiltAvg = (parseFloat($("#txtProjectedPLAvg").val().replace(/[$,]+/g, "")) * 50) / 100;
        var incSpiltAvg = (parseFloat($("#txtProjectedPLIncOvAvg").val().replace(/[$,]+/g, "")) * 50) / 100;
        $("#exOvSpilt50Avg").html(setCurrency(exSpiltAvg));
        $("#incOvSpilt50Avg").html(setCurrency(incSpiltAvg));
        if (incomeTotalAvg > 0) {
            $("#marginSpilt50Avg").html(Math.round((exSpiltAvg / incomeTotalAvg) * 100) + '%');
            $("#marginSpiltInc50Avg").html(Math.round((incSpiltAvg / incomeTotalAvg) * 100) + '%');
        } else {
            $("#marginSpilt50Avg").html('%');
            $("#marginSpiltInc50Avg").html('%');
        }
        var exSpilt60Avg = (parseFloat($("#txtProjectedPLAvg").val().replace(/[$,]+/g, "")) * 60) / 100;
        var incSpilt60Avg = (parseFloat($("#txtProjectedPLIncOvAvg").val().replace(/[$,]+/g, "")) * 60) / 100;
        $("#exOvSpilt60Avg").html(setCurrency(exSpilt60Avg));
        $("#incOvSpilt60Avg").html(setCurrency(incSpilt60Avg));
        if (incomeTotalAvg > 0) {
            $("#marginSpilt60Avg").html(Math.round((exSpilt60Avg / incomeTotalAvg) * 100) + '%');
            $("#marginSpiltInc60Avg").html(Math.round((incSpilt60Avg / incomeTotalAvg) * 100) + '%');
        } else {
            $("#marginSpilt60Avg").html('%');
            $("#marginSpiltInc60Avg").html('%');
        }
        $("#txtProjectedPL40Per").val(setCurrency(incomeTotal40Per - totalCost40Per));
        $("#txtProjectedPLIncOv40Per").val(setCurrency(incomeTotal40Per - (totalCost40Per / parseFloat(1 - overHead))));
        if (incomeTotalAvg > 0) {
            $("#txtGM40Per").val(Math.round(parseFloat((incomeTotal40Per - totalCost40Per) / incomeTotal40Per) * 100).toFixed(0) + '%');
            $("#txtG40PercOv40Per").val(Math.round(((incomeTotal40Per - (totalCost40Per / parseFloat(1 - overHead))) / incomeTotal40Per) * 100) + '%');
        } else {
            $("#txtGM40Per").val('%');
            $("#txtG40PercOv40Per").val('%');
        }
        var exSpiltMar = (parseFloat($("#txtProjectedPL40Per").val().replace(/[$,]+/g, "")) * 60) / 100;
        var incSpiltMar = (parseFloat($("#txtProjectedPLIncOv40Per").val().replace(/[$,]+/g, "")) * 60) / 100;
        $("#exSpilt60Mar").html(setCurrency(exSpiltMar));
        $("#incSpilt60Mar").html(setCurrency(incSpiltMar));
        if (incomeTotal40Per > 0) {
            $("#marSpilt60Mar").html(Math.round((exSpiltMar / incomeTotal40Per) * 100) + '%');
            $("#marSpiltInc60Mar").html(Math.round((incSpiltMar / incomeTotal40Per) * 100) + '%');
        } else {
            $("#marSpilt60Mar").html('%');
            $("#marSpiltInc60Mar").html('%');
        }
    }

</script>
<script type="text/javascript">
    $(document).on("click", ".AddMoreFreePlaces", function () {
        $("#TextBox3").html("<input type='text'>");
    });

    function fnAddMoreFreePlaces() {
        alert("test");
        $("#TextBox3").html("<input type='text'>");
    }

</script>
<script type="text/javascript" src="scripts/select2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#ddlCourseName").val($("#ddlCourseName option:selected").val());
        $("#ddlGroup").val($("#ddlGroup option:selected").val());
        $("#ddlAdditionalGroup").val($("#ddlAdditionalGroup option:selected").val());
        $("#ddlCoHost").val($("#ddlCoHost option:selected").val());
        $("#ddlStatus").val($("#ddlStatus option:selected").val());
        $("#ddlState").val($("#ddlState option:selected").val());
        $("#ddlDurationDays").val($("#ddlDurationDays option:selected").val());
        $("#ddlCPDHours").val($("#ddlCPDHours option:selected").val());
        $("#ddlCountry").val($("#ddlCountry option:selected").val());
        $("#ddlMetroRegionalLocation").val($("#ddlMetroRegionalLocation option:selected").val());
        $("#ddlCourseLevel").val($("#ddlCourseLevel option:selected").val());
        $("#ddlSuburb").val($("#ddlSuburb option:selected").val());
        //$("#ddlCourseCode").val($("#ddlCourseCode option:selected").val());
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#ddlCourseName").select2();
        $("#ddlGroup").select2();
        $("#ddlAdditionalGroup").select2();
        $("#ddlCoHost").select2();
        $("#ddlStatus").select2();
        $("#ddlState").select2();
        $("#ddlDurationDays").select2();
        $("#ddlCPDHours").select2();
        $("#ddlCountry").select2();
        $("#ddlMetroRegionalLocation").select2();
        $("#ddlCourseLevel").select2();
        $("#ddlSuburb").select2();
        //$("#ddlCourseCode").select2();
    });
</script>
</html>
