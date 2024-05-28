using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace pruebalogin2
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TxtUser.Text) || string.IsNullOrEmpty(TxtPassword.Text))
            {
                Response.Write("Por favor, ingresa un usuario y una contraseña válidos.");
                return;
            }

            try
            {
                // Cadena de conexión a la base de datos SQL Server
                string connectionString = "Server=Localhost;Database=Queso;Trusted_Connection=True;";


                string query = "SELECT COUNT(*) FROM Usuarios WHERE Correo=@Correo AND Contraseña=@Contraseña";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Correo", TxtUser.Text);
                        cmd.Parameters.AddWithValue("@Contraseña", TxtPassword.Text);

                        con.Open();

                        int count = (int)cmd.ExecuteScalar();

                        if (count == 0)
                        {
                            Response.Write("Usuario o contraseña incorrectos.");
                        }
                        else
                        {
                            // Usuario válido, redirigir a la página de inicio
                            Response.Redirect("MenuPrincipal.aspx");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
