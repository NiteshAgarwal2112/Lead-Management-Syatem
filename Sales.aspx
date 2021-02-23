<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div style="margin-top:50px;">
        <div>
     <asp:GridView ID="GridView1" runat="server"
          AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Personid" DataSourceID="LibraryDb" Height="157px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="832px" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HorizontalAlign="Center" RowHeaderColumn="Personid" AlternatingRowStyle-BorderStyle="Solid" BorderColor="#63545B" BorderStyle="Inset" BorderWidth="5px" CssClass="table-hover" Caption='<table border="1" width="100%" cellpadding="0" cellspacing="0" bgcolor="yellow"><tr><td class="SaleHead">Sales Person List</td></tr></table>'
CaptionAlign="Top">
        <Columns>
           <asp:BoundField DataField="Personid" HeaderText="Personid" InsertVisible="False" ReadOnly="True" SortExpression="Personid" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" FooterStyle-HorizontalAlign="NotSet" FooterStyle-VerticalAlign="NotSet" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:BoundField DataField="Empid" HeaderText="Empid" SortExpression="Empid" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="gridHeader" />
            <asp:CommandField   ShowEditButton="True" ControlStyle-CssClass="btn btn-warning gridbutton" HeaderStyle-CssClass="gridHeader"/>
            <asp:CommandField   ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger gridbutton" HeaderStyle-CssClass="gridHeader"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="LibraryDb" runat="server" ConnectionString="<%$ ConnectionStrings:Salesinfo %>" 
                DeleteCommand="DELETE From [Account] WHERE Personid = @Personid"
                UpdateCommand="UPDATE [Account] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email]=@Email, [Phone]=@Phone, [Empid]=@Empid  WHERE [Personid] = @Personid" OnSelecting="LibraryDb_Selecting">
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
                        <asp:TextBox runat="server" ID="FirstName" placeholder="First Name" required  CssClass="form-control"/>
                    </td>
              </tr>
              <tr>
                   
                  <td>
                      <asp:TextBox runat="server" ID="LastName"  placeholder="Last Name" required  CssClass="form-control"/>
                  </td>
              </tr>
              <tr>
                   
                  <td>
                      <asp:TextBox runat="server" ID="Email"  placeholder="Email ID" required  CssClass="form-control"/>
                  </td>
              </tr>
              <tr>
                 
                  <td>
                      <asp:TextBox runat="server" ID="Phone"  placeholder="Phone" required  CssClass="form-control"/>
                  </td>
              </tr>
              <tr>
                  
                  <td>
                      <asp:TextBox runat="server" ID="Empid" class="form-control" placeholder="Employee ID" required  CssClass="form-control"/>
                  </td>
              </tr>
          </table>
        </div>
        <div class="modal-footer">
            <asp:Button 
                        ID="Submit" runat="server" CssClass="logButton" Text="Submit" onclick="Submitsale_Click"/>&nbsp;</div>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
 </center>

</asp:Content>