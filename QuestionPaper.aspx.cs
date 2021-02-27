using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Online_Examination_System
{
    public partial class QuestionPaper : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Onlinetest_db;" +
              "Integrated Security=True;user id=sa;Password=7275");
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["Timer"] = DateTime.Now.AddMinutes(10).ToString();
                Fillnewquestion();

            }
            else
            {
                // sameQuestion();
            }
        }

        private void Fillnewquestion()
        {
            int examid=Convert.ToInt32(Request.QueryString["Examid"]);
            string query = "SELECT QuestionId,Question,Option1,Option2,Option3,Option4,CorrectAnswer FROM Tbl_QuestionPaper where 1=1";
            if (ViewState["LastQuestionId"] != null)
            {
                int QuestionId = Convert.ToInt32(ViewState["LastQuestionId"]) + 1;
                query += " AND QuestionId=" + QuestionId + "";
            }
            query += "AND ExamId="+examid+" ORDER BY QuestionId";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt != null)
            {
                if (Convert.ToInt32(ViewState["LastQuestionId"]) < GetMaxId())
                {
                    ViewState["LastQuestionId"] = dt.Rows[0]["QuestionId"].ToString();
                    ViewState["CorrectAnswer"] = dt.Rows[0]["CorrectAnswer"].ToString().Trim();
                    lblqstnid.Text = dt.Rows[0]["QuestionId"].ToString();
                    lblques.Text = dt.Rows[0]["Question"].ToString();
                    rbnans1.Text = dt.Rows[0]["Option1"].ToString();
                    rbnans2.Text = dt.Rows[0]["Option2"].ToString();
                    rbnans3.Text = dt.Rows[0]["Option3"].ToString();
                    rbnans4.Text = dt.Rows[0]["Option4"].ToString();
                }
                else
                {
                    divQuestionPaper.Visible = false;
                    Button1.Visible = true;
                }
            }
        }
        private int GetMaxId()
        {
            int examid = Convert.ToInt32(Request.QueryString["Examid"]);
            string query = "SELECT max(QuestionId) FROM Tbl_QuestionPaper WHERE ExamId="+examid+"";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int maxid = Convert.ToInt32(dt.Rows[0][0]);
            return maxid;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            if ((rbnans1.Checked == false) && (rbnans2.Checked == false) && (rbnans3.Checked == false) && (rbnans4.Checked == false))
            {
                Response.Write("<script>alert('You have not selected any option');</script>");

            }
            else
            {

                string SubmittedAnswer = "";
                if (rbnans1.Checked == true)
                {
                    SubmittedAnswer = rbnans1.Text;
                }
                else if (rbnans2.Checked == true)
                {
                    SubmittedAnswer = rbnans2.Text;
                }
                else if (rbnans3.Checked == true)
                {
                    SubmittedAnswer = rbnans3.Text;
                }
                else if (rbnans4.Checked == true)
                {
                    SubmittedAnswer = rbnans4.Text;
                }
                int Marks = 0;

                if (ViewState["CorrectAnswer"].ToString() == SubmittedAnswer.Trim())
                {
                    Marks = 10;
                }
                string mobileno = Request.QueryString["user"].ToString();
                int examid = Convert.ToInt32(Request.QueryString["Examid"]);
                string date =(DateTime.Now).ToString("d");
                string query = "INSERT INTO dbo.Tbl_Result (UserId, Answer, Marks,ExamId,Date) VALUES ('" + mobileno + "', '" + SubmittedAnswer + "', '" + Marks + "','"+examid+"','"+date+"')";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                int z = cmd.ExecuteNonQuery();
                con.Close();
                if (z > 0)
                {
                    rbnans1.Checked = false;
                    rbnans2.Checked = false;
                    rbnans3.Checked = false;
                    rbnans4.Checked = false;
                    Fillnewquestion();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Marks();
        }
        protected void Marks()
        {
            string mobileno = Request.QueryString["user"].ToString();
            int examid = Convert.ToInt32(Request.QueryString["Examid"]);
            con.Open();
            SqlCommand cmd = new SqlCommand("select Sum(Marks) as YourMarks, (count(QuestionId)*10) as TotalMarks from Tbl_Result WHERE UserId='" + mobileno + "'", con);
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                GridResult.DataSource = dr;
                GridResult.DataBind();
            }
        }
        protected void timer_Tick(object sender, EventArgs e)
        {
            if (DateTime.Compare(DateTime.Now, DateTime.Parse(Session["Timer"].ToString())) < 0)
            {
                timermsg.Text = "Time Left : " + ((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString()
                    + " Minutes : " + (((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalSeconds) % 60).ToString() + " Seconds";
            }
            else
            {
                Response.Write("<script>alert('Time Expired');</script>");
            }
        }

        protected void btnskip_Click(object sender, EventArgs e)
        {
            
            int marks = 0;
            string mobileno = Request.QueryString["user"].ToString();
            string queryskip = "INSERT INTO dbo.Tbl_Result (UserId, Marks) VALUES ('" + mobileno + "', " + marks + ")";
            SqlCommand cmdskip = new SqlCommand(queryskip, con);
            con.Open();
            int z = cmdskip.ExecuteNonQuery();
            con.Close();
            if (z > 0)
            {
                rbnans1.Checked = false;
                rbnans2.Checked = false;
                rbnans3.Checked = false;
                rbnans4.Checked = false;
                Fillnewquestion();
            }
        }
    }
}

