using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AssignLead : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null || !(Session["Type"].Equals("Sale")))
        {
            Response.Redirect("Login.aspx");
        }
        SqlDataSource1.SelectCommand = "SELECT Leadid, Name, Email, Organization, Phone, Details, LeadScore FROM Leads where Empid=" + "'"+Session["id"].ToString()+"'";
    }
 protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
