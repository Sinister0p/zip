<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application State</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Application State - Visitor Counter</h2>
        <asp:Button ID="btnVisit" runat="server" Text="Count Visitor" OnClick="btnVisit_Click" />
        <br /><br />
        <asp:Label ID="lblCount" runat="server"></asp:Label>
    </form>
</body>
</html>

<script runat="server">
    protected void btnVisit_Click(object sender, EventArgs e)
    {
        if (Application["VisitorCount"] == null)
        {
            Application["VisitorCount"] = 0;
        }

        int count = (int)Application["VisitorCount"];
        count++;
        Application["VisitorCount"] = count;
        lblCount.Text = "Total Visitors: " + count;
    }
</script>
