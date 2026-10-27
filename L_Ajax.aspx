<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AJAX Student Result Calculator</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <h2>Student Result Calculator using AJAX</h2>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                Student Name: <asp:TextBox ID="txtName" runat="server" />
                <br /><br />
                Python Marks: <asp:TextBox ID="txtPython" runat="server" />
                <br /><br />
                ASP.NET Marks: <asp:TextBox ID="txtAsp" runat="server" />
                <br /><br />
                Database Marks: <asp:TextBox ID="txtDB" runat="server" />
                <br /><br />
                <asp:Button ID="btnCalculate" runat="server" Text="Calculate Result" OnClick="btnCalculate_Click" />
                <br /><br />
                <asp:Label ID="lblResult" runat="server" Font-Bold="true"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <b>Calculating result...</b>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>

<script runat="server">
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);   // small delay so "Calculating result..." is visible

        int python, asp, db;

        // Check whether entered values are valid numbers
        if (int.TryParse(txtPython.Text, out python) &&
            int.TryParse(txtAsp.Text, out asp) &&
            int.TryParse(txtDB.Text, out db))
        {
            // Check valid marks range
            if (python >= 0 && python <= 100 && asp >= 0 && asp <= 100 && db >= 0 && db <= 100)
            {
                int total = python + asp + db;
                double percentage = total / 3.0;
                string grade;
                string result;

                if (python < 40 || asp < 40 || db < 40)
                {
                    result = "FAIL";
                    grade = "F";
                }
                else
                {
                    result = "PASS";
                    if (percentage >= 75) grade = "A+";
                    else if (percentage >= 60) grade = "A";
                    else if (percentage >= 50) grade = "B";
                    else grade = "C";
                }

                lblResult.Text =
                    "Student Name: " + txtName.Text +
                    "<br/>Total Marks: " + total + " / 300" +
                    "<br/>Percentage: " + percentage.ToString("0.00") + "%" +
                    "<br/>Grade: " + grade +
                    "<br/>Result: " + result;
            }
            else
            {
                lblResult.Text = "Please enter marks between 0 and 100.";
            }
        }
        else
        {
            lblResult.Text = "Please enter valid numeric marks.";
        }
    }
</script>
