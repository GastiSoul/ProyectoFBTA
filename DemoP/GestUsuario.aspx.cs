    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data.SqlClient;
    using System.Data;

    namespace DemoP
    {
        public partial class GestUsuario : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    BindGridView();
                }
            }

            private void BindGridView()
            {
                string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";
                string query = "SELECT * FROM Usuarios";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }

            protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                int userID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";
                string query = "DELETE FROM Usuarios WHERE ID=@UserID";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userID);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                BindGridView(); 
            }

            protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
            {
            if (Session["UserID"] != null)
            {
                string currentUserID = Session["UserID"].ToString();

                if (UserHasPermission(currentUserID))
                {
                    GridView1.EditIndex = e.NewEditIndex;
                    BindGridView();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No tienes permisos para editar usuarios.');", true);
                    e.Cancel = true;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

            protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                GridView1.EditIndex = -1;
                BindGridView();
            }

            protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try {
                    int userID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                    TextBox txtNombre = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtNombre");
                    TextBox txtMatricula = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMatricula");
                    TextBox txtCorreo = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCorreo");
                    TextBox txtContraseña = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtContraseña");
                    TextBox txtPermisos = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPermisos");

                    string nombre = txtNombre.Text;
                    string matricula = txtMatricula.Text;
                    string correo = txtCorreo.Text;
                    string contraseña = txtContraseña.Text;
                    string permisos = txtPermisos.Text;

                    string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";
                    string query = "UPDATE Usuarios SET Nombre=@Nombre, Matricula=@Matricula, Correo=@Correo, Contraseña=@Contraseña, Permisos=@Permisos WHERE ID=@UserID";

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Nombre", nombre);
                            cmd.Parameters.AddWithValue("@Matricula", matricula);
                            cmd.Parameters.AddWithValue("@Correo", correo);
                            cmd.Parameters.AddWithValue("@Contraseña", contraseña);
                            cmd.Parameters.AddWithValue("@Permisos", permisos);
                            cmd.Parameters.AddWithValue("@UserID", userID);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }

                    GridView1.EditIndex = -1;
                    BindGridView();
                }
                finally
                {
                    GridView1.EditIndex = -1;
                    BindGridView();
                }
                }

            protected string GetPasswordDisplay(string password)
            {
                return new string('*', password.Length);
            }

        private bool UserHasPermission(string userID)
        {
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