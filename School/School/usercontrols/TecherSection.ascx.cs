using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
namespace School.usercontrols
{
    public partial class TecherSection : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session["School"] = "10-cp-13";
              
            }
        }

        public void UpdateTeacher()
        {
            SqlDataSource3.DataBind();
            TeacherDropDown.DataBind();
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
        public void UpdateClass()
        {

            SqlDataSource4.DataBind();
            ClassDropDown.DataBind();
        }
        public void UpdateSection()
        {
          
            SqlDataSource2.DataBind();
            SectionDropDown.DataBind();
        }

        public void UpdateCourse()
        {
            SubjectDropDown.DataBind();
           
        }

        protected void UpdateAttendance(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('TAttendance')", true);
            if (Page.IsValid)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox Status = row.FindControl("Status") as CheckBox;
                        bool attendanceStatus = Status.Checked ? true : false;
                        string pKId = (row.FindControl("pKId") as Label).Text.Trim();
                        string sttendenceDate = (this.Date.Text.Trim());
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.TAttendance t1 = new Entities.TAttendance()
                        {
                            pKId = pKId,
                            date = sttendenceDate,
                            attendance = attendanceStatus,
                        };
                        db.InsertTeacherAttendance(t1);

                        AttendanceLabel.Text = "Updated Successfully";
                       
                    }
                }
            }
        }

        protected void AddTeacher(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('TeacherSection')", true);
            if (Page.IsValid)
            {
                Stream str = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(str);
                Byte[] size = br.ReadBytes((int)str.Length);
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.personalInfo t1 = new Entities.personalInfo()
                {
                    pKId = TID.Value,
                    passCode = TPassword.Value,
                    firstName = TFirstName.Value,
                    middleName = TMiddleName.Value,
                    lastName = TLastName.Value,
                    iAm = Session["School"].ToString(),
                    phone = TPhoneNo.Value,
                    emergencyContact = TEmergency.Value,
                    cellNo = TMobNo.Value,
                    eMail = TEmail.Value,
                    enrollmentDate = TEnrollmentDate.Text,
                    dOB = TDateOfBirth.Text,
                    gender = Convert.ToInt32(TGender.SelectedIndex.ToString()),
                    userType = TTypeOfUser.SelectedValue,
                    isNew = IsNew.Checked,
                    isActive = TIsActive.Checked,
                    address1 = TAddress1.Value,
                    address2 = TAddress2.Value,
                    address3 = TAddress3.Value,
                    fileName = Path.GetFileName(FileUpload1.PostedFile.FileName),
                    recordFile = size,
                };
                db.insertTest(t1);
                UpdateTeacher();
                SqlDataSource7.DataBind();
                GridView3.DataBind();
            }
        }

        protected void AssignTeacher(object sender, EventArgs e)
        {

           
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Section s3 = new Entities.Section()
                {
                    sectionName = SectionDropDown.SelectedValue,

                };
                Entities.personalInfo p1 = new Entities.personalInfo()
                {
                    pKId = Session["School"].ToString(),

                };
                Entities.personalInfo p2 = new Entities.personalInfo()
                {
                    pKId = TeacherDropDown.SelectedValue,
                    
                };
                Entities.Class c1 = new Entities.Class()
                {
                    className = ClassDropDown.SelectedValue,

                };
                Entities.Subjects s2 = new Entities.Subjects()
                {
                    subjectName = SubjectDropDown.SelectedValue,

                };


                db.AssignCourses(s3,p1,p2,c1,s2);

                GridView2.DataBind();
                UpdatePanel1.Update();
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AssignCourses')", true);
        }

        protected void GridView2_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('TeacherSection')", true);
            UpdatePanel1.Update();
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('TAttendance')", true);
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowTeachers')", true);
        }

        protected void GridView3_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowTeachers')", true);
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


    }
}