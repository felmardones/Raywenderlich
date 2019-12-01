import UIKit
import Foundation


//: ** I HATE HOW THE CHALLENGE ON THIS CHAPTER ARE... SO PISS OF TO SEPARATE THE CHALLENG SO I JUST MAKE THIS ARCHIVE WITH ALL MINI EXERCISE AND CHALLENGE. IF YOU SEE MY OTHER  CHALLENGE'S CHAPTERS, YOU CAN SEE ALL ARE SOLVE IN ONE ARCHIVE, BUT THIS CHAPTER NEED TO BE SEPARATE ARCHIVE TO MAKE MORE CLEAR EVERY SOLUTION, BUT, LIKE I SAY, I JUST PISS OF.... SO I WILL KEEP THIS CHAPTER CHALLENGE IN ONE ARCHIVE UNTIL FINISHT THE BOOK, FOR NOW I JUST HAVE TO MAKE THE STRING CHAPTER CHALLENGE AGAIN(I DELETED, GIT XCODE BEGINNER MISTAKE) AND THIS... ALL OTHER CHAPTER ARE COMPLETE'S(THIS TEXT IS FOR POSSIBLES RECLUITERS, SO DONT THINK I DO THIS ON ALL MY WORK, JUST THIS, I SO FUCKING ANGRY WITH.......**


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

//print(johnChecking)

//class Doctor : ClassyPerson{
//    override var fullName: String{
//        get{
//            return "Dr. \(super.fullName)"
//        }
//    }
//
//}

//let m = Doctor(name: "Felipe", lastName: "Mardones")
//m.fullName
class SavingsAccount: BasicAccount {
    var interestRate: Double
    private let pin: Int
    
    @available(*, deprecated, message: "Use init(interestRate:pin:) instead")
    init(interestRate: Double) {
        self.interestRate = interestRate
        self.pin = 0
    }
    
    init(interestRate: Double, pin : Int) {
        self.interestRate = interestRate
        self.pin = pin
    }
    
    @available(*, deprecated, message: "Use processInterest(pin:) instead")
    func processInterest() {
    
        let interest = balance * interestRate
        deposit(amount: interest)
    }
    
    func processInterest(pin : Int) {
        if pin == self.pin{
            let interest = balance * interestRate
            deposit(amount: interest)
        }
    }
}


//: ** Challenges **
//: **1-1**

//Singleton pattern --- YOU FUCKING MAKE A BOOK OF DESIGN PATTERS AND YOU PUT A CHALLENGE WITH THIS ENUNCIATE in beginners book.... until know, the book was awsome, but this challenge, just fucking hate it in the way it's explained and the whole exercises/challenge of the chapter put the last tear in to the glass.....

public class Logger{
    private init(){}
    static let sharedInstance = Logger() //Provide shared, public, global access to the single Logger object. -> I don't know if because english it's not my native lenguage, but i dont understand that sentence, and in all book never says something relative to this word like "provide shared....", this piss me of a lot(shared it's mean cross instance??, public... global ? as instance??????? FUUUUUCKKKK I HATE FUCKING PEOPLE WHO DON'T EXPLAIN WITH DETAILS WHEN YOU ARE LLLLLEAARRRNINNNNG....! i just... just... FUUUUUUUUUUUUUUUUUUUUUUUUUUUUCK!!!!)
    
//    Not be able to be instantiated by consuming code. -> whaaaat? what means with consuming code? like adding parameters?.... FUCK
//    Have a method log() that will print a string to the console -> nothing to think about this...
    
//If you're reading this, pliss let me know if the firt sentence of the challenge it easy to understand or not, o just the author of this chapter(i notice every chapter it's from diff's author's) just wanna be burn in hell....
    func log(text : String){
        print("String")
    }
}


Logger.sharedInstance.log(text: "Hola Munddddo")


struct Stack<T>{
    
    private var elements : [T] = []
    public private(set) var count : Int = 0
    public func peek() -> T? {
        return elements.last
    }
    
    public mutating func push(_ value : T){
        elements.append(value)
        count += 1
    }
    
    public mutating func pop() -> T?{
        if elements.isEmpty{
            return nil
        }
        count -= 1
        return elements.removeLast()
        
    }
}


var strings = Stack<String>()

strings.push("Great!")
strings.push("is")
strings.push("Swift")
strings.count
strings.peek()
strings.pop()
strings.count

//Change elements from private to public and uncomment this 3 line of code for testing 
//strings.elements.map{
//    print("Name: \($0)")
//}

//
//let elf = GameCharacterFactory.make(ofType: .elf)
//let giant = GameCharacterFactory.make(ofType: .giant)
//let wizard = GameCharacterFactory.make(ofType: .wizard)
//battle(elf, vs: giant) // Giant defeated!
//battle(wizard, vs: giant) // Giant defeated!
//battle(wizard, vs: elf) // Elf defeated!
