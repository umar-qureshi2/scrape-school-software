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
    public partial class StudentSection : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["School"] = "10-cp-13";
       //     this.Details();
            
        }

     /*   private void Details()
        {
             DBHandler.DBHandler db = new DBHandler.DBHandler(con);
             Entities.personalInfo t1 = new Entities.personalInfo()
             {
                 pKId = Session["School"].ToString(),
             };
             DataSet ds = new DataSet();
             ds = db.ShowStudentClass(t1);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            UpdatePanel1.Update();
        } */

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


        protected void AddStudent(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('StudentSection')", true);
            if (Page.IsValid)
            {
                Stream str = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(str);
                Byte[] size = br.ReadBytes((int)str.Length);
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.personalInfo t1 = new Entities.personalInfo()
                {
                    pKId = SID.Value,
                    passCode = SPassword.Value,
                    firstName = SFirstName.Value,
                    middleName = SMiddleName.Value,
                    lastName = SLastName.Value,
                    phone = SPhoneNo.Value,
                    cellNo = SMobNo.Value,
                    emergencyContact = SEmergency.Value,
                    iAm = Session["School"].ToString(),
                    eMail = SEmail.Value,
                    enrollmentDate = SEnrollmentDate.Text,
                    dOB = SDateOfBirth.Text,
                    gender = Convert.ToInt32(SGender.SelectedIndex.ToString()),
                    userType = STypeOfUser.SelectedValue,
                    isActive = SIsActive.Checked,
                    isNew = IsNew.Checked,
                    address1 = SAddress1.Value,
                    address2 = SAddress2.Value,
                    address3 = SAddress3.Value,
                    fileName = Path.GetFileName(FileUpload1.PostedFile.FileName),
                    recordFile = size,
                };
                db.insertTest(t1);
                Label2.Text = "Added Successfully";
                SqlDataSource4.DataBind();
                GridView3.DataBind();
            }
        }

        protected void AssignStudent(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AssignStudentClass')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.personalInfo t1 = new Entities.personalInfo()
                {
                    pKId = Session["School"].ToString(),
                };
                Entities.StudentSubject t2 = new Entities.StudentSubject()
                {
                    pKId = SchoolID.Value,
                    year=Year.Text,
                };
                Entities.Class c1 = new Entities.Class()
                {
                    className = DropDownList1.SelectedValue,
                };
                Entities.Section s1 = new Entities.Section()
                {
                    sectionName = DropDownList2.SelectedValue,
                };
                db.AssignStudentClass(t1, t2, c1, s1);
                SqlDataSource6.DataBind();
                GridView1.DataBind();
            }
        }

        protected void Promotions(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('AssignStudentClass')", true);
            UpdatePanel1.Update();
        }

        protected void GridView3_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowStudents')", true);
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowStudents')", true);
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