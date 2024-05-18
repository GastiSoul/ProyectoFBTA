using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace DemoP
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection coneccion;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            coneccion = new SqlConnection("Data Source = DESKTOP - 4VRPQJF; Initial Catalog = PF; Integrated Security = True");

        }
    }
}