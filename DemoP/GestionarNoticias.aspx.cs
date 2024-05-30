using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DemoP
{
    public partial class GestionarNoticias : System.Web.UI.Page
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
            string query = "SELECT * FROM Noticia";

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
            int noticiaID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";
            string query = "DELETE FROM Noticia WHERE ID=@NoticiaID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@NoticiaID", noticiaID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            BindGridView();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int noticiaID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                string titulo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTitulo")).Text;
                string cuerpo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtCuerpo")).Text;
                string fecha = ((Calendar)GridView1.Rows[e.RowIndex].FindControl("calFecha")).SelectedDate.ToString("yyyy-MM-dd");
                string categoria = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlCategoria")).SelectedValue;

                string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";
                string query = "UPDATE Noticia SET Titulo=@Titulo, Cuerpo=@Cuerpo, FechaPublicacion=@Fecha, Categoria=@Categoria WHERE ID=@NoticiaID";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Titulo", titulo);
                        cmd.Parameters.AddWithValue("@Cuerpo", cuerpo);
                        cmd.Parameters.AddWithValue("@Fecha", DateTime.Parse(fecha));
                        cmd.Parameters.AddWithValue("@Categoria", categoria);
                        cmd.Parameters.AddWithValue("@NoticiaID", noticiaID);

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
    }
}
