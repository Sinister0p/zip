<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Record Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Student Record Management</h2>
        Student Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br /><br />
        Course: <asp:TextBox ID="txtCourse" runat="server"></asp:TextBox>
        <br /><br />
        Age: <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnInsert" runat="server" Text="Insert Record" OnClick="btnInsert_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        <hr />
        <h3>Student Records</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="ID" />
                <asp:BoundField DataField="StudentName" HeaderText="Name" />
                <asp:BoundField DataField="Course" HeaderText="Course" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:CommandField ShowDeleteButton="True" HeaderText="Action" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

<script runat="server">
    // The page tries these SQL Server names one by one and uses the first that works
    string[] servers = { @"(localdb)\MSSQLLocalDB", @".\SQLEXPRESS", @"(local)", @"localhost" };

    string FindServer()
    {
        if (Session["sqlserver"] != null)
            return (string)Session["sqlserver"];

        foreach (string s in servers)
        {
            try
            {
                using (SqlConnection c = new SqlConnection("Data Source=" + s + ";Initial Catalog=master;Integrated Security=True;Connect Timeout=5"))
                {
                    c.Open();
                }
                Session["sqlserver"] = s;
                return s;
            }
            catch (Exception) { }
        }
        throw new Exception("No SQL Server found. Install or start SQL Server Express / LocalDB.");
    }

    string ConnStr()
    {
        return "Data Source=" + FindServer() + ";Initial Catalog=CollegeDB;Integrated Security=True";
    }

    // Creates the database and the table if they do not exist yet
    void EnsureDatabase()
    {
        using (SqlConnection c = new SqlConnection("Data Source=" + FindServer() + ";Initial Catalog=master;Integrated Security=True"))
        {
            c.Open();
            SqlCommand cmd = new SqlCommand("IF DB_ID('CollegeDB') IS NULL CREATE DATABASE CollegeDB", c);
            cmd.ExecuteNonQuery();
        }
        using (SqlConnection c = new SqlConnection(ConnStr()))
        {
            c.Open();
            SqlCommand cmd = new SqlCommand(
                "IF OBJECT_ID('dbo.Students','U') IS NULL " +
                "CREATE TABLE dbo.Students (StudentID INT IDENTITY(1,1) PRIMARY KEY, " +
                "StudentName VARCHAR(100) NOT NULL, Course VARCHAR(50) NOT NULL, Age INT)", c);
            cmd.ExecuteNonQuery();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                EnsureDatabase();
                LoadStudents();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
        }
    }

    // INSERT RECORD
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        int age;
        if (txtName.Text.Trim() == "" || txtCourse.Text.Trim() == "" || !int.TryParse(txtAge.Text, out age))
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please enter name, course and a valid numeric age.";
            return;
        }

        try
        {
            using (SqlConnection con = new SqlConnection(ConnStr()))
            {
                string query = "INSERT INTO Students (StudentName, Course, Age) VALUES (@Name, @Course, @Age)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Course", txtCourse.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", age);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Record inserted successfully.";
            txtName.Text = "";
            txtCourse.Text = "";
            txtAge.Text = "";
            LoadStudents();
        }
        catch (Exception ex)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = ex.Message;
        }
    }

    // DISPLAY RECORDS
    void LoadStudents()
    {
        using (SqlConnection con = new SqlConnection(ConnStr()))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Students", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    // DELETE RECORD
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int studentID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(ConnStr()))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Students WHERE StudentID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", studentID);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Record deleted successfully.";
            LoadStudents();
        }
        catch (Exception ex)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = ex.Message;
        }
    }
</script>
