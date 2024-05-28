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
                string titulo = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                string fecha = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

                string connectionString = "Data Source=localhost;Initial Catalog=Queso;Integrated Security=True";
                string query = "UPDATE Noticia SET Titulo=@Titulo, FechaPublicacion=@Fecha WHERE ID=@NoticiaID";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Titulo", titulo);
                        cmd.Parameters.AddWithValue("@FechaPublicacion", DateTime.Parse(fecha));
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
