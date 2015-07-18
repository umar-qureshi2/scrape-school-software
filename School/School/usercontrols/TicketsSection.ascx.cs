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
    public partial class Tickets : System.Web.UI.UserControl
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["school"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           // Session["School"] = "10-cp-37";

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
                GridView1.DataBind();
                UpdatePanel1.Update();
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewTicket')", true);
                Label2.Text = "Issue Added Successfully";
                TextBox1.Text = " ";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            
         //   Page.ClientScript.RegisterStartupScript(GetType(), "id", "ConfirmDelete()", true);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "show")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                int s = Convert.ToInt32(GridView1.DataKeys[rowindex].Value);
                SqlDataAdapter da = new SqlDataAdapter("select [issue] from [dbo].[issue] where issueId=" + s + "", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                TextArea1.Value = ds.Tables[0].Rows[0]["issue"].ToString();
                Page.ClientScript.RegisterStartupScript(GetType(), "id", "TicketPop()", true);
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "reply")
            {
                int rowindex = ((GridViewRow)((ImageButton)e.CommandSource).NamingContainer).RowIndex;
                int s = Convert.ToInt32(GridView2.DataKeys[rowindex].Value);
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
                    Page.ClientScript.RegisterStartupScript(GetType(), "id", "TicketReplyPop()", true);
                }
            }
        }
        protected void TicketReply(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "TicketReplyPop()", true);
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
                Label1.Text = "Replied Successfully";
            }

        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('NewTicket')", true);
            UpdatePanel1.Update();
        }

        protected void GridView2_PageIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "id", "toggle_forms('PendingTickets')", true);
        }


    }
}