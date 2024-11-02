namespace Milage_tracker
{
    public partial class MainMenu : Form
    {
        private bool isClearingText = false; // Flag to prevent the TextChanged event
        public MainMenu()
        {
            InitializeComponent();
        }

        private void begMileInput_TextChanged(object sender, EventArgs e)
        {
            // Skip validation if text is being cleared programmatically
            if (isClearingText) return;
            // Retrieve the current text in the TextBox
            string input = begMileInput.Text;

            // Check if the input is a number (optional)
            if (int.TryParse(input, out int number))
            {
                // Do something with the valid number
                begMile.Text = $"You entered: {number} beggining odometer";
            }
            else if (string.IsNullOrEmpty(input))
            {
                // Handle the case when the TextBox is empty
                begMile.Text = "Please enter a number.";
            }
            else
            {
                // Handle invalid (non-numeric) input
                begMile.Text = "Invalid input! Please enter only numbers.";
            }
            // Call method to update total miles
            UpdateTotalMiles();
            UpdateMPG();
        }

        private void begMileInput_Click(object sender, EventArgs e)
        {
            isClearingText = true;
            begMileInput.Clear();
            isClearingText = false; // Reset the flag after clearing
        }
        private void endMileInput_TextChanged(object sender, EventArgs e)
        {
            // Skip validation if text is being cleared programmatically
            if (isClearingText) return;
            // Retrieve the current text in the TextBox
            string input = endMileInput.Text;

            // Check if the input is a number (optional)
            if (int.TryParse(input, out int number))
            {
                // Do something with the valid number
                endMile.Text = $"You entered: {number} ending odometer";
            }
            else if (string.IsNullOrEmpty(input))
            {
                // Handle the case when the TextBox is empty
                endMile.Text = "Please enter a number.";
            }
            else
            {
                // Handle invalid (non-numeric) input
                endMile.Text = "Invalid input! Please enter only numbers.";
            }
            // Call method to update total miles
            UpdateTotalMiles();
            UpdateMPG();
        }
        private void endMileInput_Click(object sender, EventArgs e)
        {
            isClearingText = true;
            endMileInput.Clear();
            isClearingText = false; // Reset the flag after clearing
        }
        private void UpdateTotalMiles()
        {
            // Try to parse the beginning and ending mile inputs
            if (int.TryParse(begMileInput.Text, out int begMileValue) &&
                int.TryParse(endMileInput.Text, out int endMileValue))
            {
                // Calculate the total miles and display in the output TextBox
                int totalMiles = endMileValue - begMileValue;
                totalMileOutput.Text = $"Total Miles: {totalMiles}";
            }
            else
            {
                // Clear the total miles output if inputs are invalid
                totalMileOutput.Clear();
            }
        }

        private void gasInput_Click(object sender, EventArgs e)
        {
            isClearingText = true;
            gasInput.Clear();
            isClearingText = false; // Reset the flag after clearing
        }

        private void gasInput_TextChanged(object sender, EventArgs e)
        {
            // Retrieve the current text in the TextBox
            string input = gasInput.Text;

            // Try to parse the input as a decimal
            if (decimal.TryParse(input, out decimal gallons))
            {
                // Valid decimal input
                gas.Text = $"You entered: {gallons} gallons of gas."; // Display the valid input somewhere, e.g., in a label or another TextBox
            }
            else if (string.IsNullOrEmpty(input))
            {
                // Handle the case when the TextBox is empty
                gas.Text = "Please enter a number.";
            }
            else
            {
                // Handle invalid (non-numeric) input
                gas.Text = "Invalid input! Please enter a valid decimal number.";
            }
            UpdateMPG();
        }
        private void UpdateMPG()
        {
            // Try to parse the inputs for total miles and gas
            if (int.TryParse(begMileInput.Text, out int begMileValue) &&
                int.TryParse(endMileInput.Text, out int endMileValue) &&
                decimal.TryParse(gasInput.Text, out decimal gallons) &&
                gallons > 0) // Ensure gallons is greater than zero to avoid division by zero
            {
                // Calculate total miles
                int totalMiles = endMileValue - begMileValue;

                // Calculate MPG
                decimal mpg = totalMiles / gallons;

                // Display MPG in the MPGOutput TextBox
                MPGOutput.Text = $"MPG: {mpg:F2}"; // Display with two decimal places
            }
            else
            {
                // Clear the MPG output if inputs are invalid
                MPGOutput.Clear();
            }
        }
    }
}
