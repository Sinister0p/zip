<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar Difference</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br /><br />
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Calculate Difference" OnClick="Button1_Click" />
            <br /><br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Calendar1.SelectedDate == DateTime.MinValue || Calendar2.SelectedDate == DateTime.MinValue)
        {
            Label1.Text = "Please select a date in both calendars first.";
            return;
        }
        TimeSpan diff = Calendar2.SelectedDate - Calendar1.SelectedDate;
        Label1.Text = "Difference between dates: " + Math.Abs(diff.Days) + " Days";
    }
</script>
