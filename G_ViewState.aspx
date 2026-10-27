<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ViewState Demo</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="ViewState Data: "></asp:Label>
            <asp:Label ID="lblStr" runat="server"></asp:Label>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Get Data" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        // Executes only when the page loads for the first time
        if (!IsPostBack)
        {
            string str = "XYZ";
            if (ViewState["nam"] == null)
            {
                ViewState["nam"] = str;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblStr.Text = ViewState["nam"].ToString();
    }
</script>
