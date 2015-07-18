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
    public partial class attendance : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["School"] = "10-cp-119";
        }

        

        protected void ShowRecords(object sender, EventArgs e)
        {
            GridView2.DataBind();
            UpdatePanel1.Update();
            Button1.Visible = true;
            Panel1.Visible = true;
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('SAttendance')", true);
        }
        protected void UpdateAttendance(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox Status = row.FindControl("Status") as CheckBox;
                    bool attendanceStatus = Status.Checked ? true : false;
                    CheckBox Status1 = row.FindControl("Status1") as CheckBox;
                    bool smiles = Status1.Checked ? true : false;
                    string pKId = (row.FindControl("SchoolID") as Label).Text.Trim();
                    DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                    Entities.Subjects s1 = new Entities.Subjects()
                    {
                        subjectName=DropDownList3.SelectedValue,
                    };
                    Entities.SAttendance s2 = new Entities.SAttendance()
                    {
                        pKId=pKId,
                        Sdate = TextBox1.Text,
                        attendance=attendanceStatus,
                        smilies=smiles,
                    };
                    db.InsertStudentAttendance(s2,s1);
                }
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('SAttendance')", true);
        }
       
    }
}