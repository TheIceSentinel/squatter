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
                    SelectionMode="Single" CssClass="form-control" Rows="5" 
                    DataSourceID="ZipFilterSource" 
                    DataTextField="ZipCode" DataValueField="ZipCode">
                </asp:ListBox>
                <asp:SqlDataSource ID="ZipFilterSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TaxRollConnection %>" 
                    SelectCommand="SELECT DISTINCT [ZipCode] 
                                     FROM [TaxRoll]
                                    ORDER BY [ZipCode]">
                </asp:SqlDataSource>
            </div>
            
       <!--Update 03/09/2018 Changed around stuff a little bit here, if anyone has input we can change-->
            <div class="col-sm-3" style="left: 0px; top: 20px">
                <label class="control-label">Total Amount Owed</label>
                <asp:DropDownList ID="ddlTotalAmountDue" runat="server" 
                    CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem Text="< $10,000" Value="10000" />
                    <asp:ListItem Text="< $25,000" Value="25000" />
                    <asp:ListItem Text="< $50,000" Value="50000" />
                    <asp:ListItem Text="< $75,000" Value="75000" />
                    <asp:ListItem Text="< $100,000" Value="100000" Selected="True"/>
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
                    <asp:ListItem>Top 10 Areas Only</asp:ListItem> <%--by what metric?--%>
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
        <asp:SqlDataSource ID="grdDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TaxRollConnection %>" 
            SelectCommand="SELECT [DueDate], [Address1], [Address2], [Address3], [Address4], [City], [StateAbbr], [ZipCode], [AmntDue], [IsSafe], [HasPayAgreement] 
                             FROM [TaxRoll] 
                            WHERE ([AmntDue] &lt; @AmntDue) AND ([ZipCode] = @ZipCode)
                            ORDER BY [DueDate] DESC">
            <SelectParameters>
                <asp:ControlParameter Name="AmntDue" Type="Int32"
                    ControlID="ddlTotalAmountDue" PropertyName="SelectedValue" />
                <asp:ControlParameter Name="ZipCode" Type="Int32" 
                    ControlID="lbZipCode" PropertyName="GetEnumerator" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="grdDTPData" runat="server" Height="10px"
            AutoGenerateColumns="False" AutoGenerateRows="True"
            CssClass="table table-bordered table-striped table-condensed" 
            AllowPaging="True" DataSourceID="grdDataSource">
            <Columns>
                <asp:BoundField DataField="DueDate" HeaderText="Date Due" SortExpression="DueDate" />
                <asp:BoundField DataField="Address1" HeaderText="Owner" SortExpression="Address1" />
                <asp:BoundField DataField="Address2" HeaderText="Address" SortExpression="Address2" />
                <asp:BoundField DataField="Address3" HeaderText="Line 2" SortExpression="Address3" />
                <asp:BoundField DataField="Address4" HeaderText="Line 3" SortExpression="Address4" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="StateAbbr" HeaderText="State" SortExpression="StateAbbr" />
                <asp:BoundField DataField="ZipCode" HeaderText="Zip" SortExpression="ZipCode" />
                <asp:BoundField DataField="AmntDue" HeaderText="Amount Due" SortExpression="AmntDue" />
                <%--<asp:BoundField DataField="ROLL-CODE" HeaderText="Property" ReadOnly="True" />--%>
                <%--<asp:BoundField DataField="PARCEL NO" HeaderText="Parcel #" ReadOnly="True" />--%>
                <%--<asp:BoundField DataField="PARCEL NAME" HeaderText="Parcel Name" ReadOnly="True" />--%>
                <%--<asp:BoundField DataField="RATING" HeaderText="Rating" ReadOnly="True" />--%>
                <%--<asp:BoundField DataField="GOOD AREA" HeaderText="Good Area" ReadOnly="True" />--%>
                <%--<asp:BoundField DataField="BAD AREA" HeaderText="Bad Area" ReadOnly="True" />--%>
                <asp:CheckBoxField DataField="IsSafe" HeaderText="Safe" SortExpression="IsSafe" />
                <asp:CheckBoxField DataField="HasPayAgreement" HeaderText="Agreement" SortExpression="HasPayAgreement" />
            </Columns>
            <HeaderStyle BackColor="DarkOrange" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <SelectedRowStyle BackColor="Gray" ForeColor="White" Font-Bold="True" />
            <FooterStyle BackColor="LightGray" ForeColor="Blue" />
            <PagerStyle BackColor="DarkOrange" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
    
</div>

</asp:Content>
