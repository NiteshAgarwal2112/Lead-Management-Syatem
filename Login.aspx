<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Content/style.css"/>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
</head>
<body>
    <div class="container-fluid">
            <div class="image1"><</div>
            <div class="loginform">
             <form id="form1" runat="server">
                <div class="logindiv" style="padding-top:50px;"><h1>Lead Management System</h1></div>
                <div class="logindiv">
                    <img src="Loginimages1.png" width=150px height=150px alt="" /></div>
                <div class="container">
                    <input type="text" runat="server" placeholder="Enter Username" id="uname" required autofocus/>
                    <input type="password" runat="server" placeholder="Enter Password" id="psw" required />
                    <asp:Button 
                        ID="Logbutton" runat="server" CssClass="logButton" Text="Login" OnClick="Logbutton_Click"  /></div>        
            </form>
                 </div>
   
        </div>
</body>
</html>
