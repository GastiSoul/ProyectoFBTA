using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace pruebalogin2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=DISCORDIA;Database=Queso;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("Select * from ULogin where UserId=@UserId and Password=@Password", con);
            cmd.Parameters.AddWithValue("@UserId", TxtUser.Text);
            cmd.Parameters.AddWithValue("@Password", TxtPassword.Text);
            SqlDataAdapter da= new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds,"Ulogin");
            if (ds.Tables["Ulogin"].Rows.Count == 0) 
            {
                Response.Write("Invalid User");
            }
            else
            {
                Response.Redirect("Payaso.aspx");
            }
        }

        protected void TxtUser_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TxtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}