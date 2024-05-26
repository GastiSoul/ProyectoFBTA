using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Text.RegularExpressions;

namespace DemoP
{
    public partial class ReUsuarios : System.Web.UI.Page
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

        protected void Guardar_Click(object sender, EventArgs e)
        {
            string nombre = nameU.Text;
            string matricula = matriU.Text;
            string email = emailU.Text;
            string contra = contraU.Text;
            bool permiso = permiU.Checked;

            string query = "INSERT INTO Usuarios (Nombre, Matricula, Correo, Contraseña, Permisos) " +
                "VALUES (@Nombre, @Matricula, @Correo, @Contraseña, @Permisos)";

            using (coneccion = new SqlConnection("Data Source=DESKTOP-4VRPQJF;Initial Catalog=Queso;Integrated Security=True"))
            {
                coneccion.Open();

                using (SqlCommand command = new SqlCommand(query, coneccion))
                {
                    command.Parameters.AddWithValue("@Nombre", nombre);
                    command.Parameters.AddWithValue("@Matricula", matricula);
                    command.Parameters.AddWithValue("@Correo", email);
                    command.Parameters.AddWithValue("@Contraseña", contra);
                    command.Parameters.AddWithValue("@Permisos", permiso);

                    if (Regex.IsMatch(matricula, @"^\d+$"))
                    {
                        try
                        {
                            int rowsAffected = command.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "registroExitoso", "alert('Registro exitoso');", true);
                                Response.Redirect("MenuPrincipal.aspx");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "sinFilasInsertadas", "alert('No se insertaron datos en algunas filas');", true);
                            }
                        }
                        catch (Exception ex)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('Error: ID EXISTENTE');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('Error: SOLO SE ACEPTAN NUMEROS EN ID');", true);
                    }
                }
            }
        }
    }
}