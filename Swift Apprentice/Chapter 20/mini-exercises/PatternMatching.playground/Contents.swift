import UIKit

//: ** Mini Exercises
//: **1-1**
var val = 30
switch val {
case 0:
    print("nobody")
case 1:
    print("Single")
case 2...5:
    print("few")
case 6...20:
    print("several")
case 21...50:
    print("many")
default:
    print("a lot")
}

//:**1-2**
let names: [String?] =
 ["Michelle", nil, "Brandon", "Christine", nil, "David"]
for case .some(let name) in names {
  print(name) // 4 times
}
//or
for case let a? in names{
    print("\(a)")
}
