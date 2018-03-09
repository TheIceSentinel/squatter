<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SquatterForm._Default" %>

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
    <!-- 03/09/2018 Updated Zip Codes, they are in decsending order-->
<div class="panel panel-default">
    <div class="panel-heading">Filters</div>
    <div class="panel-body">
        <div class="form-group">
            <div class="col-sm-3">
                <label class="control-label">Zip Code</label>
                <asp:ListBox ID="lbZipCode" runat="server" 
                    SelectionMode="Multiple" CssClass="form-control" 
                    Rows="5" AutoPostBack="True">
                    <asp:ListItem>75205</asp:ListItem>
                    <asp:ListItem>75225</asp:ListItem>
                    <asp:ListItem>75209</asp:ListItem>
                    <asp:ListItem>75230</asp:ListItem>
                    <asp:ListItem>75201</asp:ListItem>
                    <asp:ListItem>75254</asp:ListItem>
                    <asp:ListItem>75203</asp:ListItem>
                    <asp:ListItem>75214</asp:ListItem>
                    <asp:ListItem>75219</asp:ListItem>
                    <asp:ListItem>75220</asp:ListItem>
                </asp:ListBox>
            </div>
            
       <!--Update 03/09/2018 Changed around stuff a little bit here, if anyone has input we can change-->
            <div class="col-sm-3" style="left: 0px; top: 20px">
                <label class="control-label">Total Amount Owed</label>
                <asp:DropDownList ID="ddlTotalAmountDue" runat="server" 
                    CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem> less than $10,000</asp:ListItem>
                    <asp:ListItem> less than $25,000</asp:ListItem>
                    <asp:ListItem> less than $50,000</asp:ListItem>
                    <asp:ListItem> less than $75,000</asp:ListItem>
                    <asp:ListItem> less than $100,000</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!--Update 03/09/2018 Added the full words, we can revert if we need to-->
            <div class="col-sm-2">
                <label class="control-label">Properties with Payment Agreements</label>
                <asp:DropDownList ID="ddlPaymentAgreement" runat="server" 
                    CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <!--Update 03/09/2018 Changed this up a bit-->
            <div class="col-sm-2s">
                <label class="control-label">Specific Area Selection</label>
                <asp:CheckBoxList ID="cblArea" runat="server" 
                    CssClass="form-control"
                    AutoPostBack="True" Height="34px">
                    <asp:ListItem>Top 10 Areas Only</asp:ListItem>
                    <asp:ListItem>Higher Risk Areas</asp:ListItem>
                    <asp:ListItem>Include All Areas</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            
            <br />
            <br />
             <!-- This will replace the Rating System for now. This is the same thing as zip codes,
            but instead I am using the name of the area, these areas have the following zip codes
            from the top down 75205, 75225, 75209, 75230, this will help us to code. -->
            <div class="col-sm-3" style="left: 0px; top: 20px">
                <label class="control-label">Specific Area of Dallas</label>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem>University Park </asp:ListItem> 
                    <asp:ListItem>Highland Park</asp:ListItem> 
                    <asp:ListItem>Uptown</asp:ListItem>
                    <asp:ListItem>North Dallas</asp:ListItem>
                </asp:DropDownList>
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
