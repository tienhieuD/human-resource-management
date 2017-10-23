using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace hrm2017
{
    //Interface Manipulation
    public class InterMan
    {
        public static string ConvertToHtml(DataTable dataTable)
        {
            string table, tr, td, th = "";

            for (int i = 0; i < dataTable.Columns.Count; i++)
                th += "<th>" + dataTable.Columns[i].Caption + "</th>";
            tr = "<tr>" + th + "</tr>";

            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                td = "";
                for (int j = 0; j < dataTable.Columns.Count; j++)
                    td += "<td>" + dataTable.Rows[i][j].ToString() + "</td>";
                tr += "<tr>" + td + "</tr>";
            }
            table = "<table  class='table table-striped table-bordered dataTable'>" + tr + "</table>";
            return table;
        }
    }
}