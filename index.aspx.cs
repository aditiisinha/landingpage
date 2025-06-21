using System;
using System.Web.UI;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {

        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (AuthenticateUser(username, password))
        {
            Session["Username"] = username;
            Response.Redirect("dashboard.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "error", "alert('Invalid username or password!');", true);
        }
    }

    private bool AuthenticateUser(string username, string password)
    {

        return username == "admin" && password == "password";
    }
}
