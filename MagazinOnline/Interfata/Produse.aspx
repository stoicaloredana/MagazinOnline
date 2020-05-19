<%@ Page Title="" Language="C#" MasterPageFile="~/SiteVanzari.Master" AutoEventWireup="true" CodeBehind="Produse.aspx.cs" Inherits="MagazinOnline.Interfata.Produse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table class="table dataTable" title="Lista produse" runat="server" ID="tblProduse">
            <thead>
                <tr>
                    <th></th>
                    <th style="vertical-align:middle;">Categorie</th>
                    <th style="vertical-align:middle;">Cod produs</th>
                    <th style="vertical-align:middle;">Produs</th>
                    <th style="vertical-align:middle;">Pret unitar</th>
                    <th style="vertical-align:middle;width: 30px;">Cantitate</th>
                    <th style="vertical-align:middle;">Imagine</th>
                    <th></th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <input type="hidden" runat="server" ID="hdIdProdus"/>
        <input type="hidden"  runat="server"  ID="hdCantitate"/>
    </form>
</asp:Content>
