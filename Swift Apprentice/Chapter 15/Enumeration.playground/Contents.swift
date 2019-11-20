import UIKit
import Foundation
enum Month : Int {
    case january = 1, february, march, april, may, june, july, august,
    september, october, november, december
    
    var semester : String {
        get{
            switch self {
            case .august, .september, .october, .november:
                return "Autumn"
            case .december, .january, .february:
                return "Winter"
            case .march, .april, .may:
                return "Spring"
            case .june, .july:
                return "Summer"
            }
        }
    }
    
    var monthsUntilWinterBreak: Int {
        get{
            return ( rawValue - Month.december.rawValue ) * -1 // add *-1 just for maintain the order.
        }
    }
    var monthsUntilSummerBreak: Int {
        get{
            if rawValue > Month.july.rawValue{
                let toEnd = ( rawValue - Month.december.rawValue ) * -1
                print(toEnd)
                return toEnd + 5
            }else{
                return ( rawValue - Month.june.rawValue ) * -1
            }
        }
    }
}

func semester(for month: Month) -> String {
    switch month {
    case .august, .september, .october, .november, .december:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Summer"
    }
}

var month = Month.april
semester(for: month) // "Spring"
month = .december
semester(for: month) // "Autumn"
month.semester
month.monthsUntilWinterBreak

month = .march

month.monthsUntilSummerBreak

enum Icon: String {
  case music
  case sports
  case weather
  var filename: String {
    // 2
    return "\(rawValue).png"
  }
}
let icon = Icon.weather
icon.filename // weather.png




enum Light{
    case on
    case off
}


enum Math{
    static let e = 2.7183
}


let nestEgg = 25000 * pow(Math.e, 0.07 * 20) // $101,380.95
//enum Pet: CaseIterable {
//  case cat, dog, bird, turtle, fish, hamster
//}
//for pet in Pet.allCases {
//print(pet) }

//: ** Challenges ** --- Second Challenge it's above

//: ** 1-1 **
enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}


 let coin = Coin.quarter
coin.rawValue // 25



let coinsArray = [Coin.penny, Coin.nickel, Coin.dime, Coin.quarter]
//or
let coinsArrayTwo : [Coin] = [.penny,  .nickel, .dime, .quarter]
print(coinsArray.map{" \($0.rawValue) "})
print(coinsArrayTwo.map{" \($0.rawValue) "})

let cent = coinsArray.reduce(0){
    return $0 + $1.rawValue
}
print(cent)

//: ** 1-3
enum Direction : String{
  case north
  case south
  case east
  case west
}

var location = (x: 0, y: 0)
let movements: [Direction] = [.north, .north, .west, .south,
                              .west, .south, .south, .east, .east, .south, .east]

movements.map{
    switch $0 {
    case .north:
        location.x += 1
    case .south:
        location.x -= 1
    case .east:
        location.y += 1
    case .west:
        location.y -= 1
        
    }
}
print(location)
