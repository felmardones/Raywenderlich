import UIKit
import Foundation
// Create a new account
//let account = BasicAccount()
// Deposit and withdraw some money
//account.deposit(amount: 10.00)
//account.withdraw(amount: 5.00)
// ... or do evil things!
//account.balance = 1000000.00


// Create a checking account for John. Deposit $300.00
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)
// Write a check for $200.00
//let check = johnChecking.writeCheck(amount: 200.0)!
// Create a checking account for Jane, and deposit the check.
//let janeChecking = CheckingAccount()
//janeChecking.deposit(check)
//janeChecking.balance // 200.00
// Try to cash the check again. Of course, it had no effect on
// Jane's balance this time :]
//janeChecking.deposit(check)
//janeChecking.balance // 200.00

//print(johnChecking)
//print("----")
//class SavingsAccount: BasicAccount {
//    var interestRate: Double
//    init(interestRate: Double) {
//        self.interestRate = interestRate
//    }
//    func processInterest() {
//        let interest = balance * interestRate
//        deposit(amount: interest)
//    }
//}
//print(johnChecking)

class Doctor : ClassyPerson{
    override var fullName: String{
        get{
            return "Dr. \(super.fullName)"
        }
    }

}

let m = Doctor(name: "Felipe", lastName: "Mardones")
m.fullName
