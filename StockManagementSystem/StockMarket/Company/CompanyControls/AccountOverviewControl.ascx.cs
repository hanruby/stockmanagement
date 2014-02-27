﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Google;
using System.Data.SqlClient;
using System.Data;
using DatabaseAccess;

public partial class Controls_AccountOverviewControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateQuickStats();
        Bind_Data();
    }

    protected void Bind_Data()
    {
        User u = Account.CurrentUser();
        DataRow user = GetUser();
        DataRow account = GetAccount();
        DataRow address = GetAddress(Convert.ToInt32(user["address_id"]));
        lblCompany.Text = u.CompanyName;
        lblUsername.Text = u.UserName;
        lblFirstName.Text = u.FirstName;
        lblLastName.Text = u.LastName;
        lblEmail.Text = u.Email;
        lblPhone.Text = u.Phone;
        lblBank.Text = (String)account["bank_name"];
        lblRouting.Text = (String)account["routing_number"];
        lblAccount.Text = (String)account["account_number"];
        lblBillingName.Text = (String)user["firstname"] + " " + (String)user["lastname"];
        lblBillingLine1.Text = (String)account["billing_line1"];
        lblBillingLine2.Text = (String)account["billing_line2"];
        lblBillingLineExtra.Text = (String)account["billing_city"] + ", " + (String)account["billing_state"] + ", " + (String)account["billing_zip"];
        lblMailingName.Text = (String)user["firstname"] + " " + (String)user["lastname"];
        lblMailingLine1.Text = (String)address["line1"];
        lblMailingLine2.Text = (String)address["line2"];
        lblMailingLineExtra.Text = (String)address["city"] + ", " + (String)address["state"] + ", " + (String)address["zip"];
    }

    private DataRow GetUser()
    {
        int id = Account.CurrentUser().UserId;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE user_id = @user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = id;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        return dt.Rows[0];
    }

    private DataRow GetAccount()
    {
        int id = Account.CurrentUser().UserId;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM BankAccount WHERE user_id = @user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = id;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        return dt.Rows[0];
    }

    private DataRow GetAddress(int aid)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Address WHERE address_id = @address_id";
        cmd.Parameters.Add("@address_id", SqlDbType.Int).Value = aid;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        return dt.Rows[0];
    }

    protected void lbtnUpdate_Click(object sender, EventArgs e)
    {

    }

    private void GenerateQuickStats()
    {
        GoogleChart chart = new GoogleChart();
        chart.title = "Quick Stats";
        chart.width = 250;
        chart.height = 200;
        chart.addColumn("string", "Year");
        chart.addColumn("number", "Value");
        chart.addColumn("number", "Profit");
        chart.addRow("'2014', 2000, 1000");
        ltChart.Text = chart.generateChart(GoogleChart.ChartType.ColumnChart);
    }
}