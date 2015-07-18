using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace DBHandler
{
    /// <summary>
    ///  Used Open Source Class to communicate with SQL Server
    /// </summary>
    internal class WSqlCommand : IDisposable
    {
        #region Declarations

        private SqlCommand m_SqlCmd = null;
        private string m_connStr = "";

        #endregion

        #region Constructor

        /// <summary>
        /// Default constructor.
        /// </summary>
        /// <param name="connectionString">Connection string.</param>
        /// <param name="commandText">Command text.</param>
        public WSqlCommand(string connectionString, string commandText)
        {
            m_connStr = connectionString;

            m_SqlCmd = new SqlCommand(commandText);
            m_SqlCmd.CommandType = CommandType.StoredProcedure;
            m_SqlCmd.CommandTimeout = 180;
        }

        #endregion

        #region function Dispose

        public void Dispose()
        {
            if (m_SqlCmd != null)
            {
                m_SqlCmd.Dispose();
            }
        }

        #endregion

        #region function AddParameter

        /// <summary>
        /// Adds parameter to Sql Command.
        /// </summary>
        /// <param name="name">Parameter name.</param>
        /// <param name="dbType">Parameter datatype.</param>
        /// <param name="value">Parameter value.</param>
        public void AddParameter(string name, SqlDbType dbType, object value)
        {
            SqlDbType dbTyp = dbType;
            object val = value;

            if (dbType == SqlDbType.UniqueIdentifier)
            {
                dbTyp = SqlDbType.NVarChar;
                string guid = val.ToString();
                if (guid.Length < 1)
                {
                    return;
                }
            }

            m_SqlCmd.Parameters.Add(name, dbTyp).Value = val;
        }

        #endregion

        #region function AddOutputParameter
        /// <summary>
        /// Adds output parameter to sql commant.
        /// </summary>
        /// <param name="parmName">Parameter name.</param>
        /// <param name="parmDBType">Parameter datatype.</param>
        /// <returns>SqlParameter output value.</returns>
        public SqlParameter AddOutputParameter(String parmName, SqlDbType parmDBType)
        {
            SqlParameter outputParam = m_SqlCmd.Parameters.Add(
                parmName, parmDBType == SqlDbType.UniqueIdentifier ? SqlDbType.NVarChar : parmDBType);//
            outputParam.Direction = ParameterDirection.Output;
            m_SqlCmd.UpdatedRowSource = UpdateRowSource.OutputParameters;

            return outputParam;
        }
        #endregion

        #region fucntion Execute

        /// <summary>
        /// Executes command.
        /// </summary>
        /// <returns></returns>
        public DataSet Execute()
        {
            DataSet dsRetVal = null;

            using (SqlConnection con = new SqlConnection(m_connStr))
            {
                con.Open();
                m_SqlCmd.Connection = con;
               // m_SqlCmd.ExecuteNonQuery();
                dsRetVal = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(m_SqlCmd);
                adapter.Fill(dsRetVal);
                adapter.Dispose();
            }
            return dsRetVal;
        }

        #endregion

        #region Execute Reader Function
        /// <summary>
        /// Executes command.
        /// </summary>
        /// <returns></returns>
        public DataSet ExecuteReader()
        {
            DataSet dsRetVal = null;

            using (SqlConnection con = new SqlConnection(m_connStr))
            {
                con.Open();
                m_SqlCmd.Connection = con;
                dsRetVal = new DataSet();
                DataTable dt = new DataTable();
                dt.Load(m_SqlCmd.ExecuteReader());
                dsRetVal.Tables.Add(dt);
                //SqlDataAdapter adapter = new SqlDataAdapter();
                //adapter.Fill(dsRetVal);
                //adapter.Dispose();
            }
            return dsRetVal;
        }
        #endregion

        #region Properties Implementaion

        /// <summary>
        /// Gets or sets command timeout time.
        /// </summary>
        public int CommandTimeout
        {
            get { return m_SqlCmd.CommandTimeout; }

            set { m_SqlCmd.CommandTimeout = value; }
        }

        /// <summary>
        /// Gets or sets command type.
        /// </summary>
        public CommandType CommandType
        {
            get { return m_SqlCmd.CommandType; }

            set { m_SqlCmd.CommandType = value; }
        }

        #endregion
    }
}
