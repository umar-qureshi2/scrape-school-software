using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace School
{
    public partial class GetGraph : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        string chartData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Details();
        }

        private void Details()
        {
            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.StudentExam t1 = new Entities.StudentExam()
            {
                pKId = Session["School"].ToString(),
            };
            Entities.Class c1 = new Entities.Class()
            {
                className = "Class 5",
            };
            Entities.ExamType e1 = new Entities.ExamType()
            {
                examType = "Mid term",
            };
            DataSet ds = new DataSet();
            ds = db.Graph(t1, c1, e1);

            if (ds != null
            && ds.Tables.Count > 0
            && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string sub;
                    string per;
                    sub = ds.Tables[0].Rows[i]["subjectName"].ToString();
                    per = ds.Tables[0].Rows[i]["Percentage"].ToString();
                    chartData = chartData + sub + "-" + per + "$";
                    
                }
                Response.Write(chartData);
            }
            


        }

    }
}