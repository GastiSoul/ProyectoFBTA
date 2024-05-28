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
                            // Verificar los permisos y guardarlos en una variable de sesión
                            bool usuarioConPermisos = true; // Inicialmente asumimos que el usuario no tiene permisos

                            // Consulta la base de datos para verificar los permisos del usuario
                            string queryPermisos = "SELECT Permisos FROM Usuarios WHERE Correo=@Correo AND Contraseña=@Contraseña";
                            using (SqlCommand cmdPermisos = new SqlCommand(queryPermisos, con))
                            {
                                cmdPermisos.Parameters.AddWithValue("@Correo", TxtUser.Text);
                                cmdPermisos.Parameters.AddWithValue("@Contraseña", TxtPassword.Text);

                                // Ejecutar la consulta
                                object result = cmdPermisos.ExecuteScalar();
                                if (result != null)
                                {
                                    usuarioConPermisos = (bool)result; // Actualizar la variable de acuerdo a los permisos obtenidos
                                }
                            }

                            Session["UserHasPermissions"] = usuarioConPermisos; // Establecer los permisos en la sesión
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
