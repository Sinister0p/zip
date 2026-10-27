<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Server Controls</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="ViewState Data : "></asp:Label>
            <asp:Label ID="lblstr" runat="server" Text="Sample Text"></asp:Label>
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Get Data" OnClick="Button1_Click" />
            <br /><br />
            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
                <asp:ListItem>C#</asp:ListItem>
                <asp:ListItem>C++</asp:ListItem>
                <asp:ListItem>Java</asp:ListItem>
                <asp:ListItem>C</asp:ListItem>
            </asp:ListBox>
            <br /><br />
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="5" Columns="25"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button2" runat="server" Text="Show" OnClick="Button2_Click" />
            <br /><br />
            Select Color :
            <asp:RadioButton ID="RadioButton1" runat="server" Text="Red" GroupName="Color" AutoPostBack="True" OnCheckedChanged="Color_Changed" />
            <asp:RadioButton ID="RadioButton2" runat="server" Text="Green" GroupName="Color" AutoPostBack="True" OnCheckedChanged="Color_Changed" />
            <asp:RadioButton ID="RadioButton3" runat="server" Text="Blue" GroupName="Color" AutoPostBack="True" OnCheckedChanged="Color_Changed" />
            <br /><br />
            Select Formatting :
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Bold" AutoPostBack="True" OnCheckedChanged="Format_Changed" />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="Italic" AutoPostBack="True" OnCheckedChanged="Format_Changed" />
            <asp:CheckBox ID="CheckBox3" runat="server" Text="Underline" AutoPostBack="True" OnCheckedChanged="Format_Changed" />
            <br /><br />
            Select Size :
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>40</asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            Select Name :
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem>Ajay</asp:ListItem>
                <asp:ListItem>Aditya</asp:ListItem>
                <asp:ListItem>Anand</asp:ListItem>
                <asp:ListItem>Shiv</asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            <asp:Label ID="Label6" runat="server" Text="Photo :"></asp:Label>
            <br />
            <asp:Image ID="Image1" runat="server" Width="160px" AlternateText="Photo" ImageUrl="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKAAAABkCAIAAACO1KzYAAACFklEQVR4nO3dwUkDYRRF4T9iCa5dWYaVWIRrS3BtBRZmMS4GgkSSiJmZ/97DOWuRx/t4mYDEHB5fPodxu5s9gG2bwPAEhicwPIHhCQxPYHgCwxMYnsDwBIYnMDyB4QkM7372AJv39fp++QeePt72mWRKB+Tfg6+inouHTQP+N+3PSMwQ4FVcfweQJrzJ2kh309+8W90XvBtA7ykXX/Ce59V7yq3A+2+81LgSeNauG437gOduuc64DDhhvwkz/L0m4JzN5kxytRrgtJ2mzXOuDuDMbWZOdVIHsP27AuDkQ0mebSkdOH+D4ROmA9uNCQwvGjj81e9Y8pzRwHZ7ucDJZ/G72GlzgW2VBIYnMLxQ4NhH2oUyZw4FtrUSGJ7A8ASGJzA8geEJDE9geALDExheKHDjxzUzZw4FtrUSGJ7A8HKBMx9p54qdNhfYVikaOPYsTkqeMxrYbk9geOnAya9+S+ETpgOP7A0mz7ZUAGy31AGceSiZU53UATzytpk2z7lqgEfSTnMmuVoT8MjYbMIMf68MeMzeb5fuaAQe87ZcpztKgceMXTfqjl7gse/GS3VH+7/0X9r0c5u9tEvFF3xsO4N23cG44J/5vUkn0YCX/OazY4eHt+fZM9iGEZ7BdiGB4QkMT2B4AsMTGJ7A8ASGJzA8geEJDE9geALDExiewPAEhicwPIHhCQxPYHgCwxMYnsDwBIb3DRLYdkps8P4xAAAAAElFTkSuQmCC" />
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["name"] = "Ajay";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblstr.Text = ViewState["name"].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        foreach (ListItem item in ListBox1.Items)
        {
            if (item.Selected)
            {
                TextBox1.Text += item.Text + Environment.NewLine;
            }
        }
    }

    protected void Color_Changed(object sender, EventArgs e)
    {
        if (RadioButton1.Checked) lblstr.BackColor = System.Drawing.Color.Red;
        else if (RadioButton2.Checked) lblstr.BackColor = System.Drawing.Color.Green;
        else if (RadioButton3.Checked) lblstr.BackColor = System.Drawing.Color.Blue;
    }

    protected void Format_Changed(object sender, EventArgs e)
    {
        lblstr.Font.Bold = CheckBox1.Checked;
        lblstr.Font.Italic = CheckBox2.Checked;
        lblstr.Font.Underline = CheckBox3.Checked;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblstr.Font.Size = FontUnit.Point(Convert.ToInt32(DropDownList1.SelectedItem.Text));
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblstr.Text = DropDownList2.SelectedItem.Text;
    }
</script>
