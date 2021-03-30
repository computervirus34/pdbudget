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
    public partial class user : System.Web.UI.Page
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
                    dt = pl.GetParameter("user role");
                    fl.PopulateDDL(dt, ddlType, "ID", "Name", true, "--Select--", "-1");

                    this.BindGrid();
                }
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            string query = "SELECT * FROM users where isActive='Y'";
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
            string userID = txtUserID.Text;
            string password = txtPassword.Text;
            string role = ddlType.Text;
            txtUserID.Text = "";
            txtPassword.Text = "";
            ddlType.Text = "-1";
            string query = "INSERT INTO users(userName, password, userRole, isActive) " +
                "VALUES(@userName, @password,@userRole, @isActive)";
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@userName", userID);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@userRole", role);
                    cmd.Parameters.AddWithValue("@isActive", "Y");
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
            string userID = (row.FindControl("txtUserID") as TextBox).Text;
            string password = (row.FindControl("txtPassword") as TextBox).Text;
            string role = (row.FindControl("txtType") as TextBox).Text;

            string query = "UPDATE users SET userName=@userName, password=@password, " +
                           "userRole = @userRole WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@userName", userID);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@userRole", role);
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


        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "update users set isActive = 'N'  WHERE id=@id";
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
                (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }



        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}