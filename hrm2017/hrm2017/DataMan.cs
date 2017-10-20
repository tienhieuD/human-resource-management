using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace hrm2017
{
    //Data Manipulation
    public class DataMan
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        public static SqlConnection sqlConnection = new SqlConnection(connectionString);
        public static SqlCommand sqlCommand;
        public static SqlDataAdapter sqlDataAdapter;

        public DataMan()
        {
            OpenConnection();
        }

        public static void CloseConnection()
        {
            if (sqlConnection.State != ConnectionState.Closed)
                sqlConnection.Close();
        }

        public static void OpenConnection()
        {
            if (sqlConnection.State != ConnectionState.Open)
                sqlConnection.Open();
        }

        public static DataTable GetDataTable(string sql)
        {
            OpenConnection();
            sqlCommand = new SqlCommand(sql, sqlConnection);
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            CloseConnection();
            return dataTable;
        }

        public static void ExcuteCommand(string sql)
        {
            OpenConnection();
            sqlCommand = new SqlCommand(sql, sqlConnection);
            sqlCommand.ExecuteNonQuery();
            CloseConnection();
        }

        public static int ExecuteCommandSingle(string sql)
        {
            OpenConnection();
            sqlCommand = new SqlCommand(sql, sqlConnection);
            int result = (int)sqlCommand.ExecuteScalar();
            CloseConnection();
            return result;
        }
    }
}