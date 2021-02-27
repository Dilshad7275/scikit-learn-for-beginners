using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Online_Examination_System
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Onlinetest_db;Integrated Security=True;user id=sa;Password=7275");
        protected void Page_Load(object sender, EventArgs e)
        {
            string mobileno = Request.QueryString["MobileNo"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT Name FROM Tbl_User WHERE Mobile='" + mobileno + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblnameshow.Text = dr.GetValue(0).ToString(); 
                   
                }

            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mobileno = Request.QueryString["MobileNo"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Tbl_User WHERE Mobile='" + mobileno + "'", con);
            con.Open();
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridProfile.DataSource = dt;
            GridProfile.DataBind();
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lnktable.Visible = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)//asp.net
        {
            string mobileno = Request.QueryString["MobileNo"].ToString();
            Response.Redirect("~/QuestionPaper.aspx?user=" + mobileno + "&Examid=" + 1 + "");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)//asp.net core
        {
            string mobileno = Request.QueryString["MobileNo"].ToString();
            Response.Redirect("~/QuestionPaper.aspx?user=" + mobileno + "&Examid="+2+"");
        }      
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            string mobileno = Request.QueryString["MobileNo"].ToString();
            Response.Redirect("~/QuestionPaper.aspx?user=" + mobileno + "&Examid=" + 3 + "");
        }
        protected void btnMarks_Click(object sender, EventArgs e)
        {
            btnusermarks.Visible = true;
        }

        protected void btnaspnet_Click(object sender, EventArgs e)
        {
            divgridmarks.Visible = true;
            string mobileno = Request.QueryString["MobileNo"].ToString();
            //int examid = Convert.ToInt32(Request.QueryString["MobileNo"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT [Date], Sum(Marks) as YourMarks, (count(QuestionId)*10) as TotalMarks from Tbl_Result WHERE UserId='" + mobileno + "' AND ExamId="+1+" GROUP BY[Date] ", con);

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                gridviewmarks.DataSource = dr;
                gridviewmarks.DataBind();
            }

        }

        protected void btncore_Click(object sender, EventArgs e)
        {
            divgridmarks.Visible = true;
            string mobileno = Request.QueryString["MobileNo"].ToString();
            //int examid = Convert.ToInt32(Request.QueryString["MobileNo"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT [Date], Sum(Marks) as YourMarks, (count(QuestionId)*10) as TotalMarks from Tbl_Result WHERE UserId='" + mobileno + "' AND ExamId=" + 2 + " GROUP BY[Date] ", con);
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                gridviewmarks.DataSource = dr;
                gridviewmarks.DataBind();
            }
        }

        protected void btnphp_Click(object sender, EventArgs e)
        {
            divgridmarks.Visible = true;
            string mobileno = Request.QueryString["MobileNo"].ToString();
            //int examid = Convert.ToInt32(Request.QueryString["MobileNo"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT [Date], Sum(Marks) as YourMarks, (count(QuestionId)*10) as TotalMarks from Tbl_Result WHERE UserId='" + mobileno + "' AND ExamId=" + 3 + " GROUP BY[Date] ", con);
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                gridviewmarks.DataSource = dr;
                gridviewmarks.DataBind();
            }
        }
    }
}