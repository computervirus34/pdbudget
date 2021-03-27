using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PDBudget
{
    public partial class presenter : System.Web.UI.Page
    {
        DataReader dr = new DataReader();
        PopulateLists pl = new PopulateLists();
        FillList fl = new FillList();
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
                if (!this.IsPostBack)
                {
                    DataTable dt = new DataTable();
                    dt = null;
                    dt = pl.GetParameter("State");
                    fl.PopulateDDL(dt, ddlState, "ID", "Name", true, "--Select--", "-1");

                    dt = null;
                    dt = pl.GetParameter("Resource Type");
                    fl.PopulateDDL(dt, ddlType, "ID", "Name", true, "--Select--", "-1");

                    this.BindGrid();
                }
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            string query = "SELECT * FROM resourcepersondetails";
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }


        protected void Insert(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string fName = txtFName.Text;
            string lName = txtLName.Text;
            string city = txtCity.Text;
            string state = ddlState.Text;
            string type = ddlType.Text;
            txtTitle.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtCity.Text = "";
            ddlState.Text = "-1";
            ddlType.Text = "-1";
            string query = "INSERT INTO resourcepersondetails(title, firstName, lastName, city, state, type) " +
                "VALUES(@title, @fName,@lName, @city, @state, @type)";
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@fName", fName);
                    cmd.Parameters.AddWithValue("@lName", lName);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@type", type.Substring(0,1));
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string title = (row.FindControl("txtTitle") as TextBox).Text;
            string fName = (row.FindControl("txtFName") as TextBox).Text;
            string lName = (row.FindControl("txtLName") as TextBox).Text;
            string city = (row.FindControl("txtCity") as TextBox).Text;
            string state = (row.FindControl("ddlState") as TextBox).Text;
            string type = (row.FindControl("ddlType") as TextBox).Text;

            string query = "UPDATE resourcepersondetails SET title=@title, firstName=@fName, " +
                           "lastName = @lName, city = @city, state=@state, type=@type"+
                            " WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@fName", fName);
                    cmd.Parameters.AddWithValue("@lName", lName);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }


        /*protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM resourcepersondetails WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }


        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[6].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
        */


        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

    }
}