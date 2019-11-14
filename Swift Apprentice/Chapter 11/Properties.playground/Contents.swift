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
