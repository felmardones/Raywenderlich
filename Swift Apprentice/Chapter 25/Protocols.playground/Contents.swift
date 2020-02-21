import UIKit
extension CustomStringConvertible{
    var description : String {
        get {
            return "Remember to implement CustomStringConvertible!"
        }
    }
}
struct MyStruct: CustomStringConvertible {
}
print(MyStruct())

protocol TeamRecord {
  var wins: Int { get }
  var losses: Int { get }
  var winningPercentage: Double { get }
}

extension CustomStringConvertible where Self : TeamRecord{
    var description : String {
        get{
            return "\(wins) - \(losses)"
        }
    }
}


//: ** Challenges **
protocol Item : CustomStringConvertible {
    var name: String { get }
    var clearance: Bool { get }
    var msrp: Double { get } // Manufacturer's Suggested Retail Price
    var totalPrice: Double { get }
}

protocol Tax : Item{
    var percentage : Double { get }
}

protocol Discount : Item{
    var discount : Double { get }
}

extension Item{
    var totalPrice : Double{
        get{
            msrp
        }
    }
}
extension Item where Self : Discount{
    var totalPrice: Double {
        get{
            msrp
        }
    }
}

extension Item where Self : Tax {
    var totalPrice: Double {
        get{
            msrp
        }
    }
}

extension Item where Self : Tax & Discount{
    var totalPrice: Double {
        get{
            let finalPrice = ( msrp * percentage ) + msrp
            if(clearance){
               return finalPrice - (discount * finalPrice)
            }
            return finalPrice
        }
    }
}


struct Food : Discount, Tax{
    var percentage: Double = 0.075
    var name: String
    var clearance: Bool
    var msrp: Double
    var discount: Double = 0.5
    var totalPrice: Double? = nil
    var expirationDate : (month : Int, year: Int)
    var description: String {
        get{
            return "\(name) - Expiration Date: \(expirationDate.month)-\(expirationDate.year)"
        }
    }

}

struct Clothes : Discount{
    var name: String
    var clearance: Bool
    var msrp: Double
    var discount: Double = 0.25
    var totalPrice: Double {
        get{
            let finalPrice = msrp
            if(clearance){
                return finalPrice - (discount * finalPrice)

            }
            return finalPrice
        }
    }
    
}


struct Electronics : Discount, Tax{
    var discount: Double = 0.05
    var percentage: Double = 0.075
    var name: String
    var clearance: Bool
    var msrp: Double
    var totalPrice: Double? = nil
    
    
}

extension CustomStringConvertible where Self : Item{
    var description: String {
        get{
            "\(name) - \(totalPrice)"
        }
    }
}

var meat = Food(name: "Meat", clearance: true, msrp: 9.99, expirationDate: (11,1987))
var iphone = Electronics(name: "Iphone", clearance: true, msrp: 1000)
var short = Clothes(name: "Shot", clearance: true, msrp: 1000)
print(meat)
print(iphone)
print(short)


extension Sequence where Element : Numeric{
    func double() -> [Element]{
        return self.map{ $0 * 2 }
    }
}


[1,2,3,4,5,6,7,8].double()
[1.1,1.2,1.3,1.4].double()
