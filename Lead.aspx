<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Lead.aspx.cs" Inherits="Lead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
<link rel="stylesheet" type="text/css" href="../Content/jquery.datetimepicker.css"/>
    <script src="../Scripts/jquery.js"></script>
        <script src="../Scripts//jquery.datetimepicker.full.js"></script>
    <script>
        /*jslint browser:true*/
        /*global jQuery, document*/

        jQuery(document).ready(function () {
            'use strict';

            jQuery('#<%=CreationDate.ClientID %>').datetimepicker();
            jQuery('#<%=InteractionTime.ClientID %>').datetimepicker();
        });
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div style="margin-top:50px;">
        <div>
            <asp:GridView ID="GridView1" runat="server" 
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Leadid" DataSourceID="LibraryDb" Height="157px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="832px" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HorizontalAlign="Center" RowHeaderColumn="Personid" AlternatingRowStyle-BorderStyle="Solid" BorderColor="#63545B" BorderStyle="Inset" BorderWidth="5px" CssClass="table-hover" Caption='<table border="1" width="100%" cellpadding="0" cellspacing="0" bgcolor="yellow"><tr><td class="SaleHead">Lead Lists</td></tr></table>' CaptionAlign="Top">
        <Columns>
            <asp:BoundField DataField="Leadid" HeaderText="Leadid" ReadOnly="True" SortExpression="Leadid" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="SourceLead" HeaderText="SourceLead" SortExpression="SourceLead" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="CreatDate" HeaderText="CreatDate" SortExpression="CreatDate" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="InteractionType" HeaderText="InteractionType" SortExpression="InteractionType" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="Empid" HeaderText="Empid" SortExpression="Empid" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
            <asp:BoundField DataField="LeadScore" HeaderText="LeadScore" SortExpression="LeadScore" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" /> 
             <asp:CommandField   ShowEditButton="True" ControlStyle-CssClass="btn btn-warning gridbutton" HeaderStyle-CssClass="gridHeader"/>
            <asp:CommandField   ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger gridbutton" HeaderStyle-CssClass="gridHeader"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="LibraryDb" runat="server" ConnectionString="<%$ ConnectionStrings:App %>" ProviderName="<%$ ConnectionStrings:App.ProviderName %>"
      DeleteCommand="DELETE From [Leads] WHERE Leadid = @Leadid"
                UpdateCommand="UPDATE [Leads] SET [Name] = @Name, [Organization] = @Organization, [Email]=@Email, [Phone]=@Phone,[SourceLead]=@SourceLead, [CreatDate]=@CreatDate, [InteractionType]=@InteractionType, [DateTime]=@DateTime, [Details]=@Details,  [Empid]=@Empid  WHERE [Leadid] = @Leadid AND [LeadScore] IN ('Hot','Warm','Cold','') " OnSelecting="LibraryDb_Selecting">
    </asp:SqlDataSource>
</div>
    <div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" runat="server" class="logButton" data-toggle="modal" data-target="#myModal">Add New</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Enter Details</h4>
        </div>
        <div class="modal-body">
          <table border="0" cellpadding="5" cellspacing="5" class="table table-responsive table-striped">
              <tr> 
                    <td>
                        <asp:TextBox runat="server" ID="Name" placeholder="Lead Name" required=""  CssClass="form-control"/>
                    </td>
                  <td>
                      <asp:TextBox runat="server" ID="Organization"  placeholder="Organization" required=""  CssClass="form-control"/>
                  </td>
              </tr>
              <tr>
                   <td>
                      <asp:TextBox runat="server" ID="Email"  placeholder="Email ID" required=""  CssClass="form-control"/>
                  </td>
                   <td>
                      <asp:TextBox runat="server" ID="Phone"  placeholder="Phone" required=""  CssClass="form-control"/>
                  </td>
              </tr>
              <tr>
                   <td>
                      <asp:TextBox runat="server" ID="SourceLead" class="form-control" placeholder="Source of Lead" required  CssClass="form-control"/>
                  </td>
                  <td>
                      <asp:TextBox ID="CreationDate" runat="server" value="Creation Date" ReadOnly = "false" required  CssClass="form-control"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                 <td colspan="2">Lead Activities</td>
              </tr>
              <tr>
                  <td>
       
                      <select name="InteractionType" id="InteractionType" runat="server" Class="form-control">
                          <option>Select Interaction Type</option>
                          <option value="Meeting">Meeting</option>
                          <option value="Email">Email</option>
                          <option value="Call">Call</option>
                      </select>

                  </td>
                  <td>
                      <asp:TextBox ID="InteractionTime" runat="server" value="Date and Time of Interaction" ReadOnly = "FALSE" required  CssClass="form-control"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td colspan="2">Enter Description</td>
              </tr>
              <tr>
                  <td colspan="2">
                  <textarea id="InteractionDetails" Class="form-control" cols="20" rows="2" runat="server"></textarea></td>
              </tr>
              <tr>
                  <td>
                      Assign Leads To
                  </td>
                  <td>  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Empid" DataValueField="Empid" CssClass="form-control">
   
                  </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Salesinfo %>" ProviderName="<%$ ConnectionStrings:Salesinfo.ProviderName %>" SelectCommand="SELECT [Empid] FROM [Account] where [Type]='Sale'"></asp:SqlDataSource>
    </td>
                  
              </tr>
          </table>
        </div>
        <div class="modal-footer">

             <asp:Button 
                        ID="Submit" runat="server" CssClass="logButton" Text="Submit" onclick="SubmitLead_Click"/>&nbsp;</div>
        </div>
      </div>
      
    </div>
  </div>
    </div>    
        </center>       
    </asp:Content>


