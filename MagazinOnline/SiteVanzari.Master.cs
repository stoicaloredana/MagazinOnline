using System;

namespace MagazinOnline
{
    public partial class SiteVanzari : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdUtilizator"] == null)
            {
                Response.Redirect("Interfata/Autentificare/Login.aspx");
            }

        }
    }
}