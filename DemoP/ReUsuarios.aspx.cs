using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace DemoP
{
    public partial class ReUsuarios : System.Web.UI.Page
    {
        protected void Guardar_Click(object sender, EventArgs e)
        {
            string nombre = nameU.Text;
            string matricula = matriU.Text;
            string email = emailU.Text;
            string contra = contraU.Text;
            bool permiso = permiU.Checked;

            string query = "INSERT INTO Usuarios (Nombre, Matricula, Correo, Contraseña, Permisos) " +
                           "VALUES (@Nombre, @Matricula, @Correo, @Contraseña, @Permisos)";

            string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Nombre", nombre);
                    command.Parameters.AddWithValue("@Matricula", matricula);
                    command.Parameters.AddWithValue("@Correo", email);
                    command.Parameters.AddWithValue("@Contraseña", contra);
                    command.Parameters.AddWithValue("@Permisos", permiso);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "registroExitoso", "alert('Registro exitoso');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "sinFilasInsertadas", "alert('No se insertaron datos en algunas filas');", true);
                        }
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627) // Error de clave duplicada
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('Error: ID EXISTENTE');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
                        }
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }
    }
}
