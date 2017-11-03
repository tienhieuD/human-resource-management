﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrm2017
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { Session["login"].ToString().Trim(); }
            catch { Response.Redirect("/"); }
            lbLogin.Text = Session["login"].ToString();
        }
    }
}