using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PDBudget
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated || Session["user"] == null)
            {
                Session.RemoveAll();
                Session.Clear();
                Session.Abandon();
                FormsAuthentication.SignOut();
                Response.Redirect("~/Login");
            }
            else
            {
                if (!Session["user"].ToString().Equals("admin"))
                {
                    /*MenuItem item = Menu1.FindItem("Parameter");
                    item.Parent.ChildItems.Remove(item);*/
                    MenuItemCollection menuItems = Menu1.Items;
                    MenuItem adminItem = new MenuItem();
                    foreach (MenuItem menuItem in menuItems)
                    {
                        if (menuItem.Text == "Parameter")
                            adminItem = menuItem;
                    }
                    menuItems.Remove(adminItem);
                }
                if (!this.IsPostBack)
                {
                    //Populating a DataTable from database.
                    DataTable dt = this.GetData();

                    //Building an HTML string.
                    StringBuilder html = new StringBuilder();

                    //Table start.
                    html.Append("<table class='freeze-table' border = '1'>");
                    html.Append("<thead>");
                    //html.Append("<table id='reportTable' border = '1'>");
                    //Building the Header row.
                    html.Append("<tr class='header'>");
                    int i = 1;
                    foreach (DataColumn column in dt.Columns)
                    {
                        if (i < 15)
                        {
                            html.Append("<th style='min-width:70px;' class='col-id-no-"+i+" fixed-header'>");
                        }
                        else if (i < 23 || i > 82)
                        {
                            html.Append("<th>");
                        }
                        else
                        {
                            html.Append("<th class='vertical-th'>");
                        }
                        html.Append(column.ColumnName);
                        html.Append("</th>");
                        i = i + 1;
                    }
                    html.Append("</tr>");
                    html.Append("</thead>");
                    html.Append("<tbody>");
                    //Building the Data rows.
                    
                    foreach (DataRow row in dt.Rows)
                    {
                        i = 1;
                        html.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            if (i < 15) { html.Append("<td  class='col-id-no-" + i + " scope='row'>"); }
                            else { html.Append("<td style='min-width:auto;'>"); }
                            html.Append(row[column.ColumnName]);
                            html.Append("</td>");
                            i++;
                        }
                        html.Append("</tr>");
                    }

                    //Table end.
                    html.Append("</tbody>");
                    html.Append("</table>");

                    //Append the HTML string to Placeholder.
                    PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                }
            }
        }

        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = @"select * from rptfinalreport";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
    }
}