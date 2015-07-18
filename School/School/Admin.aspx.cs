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
    public partial class Class : System.Web.UI.Page
    {
        public string label;
        public static int surveyid;
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                
            }
           
        }

        protected void AddBranch(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('foo')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Campus c1 = new Entities.Campus()
                {
                    campusName = CampusName.Value,
                    address = address.Value,
                    zipCode = Convert.ToInt32(ZipCode.Value.ToString()),
                    phone1 = Phone1.Value,
                    phone2 = Phone2.Value,
                    phone3 = Phone3.Value,
                    principal = PrincipalName.Value,
                    email = CEmail.Value,
                    isActive = CCheck.Checked,
                };
                Entities.ZipCodes z1 = new Entities.ZipCodes()
                {
                    zipCode = Convert.ToInt32(ZipCode.Value.ToString()),
                    cityName = CityName.Value,
                };
                db.InsertBranch(c1, z1);
                Clabel.Text = "Campus Added Successfully";
            }
        }
        protected void AdminAssign(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('admin')", true);
            if (Page.IsValid)
            {
                Stream str = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(str);
                Byte[] size = br.ReadBytes((int)str.Length);
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.personalInfo t1 = new Entities.personalInfo()
                   {
                       pKId = AID.Value,
                       firstName = AFirstName.Value,
                       middleName = AMiddleName.Value,
                       lastName = ALastName.Value,
                       iAm = Session["School"].ToString(),
                       phone = APhoneNo.Value,
                       emergencyContact = AEmergency.Value,
                       cellNo = AMobNo.Value,
                       eMail = AEmail.Value,
                       enrollmentDate = AEnrollmentDate.Text,
                       dOB = ADateOfBirth.Text,
                       gender = Convert.ToInt32(DropDownList2.SelectedIndex.ToString()),
                       userType = DropDownList1.SelectedValue,
                       isActive = IsActive.Checked,
                       isNew = IsNew.Checked,
                       passCode = APassword.Value,
                       address1 = AAdress1.Value,
                       address2 = AAdress2.Value,
                       address3 = AAdress3.Value,
                       fileName = Path.GetFileName(FileUpload1.PostedFile.FileName),
                       recordFile = size,
                   };
                db.insertTest(t1);
                SqlDataSource4.DataBind();
                GridView3.DataBind();
            }
        }
        
        protected void AddClass(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AddClasses')", true);
            if (Page.IsValid)
            {

                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Class t1 = new Entities.Class()
                {
                    classId = ClassId.Value,
                    className = ClassName.Value,
                };
                db.InsertClass(t1);
                SClasses.DataBind();
                GClasses.DataBind();
                UpdatePanel2.Update();
                AddClassSection1.UpdateClass();
                TecherSection1.UpdateClass();
                StudentSection1.UpdateClass();
                ExamDate1.UpdateClass();
                ClassLabel.Text = "Class Added Successfully";
                

            }
        }

        protected void AddSection(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AddSections')", true);
            if (Page.IsValid)
            {

                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Section t1 = new Entities.Section()
                {
                    sectionName = SectionName.Value,
                };
                db.InsertSection(t1);
                SSections.DataBind();
                GSections.DataBind();
                UpdatePanel3.Update();
                AddClassSection1.UpdateSection();
                TecherSection1.UpdateSection();
                StudentSection1.UpdateSection();
                ExamDate1.UpdateSection();
                SectionLabel.Text = "Section Added Successfully";
               
            }
        }

        protected void AddExam(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ExamType')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.ExamType e1 = new Entities.ExamType()
                {
                    examTypeId = ExamID.Value,
                    examType = ExamName.Value,
                };
                db.AddExamypes(e1);
                GridView1.DataBind();
                UpdatePanel1.Update();
                ExamDate1.UpdateExam();
                
            }
        }
      
        protected void AddCourse(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('Courses')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Subjects t1 = new Entities.Subjects()
                {
                    subjectId = CourseId.Value,
                    subjectName = CourseName.Value,

                };
                db.AddCourse(t1);
                GridView2.DataBind();
                UpdatePanel4.Update();
                TecherSection1.UpdateCourse();
                ExamDate1.UpdateCourse();

            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "ConfirmDelete()", true);
            }
        }
        protected void Edit(object sender, EventArgs e)
        {


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GClasses_PageIndexChanged1(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AddClasses')", true);
            UpdatePanel2.Update();
        }

        protected void GSections_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AddSections')", true);
            UpdatePanel3.Update();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ExamType')", true);
            UpdatePanel1.Update();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('Courses')", true);
            UpdatePanel4.Update();
        }

        protected void GridView3_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowAdmins')", true);
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowAdmins')", true);
        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            DetailsView gvrow = lnkbtn.NamingContainer as DetailsView;
            string fileid = DetailsView1.DataKey[gvrow.DataItemIndex].ToString();
            using (SqlConnection con1 = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select [fileName], [recordFile] from [dbo].[PersonalInfo] where [pKId]=@pKId";
                    cmd.Parameters.AddWithValue("@pKId", fileid);
                    cmd.Connection = con1;
                    con1.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        // Response.ContentType = dr["FileType"].ToString();
                        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + dr["FileName"] + "\"");
                        Response.BinaryWrite((byte[])dr["recordFile"]);
                        Response.End();
                    }
                }
            }
        }

        protected void AddNote(object sender, EventArgs e)
        {

        }
      
    }
}