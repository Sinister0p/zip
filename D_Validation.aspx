<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Validation Controls</title>
    <script type="text/javascript">
        function ClientValidate(source, args) {
            args.IsValid = (args.Value.length == 8);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Your Name<br />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name." ForeColor="Red"></asp:RequiredFieldValidator>
            <br /><br />
            Enter Age<br />
            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
            <asp:RangeValidator ID="rv1" runat="server" ControlToValidate="txtAge" Type="Integer" MinimumValue="18" MaximumValue="60" ErrorMessage="Age should be between 18 and 60." ForeColor="Red"></asp:RangeValidator>
            <br /><br />
            Password<br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br /><br />
            Confirm Password<br />
            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="cv1" runat="server" ControlToValidate="txtConfirm" ControlToCompare="txtPassword" Operator="Equal" Type="String" ErrorMessage="Passwords do not match." ForeColor="Red"></asp:CompareValidator>
            <br /><br />
            Email<br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid Email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
            <br /><br />
            Custom Text (8 Characters)<br />
            <asp:TextBox ID="txtCustom" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="custv1" runat="server" ControlToValidate="txtCustom" ClientValidationFunction="ClientValidate" OnServerValidate="ServerValidation" ErrorMessage="Text must be exactly 8 characters." ForeColor="Red"></asp:CustomValidator>
            <br /><br />
            <asp:Label ID="lbl1" runat="server" ForeColor="Green"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Validate" OnClick="Button1_Click" />
            <br /><br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lbl1.Text = "Thank You!";
        }
        else
        {
            lbl1.Text = "Please correct the errors.";
        }
    }

    protected void ServerValidation(object source, ServerValidateEventArgs args)
    {
        args.IsValid = (args.Value.Length == 8);
    }
</script>
