using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Data;

namespace _erik.caballeroh.pages
{
    public partial class crud : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        public static string sID = "-1";
        public static string sOpc = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Obtener el id
            if(!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos();
                }

                if (Request.QueryString["op"] != null)
                {
                    sOpc = Request.QueryString["op"].ToString();

                    switch(sOpc)
                    {
                        case "c":
                            this.lbltitulo.Text = "Agregar registro";
                            this.BtnCreate.Visible = true;
                            break;
                        case "r":
                            this.lbltitulo.Text = "Consulta registro";
                            break;
                        case "u":
                            this.lbltitulo.Text = "Modificar registro";
                            this.BtnUpdate.Visible = true;
                            break;
                        case "d":
                            this.lbltitulo.Text = "Eliminar registro";
                            this.BtnDelete.Visible = true;
                            break;

                    }
                }
            }
        }

        void CargarDatos()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("pc_read", con);
            da.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@Id", SqlDbType.Int).Value = sID;
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            DataRow row = dt.Rows[0];
            tbpcnombre.Text = row[1].ToString();
            tbtematica.Text = row[2].ToString();
            tbcpu.Text = row[3].ToString();
            tbgpu.Text = row[4].ToString();
            DateTime d = (DateTime)row[5];
            tbdate.Text = d.ToString("dd/MM/yyyy");
            con.Close();
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("pc_create", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = tbpcnombre.Text;
            cmd.Parameters.Add("@Tematica", SqlDbType.VarChar).Value = tbtematica.Text;
            cmd.Parameters.Add("@Procesador", SqlDbType.VarChar).Value = tbcpu.Text;
            cmd.Parameters.Add("@Grafica", SqlDbType.VarChar).Value = tbgpu.Text;
            cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = tbdate.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("index.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("pc_update", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = sID;
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = tbpcnombre.Text;
            cmd.Parameters.Add("@Tematica", SqlDbType.VarChar).Value = tbtematica.Text;
            cmd.Parameters.Add("@Procesador", SqlDbType.VarChar).Value = tbcpu.Text;
            cmd.Parameters.Add("@Grafica", SqlDbType.VarChar).Value = tbgpu.Text;
            cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = tbdate.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("index.aspx");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("pc_delete", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = sID;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("index.aspx");
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}