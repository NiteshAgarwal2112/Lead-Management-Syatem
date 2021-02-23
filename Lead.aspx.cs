using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lead : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null || !(Session["Type"].Equals("Admin")))
        {
            Response.Redirect("Login.aspx");
        }
        LibraryDb.SelectCommand = "SELECT * FROM Leads";
    }

   
    protected void LibraryDb_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void SubmitLead_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["App"].ConnectionString);
            SqlCommand cmd = new SqlCommand("insert into Leads(Name,Organization,Email,Phone,SourceLead,CreatDate,InteractionType,DateTime,Details,Empid,LeadScore) values (@name,@org,@email,@phone,@slead,@crdate,@interactiontype,@datetime,@InteractionDetails,@empid,@leadscore)", conn);
            cmd.Parameters.AddWithValue("@name", Name.Text);
            cmd.Parameters.AddWithValue("@org", Organization.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            cmd.Parameters.AddWithValue("@phone", Phone.Text);
            cmd.Parameters.AddWithValue("@slead", SourceLead.Text);
            cmd.Parameters.AddWithValue("@crdate", CreationDate.Text);
            cmd.Parameters.AddWithValue("@interactiontype", InteractionType.Value);
            cmd.Parameters.AddWithValue("@datetime",InteractionTime.Text);
            cmd.Parameters.AddWithValue("@InteractionDetails", InteractionDetails.Value);
            cmd.Parameters.AddWithValue("@empid", DropDownList1.SelectedValue);
            if (InteractionType.Value.Equals("Call"))
                cmd.Parameters.AddWithValue("@leadscore", "Warm");
            else if(InteractionType.Value.Equals("Email"))
                cmd.Parameters.AddWithValue("@leadscore", "Cold");
            else if (InteractionType.Value.Equals("Meeting"))
                cmd.Parameters.AddWithValue("@leadscore", "Hot");
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
               GridView1.DataBind();
               /* FirstName.Text = "";
                LastName.Text = "";
                Email.Text = "";
                Phone.Text = "";
                Empid.Text = "";*/
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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
