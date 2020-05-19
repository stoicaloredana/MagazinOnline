using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.HtmlControls;
using MagazinOnline.Utils;

namespace MagazinOnline.Interfata
{
    public partial class Produse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                List<UtilsDb.ElementCos> listaElementCos;
                string IdProdus = hdIdProdus.Value;
                string Cantitate = hdCantitate.Value; 

                if (Session["ListaCos"] == null)
                {
                    listaElementCos = new List<UtilsDb.ElementCos>();
                    listaElementCos.Add(new UtilsDb.ElementCos {IdProdus = IdProdus, Cantitate = Cantitate});
                    Session["ListaCos"] = listaElementCos;
                }
                else
                {
                    listaElementCos = (List<UtilsDb.ElementCos>) Session["ListaCos"];
                    listaElementCos.Add(new UtilsDb.ElementCos {IdProdus = IdProdus, Cantitate = Cantitate});
                    Session["ListaCos"] = listaElementCos;
                }
            }

            IncarcaTabelProduse();
        }

        private void IncarcaTabelProduse()
        {
            string sqlProduse = "Select * from vListaMarfuri";
            DataTable dtProduse = Utils.UtilsDb.GetData(sqlProduse);

            for (int i = 0; i < dtProduse.Rows.Count; i++)
            {
                DataRow dr = dtProduse.Rows[i];

                HtmlTableCell td = new HtmlTableCell();
                HtmlTableRow tr = new HtmlTableRow();

                #region id ascuns
                td.InnerHtml = $"<input type='hidden' id='idProd_{i}' value='{dr["IdMarfa"]}'>";
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion

                #region DenumireCategorie
                td = new HtmlTableCell();
                td.InnerText = dr["DenumireCategorie"].ToString();
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion

                #region CodProdus
                td = new HtmlTableCell();
                td.InnerText = dr["CodProdus"].ToString();
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion

                #region DenumireMarfa
                td = new HtmlTableCell();
                td.InnerText = dr["DenumireMarfa"].ToString();
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion

                #region Pret
                td = new HtmlTableCell();
                td.InnerHtml = $" <input type='number' step='any' disabled value='{dr["PretMaxVanzare"]}' >";
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion

                #region cantitate
                td = new HtmlTableCell();
                td.InnerHtml = $" <input type='number' id='cantitate_{i}' value='1' min='1' max=100'>";
                td.Style["vertical-align"] = "middle";
                td.Style["width"] = "30px";
                tr.Cells.Add(td);
                #endregion

                #region Imagine
                td = new HtmlTableCell();
                td.InnerHtml = $" <img src='{dr["Imagine"]}' width='67px' height='50px'>";
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion

                #region 
                string onclickCmd = $"$('#ContentPlaceHolder1_hdIdProdus')[0].value=$('#idProd_{i}').val();$('#ContentPlaceHolder1_hdCantitate')[0].value=$('#cantitate_{i}').val();";

                td = new HtmlTableCell();
                td.InnerHtml = $@"<button class='btn btn-primary btn-icon-split' onclick=""{onclickCmd}"" type='submit' > 
                                <span class='icon text-white-50'><i class='fas fa-plus'></i></span>
                                <span class='text'>Adauga</span>
                                </button>";
                td.Style["vertical-align"] = "middle";
                tr.Cells.Add(td);
                #endregion


                tblProduse.Rows.Add(tr);
            }



        }
    }
}