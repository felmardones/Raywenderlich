import UIKit

struct Location {
    let x : Int
    let y : Int
}
struct DeliveryArea: CustomStringConvertible{
    let center: Location
    var radius: Double
    
    var description: String {
        return """
        Area with x: \(center.x) - y: \(center.y), radius: \(radius)
        """
    }
    //: ** Exercises: **1-2**
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter =
            distance(from: center,
                     to: location)
        return distanceFromCenter < radius
    }
    
    //    in the book just say's to put contains func in DeliveryArea Struct, but the scope of the func can't get the distance func if it's not inside the struct, so i copy/paste func, i thing there's a property like public/static or something like that to acceses a func outside the struct,
    //: **Exercise: 1-1**
    //     Pythagorean Theorem 📐 🎓
    func distance(from source: Location,
                  to target: Location) -> Double {
        let distanceX = Double(source.x - target.x)
        let distanceY = Double(source.y - target.y)
        return (distanceX * distanceX +
            distanceY * distanceY).squareRoot()
    }
    
    func overlap(with: Location) -> Bool{
        let diam = radius * 2
        let distanceFromBorder = distance(from: with, to: center)
        return distanceFromBorder < diam
    }
}

let restaurantLocation = Location(x: 2, y: 4)
let restaurantRange = 2.5
let deliveryArea = DeliveryArea(center: restaurantLocation, radius: restaurantRange)
let otherRestaurantLocation = Location(x: 7, y: 8)
let otherRestaurantRange = 1.5
let deliveryArea2 = DeliveryArea(center: otherRestaurantLocation, radius: otherRestaurantRange)
// Pythagorean Theorem 📐 🎓
func distance(from source: Location,
              to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX +
        distanceY * distanceY).squareRoot()
}
let areas = [
    DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 9, y: 7), radius: 4.5)
]
func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore =
            distance(from: area.center,
                     to: location)
        if distanceToStore < area.radius {
            return true
        } }
    return false
}
let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)
print(isInDeliveryRange(customerLocation1)) // false
print(isInDeliveryRange(customerLocation2)) // true
//: ** Exercise: 1- 3 **
let isOverlapping = DeliveryArea(center: customerLocation1, radius: 10.5).overlap(with: customerLocation2)


var area1 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
var area2 = area1
print(area1.radius) // 2.5
print(area2.radius) // 2.5
area1.radius = 4
print(area1.radius) // 4.0
print(area2.radius) // 2.5
print(area1)
print(area2)
//let customerLocation = Location(x: 2, y: 2)
////let isDelivery = isInDeliveryRange(location: customerLocation)
//
////print("\(isDelivery)")
//let storeLocation = Location(x: 2, y: 4)
//
//
//var storeArea = DeliveryArea(center: storeLocation, radius: 4)


//:  ** Mini Exercises **
struct pizzaOrder{
    var toppings: [String]
    let size: String
    let isVegan: Bool
}
//
//print(storeArea.radius)
//print(storeArea.center.x)
//storeArea.radius = 5.0



//: **Challenges**
//: **1-1**
//i think this it's going to be a enum after keep reading....
struct PositionPiece: CustomStringConvertible{
    let topPosition : Int
    let middlePosition : Int
    let bottomPosition : Int
    var description: String{
        return """
        testing
        """
    }
}
struct ticTacToc{
    
    var board = [Int : [String]]()
    init() {
        self.board =  [0 : [String](repeating: "", count: 3) , 1 : [String](repeating: "", count: 3) , 2 : [String](repeating: "", count: 3)]
    }
    mutating func addPiece(piece : BoardPiece, position : PositionPiece){
        board[0]![position.topPosition] = piece
        board[1]![position.middlePosition] = piece
        board[2]![position.bottomPosition] = piece
    }
    
    func printBoard(){
        var draw = ""
        
        let a = board.sorted{
            $0.key < $1.key
        }

        for b in a{
            for x in b.value{
                if(x != ""){
                    draw += "| \(x) "
                }else{
                    draw += "|   "
                }
              
            }
            draw += "| \n"
        }
        print(draw)
    }
}
typealias BoardPiece = String
let X: BoardPiece = "X"
let O: BoardPiece = "O"
let moveOne = PositionPiece(topPosition: 0, middlePosition: 1, bottomPosition: 2)
let moveTwo = PositionPiece(topPosition: 1, middlePosition: 2, bottomPosition: 0)

var asTest = ticTacToc()
print(asTest.board)

asTest.addPiece(piece: X, position: moveOne)
asTest.addPiece(piece: O, position: moveTwo)

print(asTest.printBoard())

//: ** 1-2 **
// i dont know if this it's the goal of the challenge, say's "Implement a "playable" version of Tic-Tac-Toe (OXO)", so this is, i think, one of the correct ways to do it wihout a UI to triggers event to play(or console input).... i try to use struct, array, dictionary, typealias, etc...

struct TShirt: CustomStringConvertible{
    let color : String
    let size : String
    let material : String
    var price = 0.0;

    var description: String{
        return """
            The T-Shirt is the color : \(color), size: \(size) and the material is : \(material)
            The price of the shirt is:
        """
    }
    mutating func cost() -> Double{
        //whe invent some formula
        switch (size, material) {
            case ("S","Feather"):
                price += 1.0
            break
            case ("M", "SomeOther"):
                price += 1.2
            break
            case ("L", "SomeOther2"):
                price += 1.3
            break
            default:
                price += 1.5
            break
        }
        return price
    }
}

var shirtBuy = TShirt(color: "Red", size: "L", material: "Feather")
let priceShirt = shirtBuy.cost()
print("Price = \(priceShirt)")


//: ** 1-3 **
struct Player : Hashable{
    let name : String
    
//    var hashValue: Int {
//        return name.hashValue
//    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name.hashValue)
    }
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
}
//the Coordinate struct it's use it to set the position
struct Coordinate{
    var coor : (x : Int, y : Int, z : Int)
    
}
struct Attack{
    var locationToAttack = (x: 0, y: 0)
}
struct Ship: CustomStringConvertible{
    var origin : Coordinate
    let direction : String
    var health : Int {
        get {
            let result = self.origin.coor.z
            return result
        }
        set {
            origin.coor.z -= 1
        }
    }
    var isDestroy : Bool{
        if health > 0 {
            return false
        }else{
            return true
        }
    }
    var player : Player? = nil
    
    var description: String{
        return """
        The Origin is x is: \(self.origin.coor.x)
        The Origin is y is: \(self.origin.coor.y)
        The Origin is z is: \(self.origin.coor.z)
        
        Direction: \(direction)
        Health: \(health)
        
        isDestroy: \(isDestroy)
        """
    }
    mutating func isHit(hitLocation : Attack) -> Bool{
        if( self.direction == "horizontal" ){
            print("Horizontal Shiiiip!!!!")
            print("The location to hit it's x: \(hitLocation.locationToAttack.x) y:\(hitLocation.locationToAttack.y)")
            if (self.origin.coor.y == hitLocation.locationToAttack.y){
                print("The y location it's correct, goint to search if the range of x")
                let beginRange = self.origin.coor.x
                let endRange = self.origin.coor.x + self.origin.coor.z
                
                if case beginRange...endRange = hitLocation.locationToAttack.x {
                    print("Hit!!!!!! ")
                    self.health -= 1
                    return true
                }
            }
        }else{
            print("Vertical Shiiiip!!!!")
            print("The location to hit it's x: \(hitLocation.locationToAttack.x) y:\(hitLocation.locationToAttack.y)")
            print("The location of the ship is x: \(self.origin.coor.x) y: \(self.origin.coor.y)")
            if self.origin.coor.x == hitLocation.locationToAttack.x{
                print("The x location it's correct, goint to search if the range of y")
                if case self.origin.coor.y...(self.origin.coor.y + self.origin.coor.z) = hitLocation.locationToAttack.y{
                    print("Hit!!!!!! ")
                    self.health -= 1
                    return true
                }
            }
        }
        return false
    }
}


struct BoardShip: CustomStringConvertible{
    let width : Int
    let height : Int
    var shipsInBoard : [ Ship ]?
    
    var description: String{
        """
        The board width is : \(width), the height is: \(height). Had \(shipsInBoard!.map{" \($0.player!.name) "})
        """
    }
    init(width: Int, height: Int, ships : [Ship]) {
        self.width = width
        self.height = height
        self.shipsInBoard = ships
    }
    
    func attackPlayer(attack : Attack, player pj : Player){
        print("\(pj.name) it's been attack.")
        guard let ships = self.shipsInBoard else{
            return
        }
        for var ship in ships{
            guard let player = ship.player else{
                return
            }
            if player.name == pj.name{
                print("Attacking player!!")
                ship.isHit(hitLocation: attack )
                continue
            }
            print(ship)
        }
        
    }
    
    func printShips(){
        guard let ships = self.shipsInBoard else{
            return
        }
        var shipsLog = ""
        for ship in ships{
            shipsLog += "Player: \(ship.player!.name) \n"
            shipsLog += "Ship Health: \(ship.health) \n"
            shipsLog += "Player ship x: \(ship.origin.coor.x) \n"
            shipsLog += "Player ship y: \(ship.origin.coor.y) \n"
            shipsLog += "Player ship z: \(ship.origin.coor.z) \n"
            shipsLog += "Player ship is destroy: \(ship.isDestroy) \n"

        }
        print(shipsLog)
    }
}
//Create Players
var player1 = Player(name: "Felipe")
var player2 = Player(name: "Myrna")
//Create Random Coordinate, this, in the future, had to limit at board size, for now, just do what the challenge say's
var coordinate1 = Coordinate(coor: (1,3,4))
var coordinate2 = Coordinate(coor: (4,5,3))
var coordinate3 = Coordinate(coor: (6,7,4))

//Create a Ship, direction can be portrait or landscape(vertical, horizontal) this can be an enum in the future i think.
var ship1 = Ship(origin: coordinate1, direction: "vertical")
var ship2 = Ship(origin: coordinate2, direction: "vertical")
var ship3 = Ship(origin: coordinate3, direction: "horizontal")

ship1.player = player1
ship2.player = player2
ship3.player = player2

//Create Board

var board = BoardShip(width: 10, height: 10, ships: [ship1,ship2,ship3])



print(board)
let attack1 = Attack(locationToAttack: (1,4))
let attack2 = Attack(locationToAttack: (8,7))

board.attackPlayer(attack: attack1, player: player2)
board.attackPlayer(attack: attack1, player: player2)
board.printShips()

//The challenge it to report if the ship is hit, so with this code can complete the challenges. - If the attack is in the origin plus the lenght(coor.z), it's hit, then the lenght it's coor.z - 1. This can be improve, like if the attack hit some point of the hsip, that point can't be hit again.




