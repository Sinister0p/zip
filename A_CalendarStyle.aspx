<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar Style</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="Calendar1" runat="server">
                <SelectedDayStyle BackColor="Blue" ForeColor="White" Font-Bold="True" />
            </asp:Calendar>
        </div>
    </form>
</body>
</html>
