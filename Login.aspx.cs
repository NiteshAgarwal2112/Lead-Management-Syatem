using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Request.Cookies.Remove("user");
            Session.RemoveAll();

        }
        catch (Exception)
        {


        }

    }
    protected void Logbutton_Click(object sender, EventArgs e)
    {

        if (uname.Value.ToUpper() == "ADMIN" && psw.Value.ToUpper() == "ADMIN@123")
        {
            Session["id"] = "1";
            Session["Type"] = "Admin";
            Session["Name"] = "Admin";
            Session["IsAuth"] = "true";
            Response.Redirect("Home.aspx");
        }
        else
        {
            LoginDetails log = ValidateUser(uname.Value, psw.Value);
            if (log.IsAuthUser)
            {
                Session["id"] = log.UserId;
                Session["Name"] = log.UserName;
                Session["IsAuth"] = log.IsAuthUser;
                Session["Type"] = log.Role;
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }

    private LoginDetails ValidateUser(string username, string password)
    {
        LoginDetails obj = new LoginDetails();
        obj.IsAuthUser = false;
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["App"].ConnectionString);
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string query = "select * from Account where FirstName='" + username.Trim() + "' and Empid='" + password.Trim() + "'";
            da = new SqlDataAdapter(query, con);
            con.Open();
            da.Fill(ds);
           // Console.WriteLine(ds.Tables[0].Rows.Count);
            if (ds.Tables[0].Rows.Count > 0)
            {
                obj.IsAuthUser = true;
                obj.UserName = ds.Tables[0].Rows[0]["FirstName"].ToString();
                obj.UserId = ds.Tables[0].Rows[0]["Empid"].ToString();
                obj.Role = ds.Tables[0].Rows[0]["Type"].ToString();
            }
        }
        catch (Exception ex)
        {
            obj.IsAuthUser = false;
            Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
        }
        return obj;

    }

    private struct LoginDetails
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Role { get; set; }
        public bool IsAuthUser { get; set; }
    }

    
}