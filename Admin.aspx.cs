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
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Onlinetest_db;Integrated Security=True;user id=sa;Password=7275");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            string query = "SELECT * FROM Tbl_Exam ";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            ddlexamid.DataSource = cmd.ExecuteReader();
            ddlexamid.DataTextField = "Exam";
            ddlexamid.DataValueField = "ExamId";
            ddlexamid.DataBind();
                ddlexamid.Items.Insert(0, new ListItem("--Select Exam--", "0"));
            con.Close();
            }
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {          
            string queryinsert = "INSERT INTO dbo.Tbl_QuestionPaper (ExamId,Question, Option1, Option2, Option3, Option4, CorrectAnswer)VALUES('"+ddlexamid.SelectedItem.Value+"','"+txtQuestion.Text+ "', '" + txtopt1.Text + "','" + txtopt2.Text + "','" + txtopt3.Text + "','" + txtopt4.Text + "','" + txtCorrectAnswer.Text + "')";
            SqlCommand cmd = new SqlCommand(queryinsert,con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ddlexamid.ClearSelection();
            txtQuestion.Text = "";
            txtopt1.Text = "";
            txtopt2.Text = "";
            txtopt3.Text = "";
            txtopt4.Text = "";
            txtCorrectAnswer.Text = "";
        }
    }
}