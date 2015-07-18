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
    public partial class Survey : System.Web.UI.UserControl
    {
        public static int surveyid;
        public static int s;
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddSurvey(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewSurvey')", true);
            if (Page.IsValid)
            {
                DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                Entities.Survey s1 = new Entities.Survey()
                {
                    surveyName = ASurveyName.Value,
                    surveyDate = DateTime.Now.ToShortDateString(),
                    surveyGeneratedBy = Session["School"].ToString(),
                    surveyGeneratedFor = DropDownList3.SelectedValue,
                    type = Convert.ToInt32(RadioButtonList1.SelectedValue),
                };
                surveyid = db.InsertSurvey(s1);
                Panel1.Visible = true;
                Panel2.Visible = false;
            }

        }

        protected void GenerateSurvey(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewSurvey')", true);
            if (Page.IsValid)
            {

                for (int i = 1; i < 11; i++)
                {
                    if (i == 1 && AQuestion1.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion1.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 2 && AQuestion2.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion2.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 3 && AQuestion3.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion3.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 4 && AQuestion4.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion4.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 5 && AQuestion5.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion5.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 6 && AQuestion6.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion6.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 7 && AQuestion7.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion7.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 8 && AQuestion8.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion8.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 9 && AQuestion9.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion9.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                    if (i == 10 && AQuestion10.Value != "")
                    {
                        DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                        Entities.SurveyQuestion s1 = new Entities.SurveyQuestion()
                        {
                            surveyId = surveyid,
                            questionId = i,
                            question = AQuestion10.Value,
                        };
                        db.GenerateSurvey(s1);
                    }
                }
                Panel2.Visible = true;
                Panel1.Visible = false;

            }

        }

       

        protected void GridView2_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('ShowSurvey')", true);
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "show")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                 s = Convert.ToInt32(GridView2.DataKeys[rowindex].Value);
                GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                string check = (row.FindControl("type") as Label).Text.Trim();
                 DBHandler.DBHandler db = new DBHandler.DBHandler(con);
                 Entities.SurveyQuestion q1 = new Entities.SurveyQuestion()
                 {
                     surveyId=s,
                 };
                 DataSet ds = new DataSet();
                 ds = db.ShowSurvey(q1);
                 if (ds != null
                && ds.Tables.Count > 0
                && ds.Tables[0].Rows.Count > 0)
                 {
                     if (check == "Yes/No")
                     {
                         GridView1.DataSource = ds;
                         GridView1.DataBind();
                         Page.ClientScript.RegisterStartupScript(GetType(), "id", "ShowSurveyPop()", true);
                         Panel4.Visible = true;
                         Panel3.Visible = false;
                     }
                     else if (check == "Rating")
                     {
                         GridView3.DataSource = ds;
                         GridView3.DataBind();
                         Page.ClientScript.RegisterStartupScript(GetType(), "id", "ShowSurveyPop()", true);
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
                foreach (GridViewRow row in GridView3.Rows)
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
                foreach (GridViewRow row in GridView1.Rows)
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

    }
}