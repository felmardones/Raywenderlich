import UIKit

struct TV {
  var height: Double
  var width: Double
    var diagonal: Int {
        // 1
        get { // 2
            let result = (height * height +
                width * width).squareRoot().rounded()
            return Int(result)
        }
        set { // 3
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            // 4
            let ratioDiagonal = (ratioWidth * ratioWidth +
                ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
    }
}

var tv = TV.init(height: 53.93, width: 95.87)
tv.width
tv.height
tv.diagonal
tv.width = tv.height
let diagonal = tv.diagonal
tv.diagonal = 70
let height = tv.height // 34.32...
let width = tv.width // 61.01...


struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
              Current is too high,
              falling back to previous setting.
              """)
                current = oldValue
            }
        }
    }
}
var lb = LightBulb()
lb.current = 30
print(lb)


//: ** Challenges **
//:** 1-1 **

struct IceCream {
  lazy var name: String = "Felipe"
    lazy var ingredients: [String] = {
        return ["Onion", "Potato", "Garlic"]
    }()
    init(name: String) {
      self.name = name
    }
}

//: ** 1-2 **
struct Car {
    let make: String
    let color: String
    var fuel : FuelTank
}

struct FuelTank {
    static let maxLevel : Double = 1.0
    static let minLevel : Double = 0.0
    
    var lowFuel : Bool = false
    var level: Double{ // decimal percentage between 0 and 1
        didSet{
            if level > FuelTank.maxLevel{
                level = 1
            }else if level < 0{
                level = 0
            }
        }
        willSet{
            if newValue <= 0.1{
                print("low fuel")
                lowFuel = true
            }else{
                print("normal fuel")
                lowFuel = false
            }
        }
    }
}
var fuel = FuelTank(level: 1)
var car = Car(make: "Dont know what means make", color: "Green", fuel: fuel)
car.fuel.level = 0.02
print(car.fuel.lowFuel)
car.fuel.level = 0.4
print(car.fuel.lowFuel)
car.fuel.level = 0.1
print(car.fuel.lowFuel)
