using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace pruebalogin2
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Este método se ejecuta cada vez que se carga la página.
            // Puedes realizar cualquier inicialización necesaria aquí.
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // Validación de entrada: asegúrate de que se hayan ingresado valores de usuario y contraseña.
            if (string.IsNullOrEmpty(TxtUser.Text) || string.IsNullOrEmpty(TxtPassword.Text))
            {
                Response.Write("Por favor, ingresa un usuario y una contraseña válidos.");
                return;
            }

            try
            {
                // Cadena de conexión a la base de datos SQL Server
                string connectionString = "Server=Localhost;Database=Queso;Trusted_Connection=True;";


                // Consulta SQL para verificar las credenciales del usuario
                string query = "SELECT COUNT(*) FROM Usuarios WHERE Correo=@Correo AND Contraseña=@Contraseña";

                // Crear una conexión SQL
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Crear un comando SQL
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Establecer los parámetros de la consulta SQL (evita la inyección SQL)
                        cmd.Parameters.AddWithValue("@Correo", TxtUser.Text);
                        cmd.Parameters.AddWithValue("@Contraseña", TxtPassword.Text);

                        // Abrir la conexión a la base de datos
                        con.Open();

                        // Ejecutar la consulta SQL y obtener el resultado
                        int count = (int)cmd.ExecuteScalar();

                        // Verificar si se encontró un usuario válido
                        if (count == 0)
                        {
                            // Usuario no válido
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
                // Manejo de errores: muestra el mensaje de error
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
