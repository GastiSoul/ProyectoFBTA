﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["registro"] == "exitoso")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "registroExitoso", "alert('Registro exitoso');", true);
                }
            }
        }
    }
}