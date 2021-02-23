<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="home">
        
    </div>
    <div class="homeimage"></div>
    <div class="welcome"><h1>WELCOME</h1></div>
    <div class="user"><h1><%=Session["Name"].ToString().ToUpper()%></h1></div>
</asp:Content>

