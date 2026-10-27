<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar Vacation</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender"></asp:Calendar>
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        // Vacation day = 21st of the current month (change the 21 to any day you like)
        DateTime vacation = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 21);
        if (e.Day.Date == vacation)
        {
            e.Cell.BackColor = System.Drawing.Color.Yellow;
            e.Cell.Controls.Add(new LiteralControl("<br/>Vacation"));
        }
    }
</script>
