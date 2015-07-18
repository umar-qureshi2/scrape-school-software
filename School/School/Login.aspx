<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="School.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>School</title>
    <link rel="icon" type="image/gif" href="images/gnome.png" />
    <link href="css/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <h1>USER LOG IN</h1>
  <div class="inset">
  <p>
    <label for="email">USERNAME</label>
    <input type="text" name="email" id="username" runat="server">
  </p>
  <p>
    <label for="password">PASSWORD</label>
    <input type="password" name="password" runat="server" id="password">
  </p>
  <p>
    <input type="checkbox" name="remember" id="remember">
    <label for="remember">Remember me</label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
  </p>
  </div>
  <p class="p-container">
    <span>Forgot password ?</span>
   <button type="submit" onserverclick="Loginc" class="pure-button pure-button-primary" runat="server">Login</button>
   </p>
</form>
</body>
</html>
