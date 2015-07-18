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
    public partial class Students : System.Web.UI.Page
    {
        public static int surveyid;
        public static int s;
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
          //  Session["School"] = "10-cp-93";
            this.name();
            this.Assignment();
            this.Quiz();
            this.Smiles();
         
        }

        public void name()
        {
            string s=  Session["School"].ToString();
            SqlDataAdapter da = new SqlDataAdapter("select [firstName]+' '+[lastName] as Name from [dbo].[personalInfo] where pKId='"+s+"'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
          //  Label5.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        }

        public void Assignment()
        {

            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.Notes t1 = new Entities.Notes()
            {
                noteType="Assignment",

            };

            Entities.personalInfo p1 = new Entities.personalInfo()
            {
                pKId = Session["School"].ToString(),

            };
            Entities.Class c1 = new Entities.Class()
            {
                className ="Class 5",

            };
            DataSet ds = new DataSet();
            ds=db.ShowSubNotes(t1,p1,c1);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }


        public void Quiz()
        {

            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.Notes t1 = new Entities.Notes()
            {
                noteType = "Quiz",

            };

            Entities.personalInfo p1 = new Entities.personalInfo()
            {
                pKId = Session["School"].ToString(),

            };
            Entities.Class c1 = new Entities.Class()
            {
                className = "Class 5",

            };
            DataSet ds = new DataSet();
            ds = db.ShowSubNotes(t1, p1, c1);
            GridView3.DataSource = ds;
            GridView3.DataBind();
            
        }

        public void Smiles()
        {

            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.personalInfo p1 = new Entities.personalInfo()
            {
                pKId = Session["School"].ToString(),
            };

            DataSet ds = new DataSet();
            ds = db.CountSmiles(p1);
            if (ds != null
               && ds.Tables.Count > 0
               && ds.Tables[0].Rows.Count > 0)
            {
              //  Label1.Text = ds.Tables[0].Rows[0]["Smilies"].ToString();
               // Label2.Text = ds.Tables[0].Rows[0]["Sad"].ToString();
            }

        }

        protected void logout(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("http://www.edgnome.com/");
        }

        protected void ShowMarks(object sender, EventArgs e)
        {
            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.StudentExam t1 = new Entities.StudentExam()
            {
                pKId = Session["School"].ToString(),
            };
            Entities.Class c1 = new Entities.Class()
            {
                className = DropDownList3.SelectedValue,
            };
            Entities.ExamType e1 = new Entities.ExamType()
            {
                examType = DropDownList4.SelectedValue,
            };
            DataSet ds = new DataSet();
            ds = db.Graph(t1, c1, e1);
            GridView7.DataSource = ds;
            GridView7.DataBind();
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ProgrssStudent')", true);
        }

        protected void ShowAptitude(object sender, EventArgs e)
        {
            SqlDataSource2.DataBind();
            GridView2.DataBind();
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('Achievements')", true);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void ShowAttendance(object sender, EventArgs e)
        {
            DBHandler.DBHandler db = new DBHandler.DBHandler(con);
            Entities.personalInfo p1 = new Entities.personalInfo()
            {
                pKId = Session["School"].ToString(),

            };
            Entities.Subjects s2 = new Entities.Subjects()
            {
                subjectName = DropDownList2.SelectedValue,

            };
            Entities.SAttendance s1 = new Entities.SAttendance()
            {
                Sdate = DropDownList1.SelectedValue,

            };
            DataSet ds = new DataSet();
            ds = db.ShowStudentAttendacne(p1, s1, s2);
            GridView4.DataSource = ds;
            GridView4.DataBind();
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('Attendance')", true);
        }

        protected void GridView8_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowSurvey')", true);
        }

        protected void GridView8_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "show")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                s = Convert.ToInt32(GridView8.DataKeys[rowindex].Value);
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                string check = (row.FindControl("type") as Label).Text.Trim();
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.SurveyQuestion q1 = new Entities.SurveyQuestion()
                {
                    surveyId = s,
                };
                DataSet ds = new DataSet();
                ds = db.ShowSurvey(q1);
                if (ds != null
               && ds.Tables.Count > 0
               && ds.Tables[0].Rows.Count > 0)
                {
                    if (check == "Yes/No")
                    {
                        GridView9.DataSource = ds;
                        GridView9.DataBind();
                        Page.ClientScript.RegisterStartupScript(GetType(), "id", "sShowSurveyPop()", true);
                        Panel4.Visible = true;
                        Panel3.Visible = false;
                    }
                    else if (check == "Rating")
                    {
                        GridView10.DataSource = ds;
                        GridView10.DataBind();
                        Page.ClientScript.RegisterStartupScript(GetType(), "id", "sShowSurveyPop()", true);
                        Panel4.Visible = false;
                        Panel3.Visible = true;
                    }
                }

                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowSurvey')", true);
                }
            }
        }


        protected void SubmitSurvey(object sender, EventArgs e)
        {
            if (Panel3.Visible == true)
            {
                foreach (GridViewRow row in GridView9.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        int questionid = int.Parse((row.FindControl("Label1") as Label).Text);
                        DropDownList ddl = row.FindControl("DropDownList4") as DropDownList;
                        int answer = ddl.SelectedIndex;
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyReply s1 = new Entities.SurveyReply()
                        {
                            surveyId = s,
                            questionId = questionid,
                            answer = answer,
                            repliedBy = Session["School"].ToString(),
                        };
                        db.SurveyReply(s1);
                    }
                }

                DBHandler.DBHandler db1 = new DBHandler.DBHandler(con);
                Entities.SurveyReply s2 = new Entities.SurveyReply()
                {
                    surveyId = s,
                    repliedBy = Session["School"].ToString(),
                };
                Entities.Survey s3 = new Entities.Survey()
                {
                    surveyDate = DateTime.Now.ToShortDateString(),
                };

                db1.InsertSurveyResponse(s2, s3);

                Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowSurvey')", true);

            }

            else if (Panel4.Visible == true)
            {
                foreach (GridViewRow row in GridView10.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        int questionid = int.Parse((row.FindControl("Label1") as Label).Text);
                        CheckBox ddl = row.FindControl("CheckBox1") as CheckBox;
                        int answer = ddl.Checked ? 6 : 7;
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyReply s1 = new Entities.SurveyReply()
                        {
                            surveyId = s,
                            questionId = questionid,
                            answer = answer,
                            repliedBy = Session["School"].ToString(),
                        };
                        db.SurveyReply(s1);
                    }
                }

                DBHandler.DBHandler db1 = new DBHandler.DBHandler(con);
                Entities.SurveyReply s2 = new Entities.SurveyReply()
                {
                    surveyId = s,
                    repliedBy = Session["School"].ToString(),
                };
                Entities.Survey s3 = new Entities.Survey()
                {
                    surveyDate = DateTime.Now.ToShortDateString(),
                };

                db1.InsertSurveyResponse(s2, s3);

                Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowSurvey')", true);

            }
        }


        protected void AddTicket(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewTicket')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Tickets t1 = new Entities.Tickets()
                {
                    generatedBy = Session["School"].ToString(),
                    generatedFor = IcreatedFor.Text,
                    issueDate = DateTime.Now.ToShortDateString(),
                    issue = TextBox1.Text,
                };
                db.AddTicket(t1);
                GridView11.DataBind();
                UpdatePanel1.Update();
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewTicket')", true);
                Label6.Text = "Issue Added Successfully";
                TextBox1.Text = " ";
            }
        }

        protected void GridView11_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView11_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "show")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                int s = Convert.ToInt32(GridView11.DataKeys[rowindex].Value);
                SqlDataAdapter da = new SqlDataAdapter("select [issue] from [dbo].[issue] where issueId=" + s + "", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                TextArea1.Value = ds.Tables[0].Rows[0]["issue"].ToString();
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "sTicketPop()", true);
            }
        }

        protected void GridView12_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "reply")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                int s = Convert.ToInt32(GridView12.DataKeys[rowindex].Value);
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Tickets cc1 = new Entities.Tickets()
                {
                    issueId = s,
                };

                DataSet ds = new DataSet();
                ds = db.SelectTicket(cc1);

                if (ds != null
                && ds.Tables.Count > 0
                && ds.Tables[0].Rows.Count > 0)
                {
                    TextArea2.Value = ds.Tables[0].Rows[0]["issue"].ToString();

                    TextBox3.Text = ds.Tables[0].Rows[0]["generatedBy"].ToString();
                    TextBox4.Text = ds.Tables[0].Rows[0]["issueId"].ToString();
                    Page.ClientScript.RegisterStartupScript(GetType(), "id", "sTicketReplyPop()", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('PendingTickets')", true);
                }
            }
        }

        protected void TicketReply(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "sTicketReplyPop()", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Tickets t1 = new Entities.Tickets()
                {
                    generatedBy = Session["School"].ToString(),
                    generatedFor = TextBox3.Text,
                    issueDate = DateTime.Now.ToShortDateString(),
                    issue = TextBox2.Text,
                    linkedWith = Convert.ToInt32(TextBox4.Text),
                    isNew = false,
                };
                db.AddTicket(t1);
                Label7.Text = "Replied Successfully";
            }

        }


        protected void GridView11_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewTicket')", true);
            UpdatePanel1.Update();
        }


        protected void GridView12_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('PendingTickets')", true);
        }
      
    }
}