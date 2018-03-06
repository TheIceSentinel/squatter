﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SquatterForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="jumbotron">
    <h1>DTP Application</h1>
    <h2>Delinquent Tax Property Application</h2>
    <p class="lead">
        This is a private application not available to the public. It will allow the user to search for delinquent tax properties
        based on the past 5 years of data from Dallas County Public record that was provided. Please use the filters below in order to narrow or broaden
        your search criteria. You will then be able to transfer that data
    </p>
    <p><a href="https://asp.net" class="btn btn-primary btn-lg">Click Here for User Manual &raquo;</a></p>
</div>
<!--Filters-->
    <!-- This is a rough mock up, I figure we put the ten most desireable zip codes 
        Or something here to minimize all 115 of them, we can discuss this in class-->
<div class="panel panel-default">
    <div class="panel-heading">Filters</div>
    <div class="panel-body">
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Zip Code</label>
                <asp:ListBox ID="lbZipCode" runat="server" 
                    SelectionMode="Multiple" CssClass="form-control" 
                    Rows="5" AutoPostBack="True">
                    <asp:ListItem>75390</asp:ListItem>
                    <asp:ListItem>75393</asp:ListItem>
                    <asp:ListItem>75394</asp:ListItem>
                    <asp:ListItem>75395</asp:ListItem>
                    <asp:ListItem>75303</asp:ListItem>
                    <asp:ListItem>75312</asp:ListItem>
                    <asp:ListItem>75313</asp:ListItem>
                    <asp:ListItem>75336</asp:ListItem>
                    <asp:ListItem>75339</asp:ListItem>
                    <asp:ListItem>75342</asp:ListItem>
                    <asp:ListItem>75354</asp:ListItem>
                </asp:ListBox>
            </div>
            
            <!-- Starting here I want to spread these fields out across the screen, need help remembering, so they
                won't be stacked in our application -->
            <!--We Could make this a range validator want groups opinion-->
            <div class="col-sm-3">
                <label class="control-label">Total Amount Due</label>
                <asp:DropDownList ID="ddlTotalAmountDue" runat="server" 
                    CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem>Less than $20,000</asp:ListItem>
                    <asp:ListItem>Less than $40,000</asp:ListItem>
                    <asp:ListItem>Less than $50,000</asp:ListItem>
                    <asp:ListItem>Greater than $50,000</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- This is a simple indicator YES, OR NO -->
            <div class="col-sm-2">
                <label class="control-label">Payment Agreement</label>
                <asp:DropDownList ID="ddlPaymentAgreement" runat="server" 
                    CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem>Y</asp:ListItem>
                    <asp:ListItem>N</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <!-- This is also the same type of thing if good areas only select yes, then it displays them below -->
            <div class="col-sm-2s">
                <label class="control-label">Areas</label>
                <asp:CheckBoxList ID="cblArea" runat="server" 
                    CssClass="form-control"
                    AutoPostBack="True">
                    <asp:ListItem>Good</asp:ListItem>
                    <asp:ListItem>Bad</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>
    </div>
</div>
<!--End of Filters-->

<!-- Gridview for DTP Database -->
<div class="jumbotron">
    <h1>DTP Data</h1>
    <p class="lead">Here is where you data will be displayed.</p>
    
        <asp:GridView ID="grdDTPData" runat="server"
                      AutoGenerateColumns="False" 
                      AutoGenerateRows="True"
                      CssClass="table table-bordered table-striped table-condensed" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="OWNER" HeaderText="Owners Name" />
                <asp:BoundField DataField="ADDRESS2" HeaderText="Address" ReadOnly="True" />
                <asp:BoundField DataField="ADDRESS3" HeaderText="Alt Address" ReadOnly="True" />
                <asp:BoundField DataField="CITY" HeaderText="City" ReadOnly="True" />
                <asp:BoundField DataField="STATE" HeaderText="State" ReadOnly="True" />
                <asp:BoundField DataField="ZIP" HeaderText="Zip Code" ReadOnly="True" />
                <asp:BoundField DataField="ZIP-PLUS4" HeaderText="Zip Code +4" ReadOnly="True" />
                <asp:BoundField DataField="ROLL-CODE" HeaderText="Property" ReadOnly="True" />
                <asp:BoundField DataField="PARCEL NO" HeaderText="Parcel #" ReadOnly="True" />
                <asp:BoundField DataField="PARCEL NAME" HeaderText="Parcel Name" ReadOnly="True" />
                <asp:BoundField DataField="PAYMENT AGREEMENT" HeaderText="Payment Agreement" ReadOnly="True" />
                <asp:BoundField DataField="TOT_AMT_DUE" HeaderText="Total Amt Due" ReadOnly="True" />
                <asp:BoundField DataField="RATING" HeaderText="Rating" ReadOnly="True" />
                <asp:BoundField DataField="GOOD AREA" HeaderText="Good Area" ReadOnly="True" />
                <asp:BoundField DataField="BAD AREA" HeaderText="Bad Area" ReadOnly="True" />
            </Columns>
            <HeaderStyle BackColor="DarkOrange" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <SelectedRowStyle BackColor="Gray" ForeColor="White" Font-Bold="True" />
            <FooterStyle BackColor="LightGray" ForeColor="Blue" />
            <PagerStyle BackColor="DarkOrange" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
    
</div>

</asp:Content>