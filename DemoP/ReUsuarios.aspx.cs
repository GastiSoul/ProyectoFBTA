using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DemoP
{
    public partial class ReUsuarios : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!UserHasPermission())
            {
                Response.Redirect("MenuPrincipal.aspx"); 
            }
        }
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
                        if (ex.Number == 2627) 
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

        protected void VolverAlMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuPrincipal.aspx"); 
        }

        private bool UserHasPermission()
        {
            string userID = Session["UserID"] as string;
            bool hasPermission = false;
            string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Permisos FROM Usuarios WHERE ID = @UserID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserID", userID);

                try
                {
                    connection.Open();
                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        hasPermission = Convert.ToBoolean(result);
                    }
                    else
                    {
                        Console.WriteLine("No se encontró el permiso para el usuario con ID: " + userID);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error al verificar los permisos: " + ex.Message);
                }
            }

            return hasPermission;
        }
    }
}
