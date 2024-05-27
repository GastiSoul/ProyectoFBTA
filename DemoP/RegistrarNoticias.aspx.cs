using System;
using System.Data.SqlClient;

namespace DemoP
{
    public partial class RegistrarNoticias : System.Web.UI.Page
    {
        SqlConnection conexion;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            string titulo = tituloU.Text;
            string autor = autorU.Text;
            string cuerpo = cuerpoU.Text;
            string fecha = fechaU.Text;
            string categoria = categoriaU.SelectedValue;
            string imagen = imagenU.Text;

            string query = "INSERT INTO Noticia (Titulo, Autor, Cuerpo, FechaPublicacion, Categoria, Imagen) " +
                "VALUES ( @Titulo, @Autor, @Cuerpo, @FechaPublicacion, @Categoria, @Imagen)";

            using (conexion = new SqlConnection("Data Source=localhost;Initial Catalog=Queso;Integrated Security=True"))
            {
                conexion.Open();

                using (SqlCommand command = new SqlCommand(query, conexion))
                {
                    command.Parameters.AddWithValue("@Titulo", titulo);
                    command.Parameters.AddWithValue("@Autor", autor);
                    command.Parameters.AddWithValue("@Cuerpo", cuerpo);
                    command.Parameters.AddWithValue("@FechaPublicacion", fecha);
                    command.Parameters.AddWithValue("@Categoria", categoria);
                    command.Parameters.AddWithValue("@Imagen", imagen);

                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "registroExitoso", "alert('Registro exitoso');", true);
                            Response.Redirect("GestionarNoticias.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "sinFilasInsertadas", "alert('No se insertaron datos en algunas filas');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
                    }
                }
            }
        }
    }
}
