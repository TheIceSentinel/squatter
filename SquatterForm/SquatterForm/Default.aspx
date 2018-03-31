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
<h2>Filters Will Go Here.</h2>
<!--End of Filters-->

<!-- Gridview for DTP Database -->
<div class="jumbotron">
    <h1>DTP Data</h1>
    <p class="lead">Here is where you data will be displayed.</p>
        <asp:SqlDataSource ID="grdDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TaxRollConnection %>" 
            SelectCommand="SELECT [DueDate], [Address1], [Address2], [City], [StateAbbr], [ZipCode], [AmntDue], [IsSafe], [HasPayAgreement] 
                             FROM [TaxRoll] 
                            WHERE ([AmntDue] &lt; @AmntDue)
                            ORDER BY [DueDate] DESC">
            <SelectParameters>
                <asp:ControlParameter Name="AmntDue" Type="Int32"
                    ControlID="ddlTotalAmountDue" PropertyName="SelectedValue" />
                <%--<asp:ControlParameter Name="ZipCode" Type="Int32" 
                    ControlID="lbZipCode" PropertyName="SelectedValue" />--%>
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
<div class='tableauPlaceholder' id='viz1520995342317' style='position: relative'>
    <noscript>
        <a href='#'>
            <img alt='Dashboard 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;DT&#47;DTP_1&#47;Dashboard1&#47;1_rss.png' 
                style='border: none' />
        </a>
    </noscript>
    <object class='tableauViz'  style='display:none;'>
        <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
        <param name='embed_code_version' value='3' />
        <param name='site_root' value='' />
        <param name='name' value='DTP_1&#47;Dashboard1' />
        <param name='tabs' value='no' />
        <param name='toolbar' value='yes' />
        <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;DT&#47;DTP_1&#47;Dashboard1&#47;1.png' />
        <param name='animate_transition' value='yes' />
        <param name='display_static_image' value='yes' />
        <param name='display_spinner' value='yes' />
        <param name='display_overlay' value='yes' />
        <param name='display_count' value='yes' />
    </object>
</div>
    <script type='text/javascript'>
        var divElement = document.getElementById('viz1520995342317');
        var vizElement = divElement.getElementsByTagName('object')[0];
        vizElement.style.width = '1000px'; vizElement.style.height = '827px';
        var scriptElement = document.createElement('script');
        scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
        vizElement.parentNode.insertBefore(scriptElement, vizElement);
    </script>
</asp:Content>
