<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Squatter._Default" %>

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