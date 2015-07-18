using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

namespace School.usercontrols
{
    public partial class AddClassSection : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        TecherSection teach = new TecherSection();
        ExamDate exam = new ExamDate();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            SqlDataSource3.DeleteCommand = " ";
            
        }

        protected void ClassAndSection(object sender, EventArgs e)
        {
            
            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.CampusClassSection t1 = new Entities.CampusClassSection()
            {
                className = ClassDropDown.SelectedValue,
                sectionName = SectionDropDown.SelectedValue,
            };
            Entities.personalInfo p1 = new Entities.personalInfo()
            {
                pKId = Session["School"].ToString(),
            };
            db.InsertCampusClassSection(t1, p1);
            ClassSectionLabel.Text = "Added Successfully";
            GridView1.DataBind();
            UpdatePanel1.Update();
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ClassAndSection')", true);
        }

        public void UpdateClass()
        {
            ClassDropDown.DataBind();
        }
        public void UpdateSection()
        {
            SectionDropDown.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "ConfirmDelete()", true);
            }

        }

        protected void Delete(object sender, EventArgs e)
        {

        }


        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ClassAndSection')", true);
        }

    }
}