import UIKit
//: **Mini Exercises**
//: ** *1-3* **
var sum = 0
for row in 0..<8 where row % 2 != 0{
    for column in 0..<8{
        sum += row * column
    }
}
print(sum)

sum = 0

rowLoop: for row in 0..<8{
    columnLoop: for column in 0..<8{
        if row == column{
            continue rowLoop
        }
        sum += row * column
    }
}
print(sum)

//: **1-1 | 1-2**

let range = 1...10
for i in range{
    print("Square: \(Int(pow(Double(i),2)))")
    print("SquareRoot: \(Double(i).squareRoot())")
}

//: **2-1**
let age = 32
let person : (String, Int) = ("Felipe", age)
switch person {
    case let (name, age) where age < 2:
        print("\(name) is an Infant")
    case let (name, age) where age > 3 && age <= 12:
        print("\(name) is an Child")
    case let (name, age) where age > 13 && age <= 19:
        print("\(name) is an Teenager")
    case let (name, age) where age > 20 && age <= 39:
        print("\(name) is an Adult")
    case let (name, age) where age > 40 && age <= 60:
        print("\(name) is an Middle")
    case let (name, age) where age > 60:
        print("\(name) is an Eldery")
    default:
        print("miss something like empty name or age")
}


switch person{
    case let (name, age):
        print("My Name is \(name) and i have \(age) years old.")
}

//: **Challenges Exercises**
//: **1-1**
//: Answer: 6 iteration and sum it's equal 15
//: **1-2**

var aLotOfAs = ""
while aLotOfAs.count < 10 {
    aLotOfAs += "a"
}
print("\(aLotOfAs.count) instance of 'a'")

//: **1-3**
//: 1: 'On the x/y plane'
//: 2: 'x = y = z'
//: 3: 'On the x/z plane'
//: 4: 'Nothing Special'
//: 5: 'On the y/z plane'
//: **1-4*
//: Answer: Because will infinite

let maxNum = 10
for i in 0...maxNum{
    print("\(maxNum-i)")
    print("\(Double(i)*0.1)")
}
