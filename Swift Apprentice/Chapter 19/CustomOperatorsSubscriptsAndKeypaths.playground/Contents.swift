import Foundation
import CoreGraphics
//precedencegroup ExponentiationPrecedence {
//  associativity: right
//  higherThan: MultiplicationPrecedence
//}
//
//infix operator **:  ExponentiationPrecedence
//func **<T : BinaryInteger>(base: T, power: Int) -> T{
//    precondition(power >= 2)
//    var result = base
//    for _ in 2...power{
//        result *= base
//    }
//    return result
//}
//
//infix operator **=
//func **=<T: BinaryInteger>(lhs: inout T, rhs: Int){
//    lhs = lhs ** rhs
//}
//let base = 3
//let exponent = 3
//let result = base ** exponent
//var number = 10
//number **= exponent
//let unsignedBase: UInt = 2
//let unsignedResult = unsignedBase ** exponent
//let base8: Int8 = 2
//let result8 = base8 ** exponent
//let unsignedBase8: UInt8 = 2
//let unsignedResult8 = unsignedBase8 ** exponent
//let base16: Int16 = 2
//let result16 = base16 ** exponent
//let unsignedBase16: UInt16 = 2
//let unsignedResult16 = unsignedBase16 ** exponent
//let base32: Int32 = 2
//let result32 = base32 ** exponent
//let unsignedBase32: UInt32 = 2
//let unsignedResult32 = unsignedBase32 ** exponent
//let base64: Int64 = 2
//let result64 = base64 ** exponent
//let unsignedBase64: UInt64 = 2
//let unsignedResult64 = unsignedBase64 ** exponent
class Person {
    let name: String
    let age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
    }
}

extension Person{
    subscript(property key : String) -> String?{
        switch key{
        case "name":
            return name
        case "age":
            return "\(age)"
        default:
            return nil
        }
    }
}
let me = Person(name: "Cosmin", age: 32)

me[property: "name"]
me[property: "age"]
me[property: "gender"]
//: ** Mini Exercises **

//infix operator **
//func **(word : String, m : Int) -> String{
//    var newWord = ""
//    for _ in 1...m{
//        newWord += " \(word)"
//    }
//    return newWord
//}
//
//let baseString = "abc"
//let times = 5
//var multipliedString = baseString ** times
//
//infix operator **=
//func **=(lhs: inout String, rhs: Int){
//    for i in 1...rhs{
//        lhs += (" \(i): \(lhs)")
//    }
//}
//multipliedString **= times


extension Array {
    subscript(index index: Int) -> (String, String)? {
        guard let value = self[index] as? Int else {
            print("nil")
            return nil
        }
        print("pass")
        switch (value >= 0, abs(value) % 2) {
        case (true, 0):
            return ("positive", "even")
        case (true, 1):
            return ("positive", "odd")
        case (false, 0):
            return ("negative", "even")
        case (false, 1):
            return ("negative", "odd")
        default:
            return nil
        }
        
    }
}

let arr = [-1,-2,-3,1,2,3,4,5,6,7,8,9]

arr[index: 0]
arr[index: 1]
arr[index: 3]
arr[index: 6]


//extension String{
//    subscript(index index : Int) -> Character?{
//
//        guard (0..<count).contains(index) else{
//            print("hi")
//            return nil
//        }
//        print("bye")
//        return self[self.index(startIndex, offsetBy: index)]
//    }
//}
extension String {
  subscript(index: Int) -> Character? {
    guard (0..<count).contains(index) else {
      return nil
    }
    return self[self.index(startIndex, offsetBy: index)]
  }
}
let hiSpanish = "HOLA"
hiSpanish[3]

//: Answer: O(n) Linear time, so can be very expensive and may overload the memory or drain the battery
infix operator **
func **<T : BinaryFloatingPoint>(base : T, exponent : Int) -> T{
    precondition(base >= 2)
    var r = base
    for _ in 1...exponent{
        r *= base
    }
    return T(r)
}
let exponent = 2
let baseDouble = 2.0
var resultDouble = baseDouble ** exponent
let baseFloat: Float = 2.0
var resultFloat = baseFloat ** exponent
let baseCG: CGFloat = 2.0
var resultCG = baseCG ** exponent

infix operator **=

func **=<T : BinaryFloatingPoint>(lhs : inout T, rhs : Int){
    lhs = lhs ** rhs
}

resultDouble **= exponent
resultFloat **= exponent
resultCG **= exponent
