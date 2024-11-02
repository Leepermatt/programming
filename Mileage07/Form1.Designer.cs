namespace Milage_tracker
{
    partial class MainMenu
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            begMile = new Button();
            endMile = new Button();
            totalMile = new Button();
            gas = new Button();
            MPG = new Button();
            begMileInput = new TextBox();
            endMileInput = new TextBox();
            totalMileOutput = new TextBox();
            gasInput = new TextBox();
            MPGOutput = new TextBox();
            SuspendLayout();
            // 
            // begMile
            // 
            begMile.Location = new Point(59, 38);
            begMile.Name = "begMile";
            begMile.Size = new Size(128, 69);
            begMile.TabIndex = 0;
            begMile.Text = "Beginning Mileage";
            begMile.UseVisualStyleBackColor = true;
            // 
            // endMile
            // 
            endMile.Location = new Point(59, 173);
            endMile.Name = "endMile";
            endMile.Size = new Size(128, 69);
            endMile.TabIndex = 1;
            endMile.Text = "Ending  Mileage";
            endMile.UseVisualStyleBackColor = true;
            // 
            // totalMile
            // 
            totalMile.Location = new Point(304, 38);
            totalMile.Name = "totalMile";
            totalMile.Size = new Size(128, 69);
            totalMile.TabIndex = 2;
            totalMile.Text = "Total Mileage";
            totalMile.UseVisualStyleBackColor = true;
            // 
            // gas
            // 
            gas.Location = new Point(59, 309);
            gas.Name = "gas";
            gas.Size = new Size(128, 69);
            gas.TabIndex = 3;
            gas.Text = "Gallons of gas";
            gas.UseVisualStyleBackColor = true;
            // 
            // MPG
            // 
            MPG.Location = new Point(304, 173);
            MPG.Name = "MPG";
            MPG.Size = new Size(128, 69);
            MPG.TabIndex = 4;
            MPG.Text = "Miles per Gallon";
            MPG.UseVisualStyleBackColor = true;
            // 
            // begMileInput
            // 
            begMileInput.Location = new Point(59, 123);
            begMileInput.Name = "begMileInput";
            begMileInput.Size = new Size(128, 23);
            begMileInput.TabIndex = 5;
            begMileInput.Text = "Enter Miles";
            begMileInput.TextAlign = HorizontalAlignment.Center;
            begMileInput.Click += begMileInput_Click;
            begMileInput.TextChanged += begMileInput_TextChanged;
            // 
            // endMileInput
            // 
            endMileInput.Location = new Point(59, 265);
            endMileInput.Name = "endMileInput";
            endMileInput.Size = new Size(128, 23);
            endMileInput.TabIndex = 6;
            endMileInput.Text = "Enter End MIles";
            endMileInput.TextAlign = HorizontalAlignment.Center;
            endMileInput.Click += endMileInput_Click;
            endMileInput.TextChanged += endMileInput_TextChanged;
            // 
            // totalMileOutput
            // 
            totalMileOutput.Location = new Point(304, 123);
            totalMileOutput.Name = "totalMileOutput";
            totalMileOutput.Size = new Size(128, 23);
            totalMileOutput.TabIndex = 7;
            // 
            // gasInput
            // 
            gasInput.Location = new Point(59, 402);
            gasInput.Name = "gasInput";
            gasInput.Size = new Size(128, 23);
            gasInput.TabIndex = 8;
            gasInput.Text = "Enter Gas";
            gasInput.Click += gasInput_Click;
            gasInput.TextChanged += gasInput_TextChanged;
            // 
            // MPGOutput
            // 
            MPGOutput.Location = new Point(304, 265);
            MPGOutput.Name = "MPGOutput";
            MPGOutput.Size = new Size(128, 23);
            MPGOutput.TabIndex = 9;
            // 
            // MainMenu
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(MPGOutput);
            Controls.Add(gasInput);
            Controls.Add(totalMileOutput);
            Controls.Add(endMileInput);
            Controls.Add(begMileInput);
            Controls.Add(MPG);
            Controls.Add(gas);
            Controls.Add(totalMile);
            Controls.Add(endMile);
            Controls.Add(begMile);
            Name = "MainMenu";
            Text = "Main Menu";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button begMile;
        private Button endMile;
        private Button totalMile;
        private Button gas;
        private Button MPG;
        private TextBox begMileInput;
        private TextBox endMileInput;
        private TextBox totalMileOutput;
        private TextBox gasInput;
        private TextBox MPGOutput;
    }
}
