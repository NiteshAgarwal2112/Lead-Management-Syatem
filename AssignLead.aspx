<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="AssignLead.aspx.cs" Inherits="AssignLead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center>
    <div style="margin-top:50px;">
        <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Leadid" DataSourceID="SqlDataSource1" Height="157px" Width="832px" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HorizontalAlign="Center" RowHeaderColumn="Personid" AlternatingRowStyle-BorderStyle="Solid" BorderColor="#63545B" BorderStyle="Inset" BorderWidth="5px" CssClass="table-hover" Caption='<table border="1" width="100%" cellpadding="0" cellspacing="0" bgcolor="yellow"><tr><td class="SaleHead">Sales Person List</td></tr></table>'
        CaptionAlign="Top">
        <Columns>
            <asp:BoundField DataField="Leadid" HeaderText="Leadid" InsertVisible="False" ReadOnly="True" SortExpression="Leadid" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader"/>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" ReadOnly="True"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" ReadOnly="True"/>
            <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" ReadOnly="True"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" ReadOnly="True"/>
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" ReadOnly="True"/>
            <asp:BoundField DataField="LeadScore" HeaderText="LeadScore" SortExpression="LeadScore" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" ReadOnly="True"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:App %>" ProviderName="<%$ ConnectionStrings:App.ProviderName %>"  OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        </div>
    </div>
  </center>
</asp:Content>

