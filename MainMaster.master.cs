using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMaster : System.Web.UI.MasterPage
{
    public string myrole = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        try
        {
            if (Convert.ToBoolean(Session["IsAuth"]))
            {
                switch (Session["Type"].ToString())
                {
                    case "Sale":
                        myrole = "<ul class='nav navbar-nav' id='mUser'><li><a href='Home.aspx'>Home</a></li><li><a href='AssignLead.aspx'>Assigned Leads</a></li></ul>";
                        break;
                    case "Admin":
                        myrole = "<ul class='nav navbar-nav' id='mAdmin'><li><a href='Home.aspx'>Home</a></li><li><a href='sales.aspx'>Sales</a></li><li><a href='lead.aspx'>Lead</a></li></ul>";
                        break;
               
                }
            }
        }
        catch (Exception EX)
        {
            Response.Write("<script>alert('" + EX.Message.Replace("\'", " ") + "')</script>");
            Response.Redirect("Login.aspx");
        }

    }
}
