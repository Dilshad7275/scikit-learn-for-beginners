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
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Onlinetest_db;Integrated Security=True;user id=sa;Password=7275");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Statedrop();
                State.SelectedIndex = -1;
                City.SelectedIndex = -1;
                randompass.Visible = false;
            }
        }
        protected void State_SelectedIndexChanged(object sender, EventArgs e)
        {


            int cityid = Convert.ToInt32(State.SelectedValue);
            SqlCommand cmdcity = new SqlCommand("SELECT * FROM Tbl_City WHERE StateId=" + cityid + "", con);
            con.Open();
            City.DataSource = cmdcity.ExecuteReader();
            City.DataTextField = "CityName";
            City.DataValueField = "CityId";
            City.DataBind();
           // City.Items.Insert(0, new ListItem("--Select City--", "0"));
            con.Close();

        }
        protected void Statedrop()
        {
            SqlCommand cmdstate = new SqlCommand("SELECT * FROM Tbl_State", con);
            con.Open();
            State.DataSource = cmdstate.ExecuteReader();
            State.DataTextField = "StateName";
            State.DataValueField = "StateId";
            State.DataBind();
            State.Items.Insert(0, new ListItem("--Select State--", "0"));
            con.Close();

            City.Visible = true;
            
        }
        protected void Registerbtn_Click(object sender, EventArgs e)
        {



            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];

            }
            randompass.Text = "Thanks For Register : Your Generated  Password is <b>" + new string(mypass) + "</b>";

            string filepath = "~/UploadsImg/";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/UploadsImg/" + filename));
            filepath = "~/UploadsImg/" + filename;





            SqlCommand cmd = new SqlCommand("INSERT INTO Tbl_User VALUES(@Name,@FatherName,@State,@City,@Gender,@Image,@Mobile,@Password)", con);
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@FatherName", txtfname.Text);
            cmd.Parameters.AddWithValue("@State", State.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@City", City.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Gender", RadioButtonList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Image", filepath);
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Password", mypass);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


            randompass.Visible = true;
            lnklogin.Visible = true;
        }

        protected void lnklogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}