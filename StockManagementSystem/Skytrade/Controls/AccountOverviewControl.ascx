﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountOverviewControl.ascx.cs" Inherits="Controls_AccountOverviewControl" %>

<div class="tab-pane active" id="account">
    <div class="row-fluid">
        <div class="span4">
            <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Overview</h4>
            <div class="box">
                <b>Username: </b><asp:Label ID="lblUsername" runat="server" Text="****"></asp:Label><br />
                <b>First Name: </b><asp:Label ID="lblFirstName" runat="server" Text="****"></asp:Label><br />
                <b>Last Name: </b><asp:Label ID="lblLastName" runat="server" Text="****"></asp:Label><br />
                <b>Email Address: </b><asp:Label ID="lblEmail" runat="server" Text="****"></asp:Label><br />
                <b>Phone Number: </b><asp:Label ID="lblPhone" runat="server" Text="****"></asp:Label><br />
                <b>Social Security: </b><asp:Label ID="lblSSN" runat="server" Text="xxx-xx-5455"></asp:Label><br />
            </div>
            <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Mailing Address</h4>
            <div class="box">
                <address>
                    <strong>User's name</strong><br>
                    1500 La Crosse St<br>
                    La Crosse, WI 54601<br>
                    <abbr title="Phone">P:</abbr>
                    (123) 456-7890
                </address>
            </div>
        </div>
        <div class="span4">
            <h4><i class="icon-question"></i>&nbsp;&nbsp;Billing Information</h4>
            <div class="box">
                <b>Bank Name: </b><asp:Label ID="lblBank" runat="server" Text="****"></asp:Label><br />
                <b>Routing Number: </b><asp:Label ID="lblRouting" runat="server" Text="****"></asp:Label><br />
                <b>Account Number: </b><asp:Label ID="lblAccount" runat="server" Text="****"></asp:Label><br />
                <b>Account Type: </b><asp:Label ID="lblType" runat="server" Text="****"></asp:Label><br />
                <br />
                <br />
            </div>
            <h4><i class="icon-location-arrow"></i>&nbsp;&nbsp;Billing Address</h4>
            <div class="box">
                <address>
                    <strong>User's name</strong><br>
                    1500 La Crosse St<br>
                    La Crosse, WI 54601<br>
                    <abbr title="Phone">P:</abbr>
                    (123) 456-7890
                </address>
            </div>
        </div>
        <div class="span4">
            <h4><i class="icon-expand-alt"></i>&nbsp;&nbsp;Quick Stats</h4>

            <asp:Literal ID="ltChart" runat="server"></asp:Literal>
            <div id="chart_div"></div>
            
            <div class="box">
                <p>To view your complete Sky Trade stats, <a href="#">click here.</a></p>
            </div>
            <a href="#TabsModal" role="button" class="btn btn-large btn-inverse " data-toggle="modal">Edit Account</a>
        </div>
    </div>
</div>

<%--This is the entire popup form that handles editing a user's account information.--%>
<div id="TabsModal" class="modal hide modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="row-fluid">
        <div class="span7 offset3">

            <div class="tabbable custom-tabs tabs-animated  flat flat-all hide-label-980 shadow tabs-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#panel6-1" data-toggle="tab" class="active "><i class="icon-user"></i>&nbsp;<span>Account Information</span></a></li>
                    <li><a href="#panel6-2" data-toggle="tab"><i class="icon-money"></i>&nbsp;<span>Billing Information</span></a></li>
                    <li class="pull-right"><a href="#close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i>&nbsp;<span></span></a></li>
                    <li class="pull-right">
                        <asp:LinkButton ID="lbtnUpdate" runat="server" OnClick="lbtnUpdate_Click" PostBackUrl="/"><i class="icon-save">&nbsp;<span>Save</span></i></asp:LinkButton>
                    </li>
                </ul>
                <div class="tab-content ">
                    <div class="tab-pane active" id="panel6-1">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Account Information</h4>

                                <label>Username</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>First Name</label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Last Name</label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Social Security</label>
                                <asp:TextBox ID="txtSSN" runat="server" CssClass="input-block-level"></asp:TextBox>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Mailing Address</h4>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Address 2</label>
                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>State</label>
                                <asp:TextBox ID="txtState" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Zip Code</label>
                                <asp:TextBox ID="txtZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                                                                        <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="panel6-2">
                        <div class="row-fluid">
                            <div class="span6">
                                <h4><i class="icon-user"></i>&nbsp;&nbsp; Billing Information</h4>

                                <label>Bank Name</label>
                                <asp:TextBox ID="txtBank" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Routing Number</label>
                                <asp:TextBox ID="txtRouting" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Account Number</label>
                                <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Account Type</label>
                                <asp:DropDownList ID="ddlAccountType" runat="server">
                                    <asp:ListItem>Checking</asp:ListItem>
                                    <asp:ListItem>Savings</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="span6">
                                <h4><i class="icon-envelope"></i>&nbsp;&nbsp;Billing Address</h4>
                                <label>Address 1</label>
                                <asp:TextBox ID="txtBillingAddress1" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Address 2</label>
                                <asp:TextBox ID="txtBillingAddress2" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>City</label>
                                <asp:TextBox ID="txtBillingCity" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>State</label>
                                <asp:TextBox ID="txtBillingState" runat="server" CssClass="input-block-level"></asp:TextBox>
                                <label>Zip Code</label>
                                <asp:TextBox ID="txtBillingZip" runat="server" CssClass="input-block-level"></asp:TextBox>
                            </div> <!-- span6 -->
                        </div> <!-- row-fluid -->
                    </div> <!-- panel6-2 -->

                </div>
            </div>
        </div>
    </div>
</div>