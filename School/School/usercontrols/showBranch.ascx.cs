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
    public partial class showBranch : System.Web.UI.UserControl
    {
        
        
        string connectionstrings = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }



        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        /*    if (e.CommandName == "UpdateCampus")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                int Campus = Convert.ToInt32(GridView1.DataKeys[rowindex].Value);
                DBHandler.DBHandler db = new DBHandler.DBHandler(connectionstrings);
                Entities.Campus cc1 = new Entities.Campus()
                {
                    campusId = Campus
                };
                Entities.ZipCodes z1 = new Entities.ZipCodes()
                {

                };
                DataSet ds = new DataSet();
                ds = db.GetCampuses(cc1,z1);

                if (ds != null
                && ds.Tables.Count > 0
                && ds.Tables[0].Rows.Count > 0)
                {
                    UCampusName.Value = ds.Tables[0].Rows[0]["campusName"].ToString();
                    Uaddress.Value = ds.Tables[0].Rows[0]["address"].ToString();
                    UZipCode.Value = ds.Tables[0].Rows[0]["zipCode"].ToString();
                    UPhone1.Value = ds.Tables[0].Rows[0]["phone1"].ToString();
                    UPhone2.Value = ds.Tables[0].Rows[0]["phone2"].ToString();
                    UPhone3.Value = ds.Tables[0].Rows[0]["phone3"].ToString();
                    UPrincipalName.Value = ds.Tables[0].Rows[0]["principal"].ToString();
                    UEmail.Value = ds.Tables[0].Rows[0]["email"].ToString();
                    UCheck.Checked = bool.Parse(ds.Tables[0].Rows[0]["isActive"].ToString());
                    CityName.Value = ds.Tables[0].Rows[0]["cityName"].ToString();
                    
                    Page.ClientScript.RegisterStartupScript(GetType(), "id", "UpdateCampuses()", true);
         
                
                }

            }

            if (e.CommandName == "DeleteCampus")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                del = Convert.ToInt32(GridView1.DataKeys[rowindex].Value);
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "ConfirmDelete()", true);
            } */
        }
        protected void UpdateBranch(object sender, EventArgs e)
        {

        }

        protected void DeleteBranch(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowBraches')", true);
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowBraches')", true);

        }

    }
}
