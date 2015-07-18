using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School.usercontrols
{
    public partial class ExamDate : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           // Session["School"] = "10-cp-13";
        }

        

        public void UpdateCourse()
        {
            SqlDataSource4.DataBind();
            DropDownList3.DataBind();
        }
        public void UpdateClass()
        {
            SqlDataSource1.DataBind();
            DropDownList1.DataBind();
        }
        public void UpdateSection()
        {
            SqlDataSource3.DataBind();
            DropDownList2.DataBind();
        }

        public void UpdateExam()
        {
            SqlDataSource5.DataBind();
            DropDownList4.DataBind();
        }

        protected void AddExamDate(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ExamDate')", true);
            if (Page.IsValid)
            {

                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.ExamDate cc1 = new Entities.ExamDate()
                {
                    examDate = EDate.Text,
                    totalMarks = Convert.ToInt32(TotalMarks.Value),

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
                Entities.personalInfo p1 = new Entities.personalInfo()
                {
                    pKId = Session["School"].ToString(),

                };

                Entities.ExamType e1 = new Entities.ExamType()
                {
                    examTypeId = DropDownList4.SelectedValue,
                };
                db.AddExamDate(cc1, s2, s1, c1, p1, e1);
                GridView1.DataBind();
                UpdatePanel1.Update();
                
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ExamDate')", true);
            UpdatePanel1.Update();
        }
    }
}