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
namespace School
{
    public partial class WebForm3 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
        /*    string userType = "teacher";
            DataSet ds = personalInfoDataAccess.personalInfoTeacher(userType);
          //  GridView1.DataSource = ds.Tables["personalInfo"];
           // GridView1.DataBind();
            */
        }
      /*  public class personalInfoDataAccess
        {
            public static DataSet personalInfoTeacher(string userType)
            {
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["school"].ConnectionString))
                {
                    string q1 = "SELECT [pKId], [firstName], [enrollmentDate], [userType] FROM [dbo].[personalInfo] WHERE userType=@userType ";
                    SqlCommand cum = new SqlCommand(q1, con);
                    cum.Parameters.Add("@userType", SqlDbType.NVarChar).Value = userType;
                    cum.CommandType = CommandType.Text;
                    SqlDataAdapter adp = new SqlDataAdapter(cum);
                    adp.Fill(ds, "personalInfo");
                    cum.CommandText = "SELECT * FROM [dbo].[TeacherSubject]";
                    adp.Fill(ds, "TeacherSubject");
                    DataRelation rel = new DataRelation("personalInfoSubject",
                        ds.Tables["personalInfo"].Columns["pKId"],
                        ds.Tables["TeacherSubject"].Columns["pKId"],
                        false);
                    ds.Relations.Add(rel);

                }

                return ds;
            }
            
        }
 */
       

        

      /*  protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int pKId = (int)GridView1.SelectedDataKey.Values[0];
            string userType = "teacher";
            DataSet ds = personalInfoDataAccess.personalInfoTeacher(userType);
            GridView1.DataSource = ds.Tables["personalInfo"];
            DataView view = new DataView(ds.Tables["TeacherSubject"]);
            view.RowFilter = "pKId=" + pKId;
            GridView2.DataSource = view;
            GridView2.DataBind();
            
        } */
    }
}