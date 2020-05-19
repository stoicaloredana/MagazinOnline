using System;
using System.Data;

namespace MagazinOnline.Interfata.Autentificare
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(userName.Text) && !string.IsNullOrWhiteSpace(parola.Text))
            {
                DataTable dtUser = Utils.UtilsDb.GetData($@"select IdUtilizator 
                                                                    from Utilizatori 
                                                                    where Blocat <> 1 and
                                                                          NumeUtilizator='{userName.Text}'
                                                                          and Parola='{parola.Text}'"
                                                                    );
                if (dtUser.Rows.Count > 0)
                {
                    Session["IdUtilizator"] = dtUser.Rows[0]["IdUtilizator"];
                    Response.Redirect("~/Main.aspx");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Utilizatorul sau parola sunt incorecte!');</script>");
                }
            }
        }
    }
}