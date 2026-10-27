<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cookies</title>
</head>
<body id="BodyTag" runat="server">
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ColorSelector" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ColorSelector_IndexChanged">
                <asp:ListItem Value="white" Selected="True">Select colour</asp:ListItem>
                <asp:ListItem Value="red">red</asp:ListItem>
                <asp:ListItem Value="green">green</asp:ListItem>
                <asp:ListItem Value="blue">blue</asp:ListItem>
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.Cookies["BackgroundColor"] != null)
        {
            ColorSelector.SelectedValue = Request.Cookies["BackgroundColor"].Value;
        }
        BodyTag.Style["background-color"] = ColorSelector.SelectedValue;
    }

    protected void ColorSelector_IndexChanged(object sender, EventArgs e)
    {
        BodyTag.Style["background-color"] = ColorSelector.SelectedValue;
        HttpCookie cookie = new HttpCookie("BackgroundColor");
        cookie.Value = ColorSelector.SelectedValue;
        cookie.Expires = DateTime.Now.AddDays(1);
        Response.Cookies.Add(cookie);
    }
</script>
