import UIKit

//: ** Mini Exercise **
//: ** 1-1 **
struct Math {
    static func triangleNumber(of number: Int) -> Int{
        return (1...number).reduce(1, +)
    }
    // 1
    static func factorial(of number: Int) -> Int {
        // 2
        return (1...number).reduce(1, *)
    }
}
// 3
Math.factorial(of: 6) // 720
Math.triangleNumber(of: 4)

//copy paste from the book, just for reminding
extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        // 1
        var remainingValue = value
        // 2
        var testFactor = 2
        var primes: [Int] = []
        // 3
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

Math.primeFactors(of: 31) // [3, 3, 3, 3]


//: ** Challenge  **
//: ** 1-1 **
struct Circle{
    var radius = 0.0
    
    var area : Double {
        get{
            return .pi * radius * radius
        }
        set(newValue){
            radius = sqrt(newValue / .pi)//i cant remember the operation to increase the area by the radius, so i copy it from google...
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    
    mutating func growFactor(by byFactor: Int){
        area *= Double(byFactor)
    }
}
var circle = Circle(radius: 2.5)
print(circle.area * 3)
circle.growFactor(by: 3)
print(circle.area)

//: ** 1-2 **
let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]
struct SimpleDate {
    
    var month: String
    var day: Int
    
    func monthsUntilWinterBreak() -> Int {
        return months.firstIndex(of: "December")! - months.firstIndex(of: month)!
    }
    
    func getIndexMonth() -> Int{
        return months.firstIndex(of: self.month)! + 1
    }
    mutating func advance() {
        if month == "December" && day == 31{//i dont know if this it's the objective of the challenge, but the result it's what they ask, this also can be done with switch case for every month
            day = 1
            month = "January"
        }else{
            day += 1
        }
    }
}
extension SimpleDate {
    init() {
        month = "January"
        day = 1
    }
}
extension Math{
    static func isEven(monthIndex : Int) -> Bool{
        
        return monthIndex % 2 == 0
        
        
    }
    static func isOdd(monthIndex : Int) -> Bool{
        
        return !isEven(monthIndex: monthIndex)
    }
    
}


var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month // December; should be January!
date.day // 32; should be 1!


let monthIndex = date.getIndexMonth()
Math.isOdd(monthIndex: monthIndex)
Math.isEven(monthIndex: monthIndex)


extension Int {
    
    var isEven : Bool {
        return Math.isEven(monthIndex: self)
    }
    
    var isOdd : Bool {
        return Math.isOdd(monthIndex:self)
    }
    
    func primeFactors() -> [Int]{
        // 1
        var remainingValue = self
        // 2
        var testFactor = 2
        var primes: [Int] = []
        // 3
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        return primes
    }
}

let a = 10
let b = 7
let c = 81
print(a.isEven)
print(a.isOdd)
print(b.isEven)
print(b.isOdd)
print(c.isEven)
print(c.isOdd)
print(c.primeFactors())
//Int.isEven(number: 3)
//Int.isOdd(number: 8)
//Int.isOdd(number: 9)

//: [Next](@next)
