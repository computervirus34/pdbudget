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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
               Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }


        protected void ValidateUser(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string userRole = null;
            string constr = ConfigurationManager.ConnectionStrings["MysqlConnection"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand("Validate_User"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@p_Username", username);
                    cmd.Parameters.AddWithValue("@p_Password", password);
                    cmd.Connection = con;
                    con.Open();
                    userRole = Convert.ToString(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userRole)
                {
                    case "-1":
                        dvMessage.Visible = true;
                        lblMessage.Text = "Username and/or password is incorrect.";
                        break;
                    default:
                        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                        {
                            Session["user"] = txtUsername.Text.Trim();
                            Session["userRole"] = userRole;
                            FormsAuthentication.SetAuthCookie(username, chkRememberMe.Checked);
                            Response.Redirect(Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            Session["user"] = txtUsername.Text.Trim();
                            Session["userRole"] = userRole;
                            FormsAuthentication.RedirectFromLoginPage(username, chkRememberMe.Checked);
                        }
                    break;
                }
            }
        }

    }
}