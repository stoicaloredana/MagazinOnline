using System;
using System.Data;

namespace MagazinOnline.Interfata.Autentificare
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (!string.IsNullOrWhiteSpace(userName.Text)
                    && !string.IsNullOrWhiteSpace(pass1.Text)
                    && !string.IsNullOrWhiteSpace(pass2.Text))
                {
                    if (pass1.Text != pass2.Text)
                    {
                        Response.Write("<script language=javascript>alert('Parola nu coincide!');</script>");
                        return;
                    }

                    DataTable dtUser = Utils.UtilsDb.GetData($@"select IdUtilizator 
                                                                    from Utilizatori 
                                                                    where NumeUtilizator='{userName.Text}'");
                    if (dtUser.Rows.Count > 0)
                    {
                        Response.Write("<script language=javascript>alert('Introduceti alt nume de utilizator!');</script>");
                        return;
                    }
                    else
                    {
                        string sqlInsetUser = $@"INSERT INTO Utilizatori (NumeUtilizator, Parola, DataCrearii, Blocat)
                                                VALUES ('{userName.Text}', '{pass1.Text}', '{DateTime.Now}', 0)";
                        Utils.UtilsDb.InsertData(sqlInsetUser);

                        Response.Redirect("~/Main.aspx");
                        return;
                    }
                }

                Response.Write("<script language=javascript>alert('Completati toate campurile!');</script>");
            }
        }
    }
}