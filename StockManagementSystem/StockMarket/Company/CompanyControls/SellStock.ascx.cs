﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using Common;
using DatabaseAccess;

public partial class Company_CompanyControls_SellStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitJavascript();
        if (!Page.IsPostBack)
        {
            ddlStock.DataSource = StockMarket.GetStockQuantityByUser();
            ddlStock.DataTextField = "ticker";
            ddlStock.DataValueField = "total_quantity";
            ddlStock.DataBind();

            gvStock.DataSource = StockMarket.GetStockQuantityByUser();
            gvStock.DataBind();
        }
    }

    private void InitJavascript()
    {
        txtQuantitySell.Attributes.Add("onkeypress", "return isNumber(event);");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int stockToSell = int.Parse(txtQuantitySell.Text);
        int stockAvailable = int.Parse(ddlStock.SelectedItem.Value);

        if (stockToSell > stockAvailable || stockToSell == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyScript", "alert('You cannot sell 0 stocks or more stocks than what you currently own.');", true);
        }
        else
        {
            StockMarket.InsertTransaction(ddlStock.SelectedItem.Text, stockToSell, Enums.TransactionType.Sell);
            Response.Redirect(Request.Url.ToString(), true);
        }
    }
}