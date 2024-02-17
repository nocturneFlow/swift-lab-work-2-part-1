import Foundation

class BankAccount {
    let accountOwner: String
    var balance: Double
    lazy var accountNumber: String = generateAccountNumber()
    
    init(accountOwner: String, startingBalance: Double) {
        self.accountOwner = accountOwner
        self.balance = startingBalance
    }
    
    private func generateAccountNumber() -> String {
        var number = ""
        let digits = Array("0123456789")
        for _ in 0..<9 {
            number.append(digits.randomElement()!)
        }
        return number
    }
    
    func deposit(amount: Double) {
        balance += amount
        print("Deposit of \(amount) successfully made to account \(accountNumber). New balance: \(balance)")
    }
    
    func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
            print("Withdrawal of \(amount) successfully made from account \(accountNumber). New balance: \(balance)")
        } else {
            print("Insufficient funds. Withdrawal of \(amount) failed for account \(accountNumber). Balance: \(balance)")
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func displayAccountInfo() {
        print("Account Information:")
        print("Account Number: \(accountNumber)")
        print("Account Owner: \(accountOwner)")
        print("Current Balance: \(balance)")
    }
}

// Simple command-line UI
func runBankApp() {
    print("Welcome to the Bank!")
    
    let account = BankAccount(accountOwner: "John Doe", startingBalance: 1000.0)
    
    while true {
        print("\n1. Deposit")
        print("2. Withdraw")
        print("3. Check Balance")
        print("4. Display Account Info")
        print("5. Exit")
        print("Enter your choice:")
        
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1:
                print("Enter deposit amount:")
                if let amountStr = readLine(), let amount = Double(amountStr) {
                    account.deposit(amount: amount)
                } else {
                    print("Invalid amount")
                }
            case 2:
                print("Enter withdrawal amount:")
                if let amountStr = readLine(), let amount = Double(amountStr) {
                    account.withdraw(amount: amount)
                } else {
                    print("Invalid amount")
                }
            case 3:
                print("Current Balance: \(account.getBalance())")
            case 4:
                account.displayAccountInfo()
            case 5:
                print("Thank you for using the Bank!")
                return
            default:
                print("Invalid option")
            }
        }
    }
}

runBankApp()
