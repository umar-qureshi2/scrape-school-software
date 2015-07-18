using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace School.usercontrols
{
    public partial class calendar : System.Web.UI.UserControl
    {
        protected DataSet dsHolidays;


        protected void Page_Load(object sender, EventArgs e)
        {

            Calendar1.DayRender += new DayRenderEventHandler(Calendar1_DayRender);
            if (!IsPostBack)
            {
                Calendar1.VisibleDate = DateTime.Today;
                FillHolidayDataset();
            }
            if (IsPostBack)
            {

            }
        }

        protected void FillHolidayDataset()
        {
            DateTime firstDate = new DateTime(Calendar1.VisibleDate.Year,
                Calendar1.VisibleDate.Month, 1);
            DateTime lastDate = GetFirstDayOfNextMonth();
            dsHolidays = GetCurrentMonthData(firstDate, lastDate);
        }

        protected DateTime GetFirstDayOfNextMonth()
        {
            int monthNumber, yearNumber;
            if (Calendar1.VisibleDate.Month == 12)
            {
                monthNumber = 1;
                yearNumber = Calendar1.VisibleDate.Year + 1;
            }
            else
            {
                monthNumber = Calendar1.VisibleDate.Month + 1;
                yearNumber = Calendar1.VisibleDate.Year;
            }
            DateTime lastDate = new DateTime(yearNumber, monthNumber, 1);
            return lastDate;
        }

        protected DataSet GetCurrentMonthData(DateTime firstDate,
             DateTime lastDate)
        {
            DataSet dsMonth = new DataSet();
            ConnectionStringSettings cs;
            cs = ConfigurationManager.ConnectionStrings["school"];
            String connString = cs.ConnectionString;
            SqlConnection dbConnection = new SqlConnection(connString);
            String query;
            query = "SELECT HolidayDate, Note FROM Holidays " +
                " WHERE HolidayDate >= @firstDate AND HolidayDate < @lastDate";
            SqlCommand dbCommand = new SqlCommand(query, dbConnection);
            dbCommand.Parameters.Add(new SqlParameter("@firstDate",
                firstDate));
            dbCommand.Parameters.Add(new SqlParameter("@lastDate", lastDate));

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(dbCommand);
            try
            {
                sqlDataAdapter.Fill(dsMonth);
            }
            catch { }
            return dsMonth;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime nextDate;
            if (dsHolidays != null)
            {
                foreach (DataRow dr in dsHolidays.Tables[0].Rows)
                {
                    nextDate = (DateTime)dr["HolidayDate"];
                    if (nextDate == e.Day.Date)
                    {
                        e.Cell.BackColor = System.Drawing.Color.LightGray;

                        e.Cell.Text += e.Day.DayNumberText + Environment.NewLine + "<br/><span style=\";\"> " + (string)dr["Note"] +"</span>";
                    }
                }
            }
        }
        protected void Calendar1_VisibleMonthChanged(object sender,
            MonthChangedEventArgs e)
        {
            
            FillHolidayDataset();
        }
    }
}