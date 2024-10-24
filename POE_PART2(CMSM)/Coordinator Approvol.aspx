<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coordinator Approvol.aspx.cs" Inherits="POE_PART2_CMSM_.Coordinator_Approvol" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coordinator Approval</title> 
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" runat="server" href="~/">Claim Management System</a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                    <ul class="navbar-nav flex-grow-1">
                         class="navbar-nav flex-grow-1">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Lecturer Submission Page">Claim Submission</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Claim Status">Claim Status</a></li> 
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Coordinator Approvol">Coordinator Approval</a></li> 
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Manager Approval">Manager Approval</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Claim_ID" HeaderText="Claim ID" Visible="True" />
                <asp:BoundField DataField="Lecturer_ID" HeaderText="Lecturer ID" />
                <asp:BoundField DataField="Lecturer_Name" HeaderText="Lecturer Name" />
                <asp:BoundField DataField="Hours_Worked" HeaderText="Hours Worked" />
                <asp:BoundField DataField="Base_Rate" HeaderText="Base Rate" />
                <asp:BoundField DataField="Program_Code" HeaderText="Program Code" />
                <asp:BoundField DataField="Module_Name" HeaderText="Module Name" />
                <asp:BoundField DataField="FileName" HeaderText="File Name" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandArgument='<%# Eval("Claim_ID") %>' OnClick="ApproveClaim_Click" />
                        <asp:Button ID="btnReject" runat="server" Text="Reject" CommandArgument='<%# Eval("Claim_ID") %>' OnClick="RejectClaim_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:POE_PART2ConnectionString %>"
            SelectCommand="SELECT [Claim_ID], [Lecturer_ID], [Lecturer_Name], [Hours_Worked], [Base_Rate], [Program_Code], [Module_Name], [FileName], [Date_Submitted], [FilePath] FROM [Claims_TBL]">
        </asp:SqlDataSource>
    </form>
</body>
</html>