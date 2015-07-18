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

namespace School
{
    public partial class Login : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        string usertype;
        string passcode;
        string session;
        string data;
        string data2;
        string user;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginc(object sender, EventArgs e)
        {
             user = username.Value;
             data = user.Split('@')[0];
             data2 = user.Split('@')[1];
             DBHandler.DBHandler db = new DBHandler.DBHandler(con);
             Entities.tblSchoolId t1 = new Entities.tblSchoolId()
             {
                 schoolId = data,
             };
             Entities.Campus c1 = new Entities.Campus()
             {
                 campusName = data2,
             };
             DataSet ds = new DataSet();
             ds = db.CheckUserType(t1,c1);
             if (ds != null
               && ds.Tables.Count > 0
               && ds.Tables[0].Rows.Count > 0)
             {

                 usertype = ds.Tables[0].Rows[0]["userType"].ToString();
                 passcode = ds.Tables[0].Rows[0]["passCode"].ToString();
                 session = ds.Tables[0].Rows[0]["pKId"].ToString();

             }
             else
             {
                 Label1.Text = "Invalid Username or Password";
             }
             
             if (usertype == "admin" || usertype=="Admin")
             {
                 if (password.Value == passcode)
                 {
                     Session["School"] = session;
                     Response.Redirect("Admin.aspx");
                 }
                 else
                 {
                     Label1.Text = "Invalid Username or Password";
                 }

             }
             else if (usertype == "teacher" || usertype=="Teacher")
             {
                 if (password.Value == passcode)
                 {
                     Session["School"] = session;
                     Response.Redirect("Teacher.aspx");
                 }
                 else
                 {
                     Label1.Text = "Invalid Username or Password";
                 }
             }

             else if (usertype == "student" || usertype == "Student")
             {
                 if (password.Value == passcode)
                 {
                     Session["School"] = session;
                     Response.Redirect("Students.aspx");
                 }
                 else
                 {
                     Label1.Text = "Invalid Username or Password";
                 }
             }
             
        }
    }
}