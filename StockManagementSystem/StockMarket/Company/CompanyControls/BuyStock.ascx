﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BuyStock.ascx.cs" Inherits="Company_CompanyControls_BuyStock" %>

<div class="tab-pane" id="buy">
    <div class="row-fluid">
        <div class="span8">
            <h4><i class="icon-money"></i>&nbsp;&nbsp;Current Stock</h4>
            <asp:GridView ID="gvStock"
                runat="server" 
                CssClass="row-fluid table table- table-bordered table-condensed" 
                HeaderStyle-ForeColor="Black"
                HeaderStyle-BackColor="White"
                AllowPaging="true"
                AllowSorting="true"
                AutoGenerateColumns="false"
                AutoGenerateEditButton="false">
                <Columns>
                    <asp:BoundField DataField="ticker" HeaderText="Ticker" SortExpression="Ticker" ReadOnly="true" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name"  ControlStyle-Width="100px"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" ControlStyle-Width="40px"/>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="MarketPrice" ControlStyle-Width="100px"/>
                </Columns>
            </asp:GridView>

        </div>
        <div class="span4">
            <h4><i class="icon-exchange"></i>&nbsp;&nbsp;Make Transaction</h4>
            <label>Stock Type</label>
            <asp:DropDownList ID="ddlStock" runat="server" CssClass="input-block-level"></asp:DropDownList>
            <label>Quantity To Purchase</label>
            <asp:TextBox ID="txtQuantityPurchase" runat="server" CssClass="input-block-level"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Request" CssClass="btn-inverse" OnClick="btnSubmit_Click" />
        </div>
    </div>
</div>

<script type="text/javascript">
    function isNumber(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>
