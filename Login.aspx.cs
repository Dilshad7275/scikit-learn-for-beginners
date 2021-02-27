using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Online_Examination_System
{
    public partial class Login : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Onlinetest_db;Integrated Security=True;user id=sa;Password=7275");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Tbl_User WHERE Mobile='" + txtmobile.Text + "' AND Password='" + txtpass.Text + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                                       
                    if ((txtmobile.Text == "Admin") && (txtpass.Text == "Admin"))
                    {
                        Response.Redirect("~/Admin.aspx");
                    }
                    else
                    {
                        string mobile = txtmobile.Text;
                        Response.Redirect("~/UserDashboard.aspx?MobileNo=" + mobile + "");
                    }
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials');</script>");
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx/");
        }
    }
}