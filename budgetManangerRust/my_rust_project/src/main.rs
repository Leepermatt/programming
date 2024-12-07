use std::io; // Importing the standard input/output library for reading user input and printing to the console.

#[derive(Debug)] // Derive the Debug trait to allow easy printing and debugging of the enum.
enum TransactionType {
    Income,  // Represents an income transaction.
    Expense, // Represents an expense transaction.
}

#[derive(Debug)] // Derive the Debug trait for easy printing of Transaction instances.
struct Transaction {
    description: String, // Description of the transaction (e.g., "Salary" or "Groceries").
    amount: f64,         // Amount of the transaction.
    transaction_type: TransactionType, // Indicates whether the transaction is Income or Expense.
}

impl Transaction {
    // Constructor method to create a new Transaction.
    fn new(description: &str, amount: f64, transaction_type: TransactionType) -> Self {
        Transaction {
            description: description.to_string(), // Convert &str to String.
            amount,
            transaction_type,
        }
    }
}

struct BudgetManager {
    transactions: Vec<Transaction>, // A list to store all transactions.
}

impl BudgetManager {
    // Constructor method to create a new BudgetManager.
    fn new() -> Self {
        BudgetManager {
            transactions: Vec::new(), // Initialize with an empty transaction list.
        }
    }

    // Adds a new transaction to the BudgetManager.
    fn add_transaction(
        &mut self,
        description: String,
        amount: f64,
        transaction_type: TransactionType,
    ) {
        let transaction = Transaction::new(&description, amount, transaction_type); // Create a new Transaction.
        self.transactions.push(transaction); // Add it to the transactions list.
    }

    // Displays all recorded transactions.
    fn view_transactions(&self) {
        if self.transactions.is_empty() {
            // Check if there are no transactions.
            println!("No transactions recorded yet."); // Inform the user.
        } else {
            // Iterate through the transactions and display them.
            for (index, transaction) in self.transactions.iter().enumerate() {
                let transaction_type = match transaction.transaction_type {
                    TransactionType::Income => "Income", // Map TransactionType to a string for display.
                    TransactionType::Expense => "Expense", // Map TransactionType to a string for display.
                };
                println!(
                    "{}: {} - ${:.2} [{}]", // Print index, description, amount, and type of each transaction.
                    index + 1,
                    transaction.description,
                    transaction.amount,
                    transaction_type
                );
            }
        }
    }

    // Calculates the total balance by summing incomes and subtracting expenses.
    fn calculate_balance(&self) -> f64 {
        self.transactions.iter().fold(0.0, |balance, transaction| {
            match transaction.transaction_type {
                TransactionType::Income => balance + transaction.amount, // Add income to the balance.
                TransactionType::Expense => balance - transaction.amount, // Subtract expense from the balance.
            }
        })
    }
}

fn main() {
    let mut budget_manager = BudgetManager::new(); // Create a new BudgetManager instance.
    let mut input = String::new(); // Buffer to store user input.

    loop {
        // Main menu loop.
        println!("\n--- Budget Manager ---");
        println!("1. Add Income");
        println!("2. Add Expense");
        println!("3. View Transactions");
        println!("4. View Balance");
        println!("5. Exit");
        println!("Enter your choice: ");

        input.clear(); // Clear the input buffer.
        io::stdin()
            .read_line(&mut input) // Read user input.
            .expect("Failed to read line"); // Handle input error.
        let choice: u32 = match input.trim().parse() {
            Ok(num) => num, // Parse the input to a number.
            Err(_) => {
                println!("Invalid input, please enter a number."); // Handle invalid input.
                continue; // Restart the loop.
            }
        };

        match choice {
            1 => {
                // Add Income.
                println!("Enter income description: ");
                input.clear();
                io::stdin()
                    .read_line(&mut input)
                    .expect("Failed to read line");
                let description = input.trim().to_string(); // Read and trim description input.

                println!("Enter income amount: ");
                input.clear();
                io::stdin()
                    .read_line(&mut input)
                    .expect("Failed to read line");
                let amount: f64 = match input.trim().parse() {
                    Ok(num) => num, // Parse the amount.
                    Err(_) => {
                        println!("Invalid amount. Please enter a valid number."); // Handle invalid amount.
                        continue;
                    }
                };

                budget_manager.add_transaction(description, amount, TransactionType::Income); // Add the income.
                println!("Income added successfully!");
            }
            2 => {
                // Add Expense.
                println!("Enter expense description: ");
                input.clear();
                io::stdin()
                    .read_line(&mut input)
                    .expect("Failed to read line");
                let description = input.trim().to_string(); // Read and trim description input.

                println!("Enter expense amount: ");
                input.clear();
                io::stdin()
                    .read_line(&mut input)
                    .expect("Failed to read line");
                let amount: f64 = match input.trim().parse() {
                    Ok(num) => num, // Parse the amount.
                    Err(_) => {
                        println!("Invalid amount. Please enter a valid number."); // Handle invalid amount.
                        continue;
                    }
                };

                budget_manager.add_transaction(description, amount, TransactionType::Expense); // Add the expense.
                println!("Expense added successfully!");
            }
            3 => {
                // View all transactions.
                println!("--- Transactions ---");
                budget_manager.view_transactions();
            }
            4 => {
                // View the total balance.
                let balance = budget_manager.calculate_balance();
                println!("Current Balance: ${:.2}", balance); // Display the calculated balance.
            }
            5 => {
                // Exit the program.
                println!("Exiting Budget Manager. Goodbye!");
                break;
            }
            _ => println!("Invalid choice. Please enter a number between 1 and 5."), // Handle invalid menu choice.
        }
    }
}
