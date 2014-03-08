﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Common;
using DatabaseAccess;

public static class StockMarket
{
    public static int GetQuantityAvailable(string ticker)
    {
        // Get the current quantity available for the stock chosen in the table
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT quantity FROM Stock WHERE ticker = '" + ticker + "'";
        return int.Parse(SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn));
    }

    public static DataTable GetTransactionDetailsByStatus(string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TransactionDetails WHERE Status = '" + status + "' ORDER BY timestamp desc";
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    public static void UpdateTransaction(int id, Enums.Status status, string message)
    {
        // Update transaction to be approved
        SqlCommand cmd = new SqlCommand("UpdateTransaction");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@transaction_id", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = status;
        cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = message;
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }

    public static void InsertTransaction(int userId, string ticker, int quantity)
    {
        SqlCommand cmd = new SqlCommand("InsertTransaction");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = userId;
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = ticker;
        cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = quantity;
        cmd.Parameters.Add("@transaction_type_id", SqlDbType.Int).Value = 1;

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "SELECT price FROM Stock WHERE ticker = '" + ticker + "'";
        string price = SqlHelper.ExecuteScalar(cmd2, Settings.StockMarketConn);
        cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = double.Parse(price);

        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }

    public static string GetTransactionMessage(int transactionId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT message FROM Transactions WHERE transaction_id = " + transactionId + "";
        return SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn);
    }

    public static int GetTotalUnreadMessages()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT COUNT(*) FROM messages WHERE to_user = " + Account.CurrentUser().UserId + " AND archived = 0";
        return int.Parse(SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn));
    }

    public static void UpdateMessageArchiveStatus(int messageId, bool archive)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE messages SET archived = '" + archive + "' WHERE message_id = " + messageId + "";
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }
}

