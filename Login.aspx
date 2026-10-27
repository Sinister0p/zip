<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Session State</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Login Form</h2>
        Username: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <br /><br />
        Password: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>

<script runat="server">
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;

        // Username: admin   Password: 1234
        if (username == "admin" && password == "1234")
        {
            Session["Username"] = username;
            Response.Redirect("Welcome.aspx");
        }
        else
        {
            lblMessage.Text = "Invalid Username or Password";
        }
    }
</script>
