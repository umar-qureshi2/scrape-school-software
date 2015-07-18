using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace School
{
    public partial class test : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["School"] = "10-cp-119";
          //  Page.ClientScript.RegisterStartupScript(GetType(), "id", "progress(80, $('#progressBar'))", true);
        }
        protected void ADDEvaluation(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('Evaluation')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Recommendations r1 = new Entities.Recommendations()
                    {
                        studentId=EDropDown.SelectedValue,
                        teacher = Session["School"].ToString(),
                        Adate = DateTime.Now.ToShortDateString(),
                        appitude=EAptitude.Value,
                        attitude=EAttitude.Value,
                        recommendation=ERecommendation.Value,
                    };
                db.AddEvaluation(r1);
                Label1.Text = "Student Evaluated Successfully";
            }
        }
        protected void AssignHomeWork(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AssignHomeWork')", true);
            if (Page.IsValid)
            {
                Stream str = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(str);
                Byte[] size = br.ReadBytes((int)str.Length);
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Notes n1 = new Entities.Notes()
                {
                    teacher = Session["School"].ToString(),
                    date = DateTime.Now.ToShortDateString(),
                    fileName = Path.GetFileName(FileUpload1.PostedFile.FileName),
                    dataFile = size,
                    description = TextArea1.Value,
                    noteType = "Assignment",

                };
                Entities.Section s1 = new Entities.Section()
                {
                    sectionName = DropDownList2.SelectedValue,

                };
                Entities.Class c1 = new Entities.Class()
                {
                    className = DropDownList1.SelectedValue,

                };
                Entities.Subjects s2 = new Entities.Subjects()
                {
                    subjectName = DropDownList3.SelectedValue,

                };

                db.AddNotes(n1, s2, s1, c1);
                TextArea1.Value = " ";


            }
        }

        protected void AssignTest(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('UpcomingTest')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Notes n1 = new Entities.Notes()
                {
                    teacher = Session["School"].ToString(),
                    date = DateTime.Now.ToShortDateString(),
                    description = TextArea2.Value,
                    noteType = "Quiz",

                };
                Entities.Section s1 = new Entities.Section()
                {
                    sectionName = DropDownList5.SelectedValue,

                };
                Entities.Class c1 = new Entities.Class()
                {
                    className = DropDownList4.SelectedValue,

                };
                Entities.Subjects s2 = new Entities.Subjects()
                {
                    subjectName = DropDownList6.SelectedValue,

                };

                db.AddNotes(n1, s2, s1, c1);
                TextArea2.Value = " ";

            }
        }

        protected void UpdateCoursePlan(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('CourseProgress')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.CoursePlan cc1 = new Entities.CoursePlan()
                {
                    year = DateTime.Now.Year.ToString(),
                    Goal = Goal.Value,
                    progressId = DropDownList7.SelectedIndex + 1,

                };
                Entities.Section s1 = new Entities.Section()
                {
                    sectionName = DropDownList10.SelectedValue,

                };
                Entities.Class c1 = new Entities.Class()
                {
                    className = DropDownList8.SelectedValue,

                };
                Entities.Subjects s2 = new Entities.Subjects()
                {
                    subjectName = DropDownList9.SelectedValue,

                };
                Entities.personalInfo p1 = new Entities.personalInfo()
                {
                    pKId = Session["School"].ToString(),

                };

                db.CoursePlan(cc1, s2, s1, c1, p1);


            }
        }
        
    }
}