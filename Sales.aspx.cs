using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Sales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null || !(Session["Type"].Equals("Admin")))
        {
            Response.Redirect("Login.aspx");
        }
        LibraryDb.SelectCommand = "SELECT * FROM Account where Type='Sale'";

    }
    protected void LibraryDb_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Submitsale_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["App"].ConnectionString);
            SqlCommand cmd = new SqlCommand("insert into Account (FirstName,LastName,Email,Phone,Empid,Type) values (@fname,@lname,@email,@phone,@empid,@role)", conn);
            cmd.Parameters.AddWithValue("@fname", FirstName.Text);
            cmd.Parameters.AddWithValue("@lname", LastName.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            cmd.Parameters.AddWithValue("@phone", Phone.Text);
            cmd.Parameters.AddWithValue("@empid", Empid.Text);
            cmd.Parameters.AddWithValue("@role", "Sale");
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                FirstName.Text="";
                LastName.Text= "";
                Email.Text= "";
                Phone.Text= "";
                Empid.Text= "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
            }
            finally
            {
                conn.Close();
            }

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
        }
    }
}