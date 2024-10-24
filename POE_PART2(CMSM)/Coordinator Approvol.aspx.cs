using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POE_PART2_CMSM_
{
    public partial class Coordinator_Approvol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization code here, if needed
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Code for handling selected index change
            int selectedRowIndex = GridView1.SelectedIndex;
            GridViewRow row = GridView1.SelectedRow;

            // Example: Access the data of the selected row
            string claimID = row.Cells[0].Text;  // Assuming Claim_ID is now visible and is the first column
            string lecturerID = row.Cells[1].Text;  // Lecturer_ID
            string lecturerName = row.Cells[2].Text;  // Lecturer_Name

            // Perform any action based on the selected row (e.g., display in a label or log it)
        }

        protected void ApproveClaim_Click(object sender, EventArgs e)
        {
            string claimID = ((Button)sender).CommandArgument;
            UpdateClaimStatus(claimID, "Coordinator_Approval", "Approved");

            // Refresh Claim Status page (if needed)
            // Response.Redirect("Claim Status.aspx");
        }

        protected void RejectClaim_Click(object sender, EventArgs e)
        {
            string claimID = ((Button)sender).CommandArgument;
            UpdateClaimStatus(claimID, "Coordinator_Approval", "Rejected");

            // Refresh Claim Status page (if needed)
            // Response.Redirect("Claim Status.aspx");
        }

        private void UpdateClaimStatus(string claimID, string approvalField, string status)
        {
            // Corrected to match the connection string in the front-end (.aspx file)
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["POE_PART2ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand($"UPDATE Claims_TBL SET {approvalField} = @Status WHERE Claim_ID = @ClaimID", con))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@ClaimID", claimID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}