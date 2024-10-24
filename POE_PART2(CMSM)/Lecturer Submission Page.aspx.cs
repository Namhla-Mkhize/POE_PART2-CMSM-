using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POE_PART2_CMSM_
{
    public partial class Lecturer_Submission_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization code here
        }

        protected void SubmitClaim_Click(object sender, EventArgs e)
        {
            // Step 1: Validate the input fields
            if (string.IsNullOrEmpty(txtLecturerID.Text) || string.IsNullOrEmpty(txtLecturerName.Text) ||
                string.IsNullOrEmpty(txtHoursWorked.Text) || string.IsNullOrEmpty(txtBaseRate.Text) ||
                string.IsNullOrEmpty(txtProgramCode.Text) || string.IsNullOrEmpty(txtModuleName.Text))
            {
                ShowMessage("Please fill in all fields before submitting.", false);
                return;
            }

            // Step 2: Collect the data from the input fields
            string lecturerID = txtLecturerID.Text;
            string lecturerName = txtLecturerName.Text;
            string hoursWorked = txtHoursWorked.Text;
            string baseRate = txtBaseRate.Text;
            string programCode = txtProgramCode.Text;
            string moduleName = txtModuleName.Text;

            // Step 3: Handle file upload (if file is provided)
            string fileName = "";
            string filePath = "";

            if (fileUpload.HasFile)
            {
                // Optional: Validate file size (limit to 10MB)
                if (fileUpload.PostedFile.ContentLength > 10 * 1024 * 1024) // 10MB
                {
                    ShowMessage("File size must be less than 10MB.", false);
                    return;
                }

                // Optional: Validate file type (only allow certain file types)
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension != ".pdf" && fileExtension != ".docx" && fileExtension != ".jpg" && fileExtension != ".png")
                {
                    ShowMessage("Only PDF, DOCX, JPG, and PNG files are allowed.", false);
                    return;
                }

                // Get the file name
                fileName = Path.GetFileName(fileUpload.PostedFile.FileName);

                // Set the path to save the file on the server
                filePath = "~/UploadedFiles/" + fileName;

                // Save the file on the server
                try
                {
                    fileUpload.SaveAs(Server.MapPath(filePath));
                }
                catch (Exception ex)
                {
                    ShowMessage("File upload failed: " + ex.Message, false);
                    return;
                }
            }

            // Step 4: Insert the claim details into the database
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["POE_PART2ConnectionString"].ConnectionString))
                {
                    string query = "INSERT INTO Claims_TBL (Lecturer_ID, Lecturer_Name, Hours_Worked, Base_Rate, Program_Code, Module_Name, FileName, FilePath) " +
                                   "VALUES (@LecturerID, @LecturerName, @HoursWorked, @BaseRate, @ProgramCode, @ModuleName, @FileName, @FilePath)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to avoid SQL injection
                        cmd.Parameters.AddWithValue("@LecturerID", lecturerID);
                        cmd.Parameters.AddWithValue("@LecturerName", lecturerName);
                        cmd.Parameters.AddWithValue("@HoursWorked", hoursWorked);
                        cmd.Parameters.AddWithValue("@BaseRate", baseRate);
                        cmd.Parameters.AddWithValue("@ProgramCode", programCode);
                        cmd.Parameters.AddWithValue("@ModuleName", moduleName);
                        cmd.Parameters.AddWithValue("@FileName", fileName);
                        cmd.Parameters.AddWithValue("@FilePath", filePath);

                        // Open the connection, execute the command, and close the connection
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                // Step 5: Clear the input fields and show success message
                ClearFields();
                ShowMessage("Claim submitted successfully!", true);
            }
            catch (Exception ex)
            {
                ShowMessage("An error occurred while submitting the claim: " + ex.Message, false);
            }
        }

        // A helper function to clear the form fields
        private void ClearFields()
        {
            txtLecturerID.Text = "";
            txtLecturerName.Text = "";
            txtHoursWorked.Text = "";
            txtBaseRate.Text = "";
            txtProgramCode.Text = "";
            txtModuleName.Text = "";
            fileUpload.Attributes.Clear(); // Reset the file upload control
        }

        // A helper function to display feedback messages
        private void ShowMessage(string message, bool isSuccess)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = isSuccess ? System.Drawing.Color.Green : System.Drawing.Color.Red;
        }
    }
}