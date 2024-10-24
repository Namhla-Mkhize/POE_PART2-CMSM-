<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Claim Status.aspx.cs" Inherits="POE_PART2_CMSM_.Claim_Status" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Claim Status</title>
    <style>
        .auto-style1 { width: 100%; }
        .auto-style2 { text-align: center; }
    </style> 
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> <!-- Script Manager for AJAX -->

        <!-- Use UpdatePanel to refresh only the GridView when needed -->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridViewStatus" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStatus" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="GridViewStatus_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Lecturer_ID" HeaderText="Lecturer ID" />
                        <asp:BoundField DataField="Lecturer_Name" HeaderText="Lecturer Name" />
                        <asp:BoundField DataField="Hours_Worked" HeaderText="Hours Worked" />
                        <asp:BoundField DataField="Base_Rate" HeaderText="Base Rate" />
                        <asp:BoundField DataField="Program_Code" HeaderText="Program Code" />
                        <asp:BoundField DataField="Module_Name" HeaderText="Module Name" />
                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                        <asp:BoundField DataField="FilePath" HeaderText="File Path" />
                        <asp:BoundField DataField="Coordinator_Approval" HeaderText="Coordinator Approval" />
                        <asp:BoundField DataField="Manager_Approval" HeaderText="Manager Approval" />
                        <asp:BoundField DataField="Date_Submitted" HeaderText="Date Submitted" />
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
                
                <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server"
                    ConnectionString="<%$ ConnectionStrings:POE_PART2ConnectionString %>"
                    SelectCommand="SELECT [Lecturer_ID], [Lecturer_Name], [Hours_Worked], [Base_Rate], [Program_Code], [Module_Name], [FileName], [FilePath], [Coordinator_Approval], [Manager_Approval], [Date_Submitted] FROM [Claims_TBL]">
                </asp:SqlDataSource>
            </ContentTemplate>
            
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="GridViewStatus" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
