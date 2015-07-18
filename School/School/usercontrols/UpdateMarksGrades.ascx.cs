using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace School.usercontrols
{
    public partial class UpdateMarksGrades : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           // Session["School"] = "10-cp-119";
           
        }

        protected void ShowRecords(object sender, EventArgs e)
        {
            
           SqlDataSource8.DataBind();
            GridView2.DataBind();
            UpdatePanel1.Update();
            Button1.Visible = true;
            Panel1.Visible = true;
            DropDownList4.Visible = true;
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('UpdateMarks')", true);
            
            
        }

        protected void ShowRecords2(object sender, EventArgs e)
        {

            SqlDataSource10.DataBind();
            GridView1.DataBind();
            UpdatePanel2.Update();
            Button3.Visible = true;
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('UpdateGrade')", true);
        }
        
        protected void UpdateMarks(object sender, EventArgs e)
        {
            
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox Status = row.FindControl("Status") as CheckBox;
                    bool IsPresent = Status.Checked ? true : false;
                    string Marks = (row.FindControl("Marks") as TextBox).Text.Trim();
                    string SchoolID = (row.FindControl("SchoolID") as Label).Text.Trim();
                    string StudentName = (row.FindControl("StudentName") as Label).Text.Trim();
                    DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                    Entities.StudentExam s1 = new Entities.StudentExam()
                    {
                        pKId = SchoolID,
                        examDate = DropDownList4.SelectedValue,
                        isPresent = IsPresent,
                        obtainedMarks = Convert.ToDecimal(Marks),
                        subjectName=DropDownList3.SelectedValue,
                    };
                    db.AddStudentExam(s1);
                }
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('UpdateMarks')", true);
           
        }

        protected void UpdateGrades(object sender, EventArgs e)
        {

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string Marks = (row.FindControl("Grade") as TextBox).Text.Trim();
                    string SchoolID = (row.FindControl("SchoolID") as Label).Text.Trim();
                    string StudentName = (row.FindControl("StudentName") as Label).Text.Trim();
                    DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                    Entities.StudentSubject s1 = new Entities.StudentSubject()
                    {
                        pKId = SchoolID,
                        grade = Marks,
                        subjectName=DropDownList7.SelectedValue,
                    };
                    db.InsertStudentGrade(s1);
                }
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('UpdateGrade')", true);

        }
        
    }
}