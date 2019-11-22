import UIKit

//: ** Mini Exercises
//: ** 1-1 **

protocol Area{
    var area : Double { get }
    
}


struct Square: Area{
    var side: Double
    var area: Double{
        return side * side
    }
    
}

struct Triangle: Area{
    var base: Double
    var height: Double
    var area: Double{
        return (base + height) / 2
    }
    
}

struct Circle: Area{
    var r: Double
    var area:Double{
        return .pi*r*r
    }
}


let square = Square(side: 3)
let triangle = Triangle(base: 10, height: 12)
let circle = Circle(r: 4)

var arr : [Area] = [square, triangle, circle]

arr.map{
    print("Area from \($0.self) : \($0.area)")
}



//** Challenge **
//I try to do something more "real"(big big big, really big quotes), than just creating homogeneous arrays like [Feedeable] or  [Cageable] of pets, i think it's more scalable to create a pet shop class who have an array of animal(protocol), where each animal have their own properties set, like bird canFly, but can't swim. So, if i have an array of animal, i can loop through and get only the animal who canFly, and all of them have to be caged(i create a caged struct just for fun), or walked, etc...

protocol Animal{
    var name : String { get }
    var canFly : Bool { get }
    var canSwim : Bool { get }
    
}
protocol Tasks{
    func fed()
    func petsToCaged() -> [Animal]
    func petsToTank() -> [Animal]
    func petsToExercise() -> [Animal]
    func cleanCage()
    func cleanTank()
}

struct Cage {
    var pets : [Animal]
    func cleanCage(){
        print("clean Calge")
    }
    
    func petsInCage(){
        let printPets = self.pets.map{ " \($0.name) \n" }
        print(printPets)
    }
}

class Pet : Animal{
    var name : String
    var canFly: Bool
    var canSwim: Bool
    
    init(name : String, canFly : Bool , canSwim : Bool) {
        self.name = name
        self.canFly = canFly
        self.canSwim = canSwim
    }
    
}

class PetShop : Tasks{
    var pets : [Animal]
    
    init(pets : [Animal]) {
        self.pets = pets
    }
    
    func fed() {
        print("Fed")
    }
    
    func petsToTank() -> [Animal] {
        let petsToPutInTheTank = pets.filter{
            if $0.canSwim{
                return true
            }
            return false

        }
        print("Tank: \(petsToPutInTheTank.map{ "\($0.name) go to the tank \n"})")
        return petsToPutInTheTank
    }
    
    func petsToCaged() -> [Animal] {
        let petsToPutInTheCage = self.pets.filter{
            print("\($0.name)  can fly: \($0.canFly)")
            if $0.canFly{
                return true
            }
            return false
        }
        print("Caged: \(petsToPutInTheCage.map{ "\($0.name) go to the cage \n"})")
        return petsToPutInTheCage
    }
    
    func petsToExercise() -> [Animal] {
        let petsToWalk = pets.filter{
            if !$0.canFly && !$0.canSwim{
                return true
            }
            return false

        }
        print("Exercises: \(petsToWalk.map{ "\($0.name) go to the Exersices \n"})")
        return petsToWalk
    }
    
    func cleanCage() {
        print("Clean Cage")
    }
    
    func cleanTank() {
        print("Clean Tank")
    }
}

class Dog : Pet{
    
    required init(name: String) {
        super.init(name: name, canFly: false, canSwim: false)
    }
}

class Cat : Pet{
    
    required init(name: String) {
        super.init(name: name, canFly: false, canSwim: false)
    }
}


class Fish : Pet{
    
    required init(name: String) {
        super.init(name: name, canFly: false, canSwim: true)
    }
}

class Bird : Pet{
    
    required init(name: String) {
        super.init(name: name, canFly: true, canSwim: false)
    }
    
}



let dog = Dog(name: "Bobby")//dog and cat can swim in the reality
let cat = Dog(name: "bagui")
let falcon = Bird(name: "FalconOne")
let salmon = Fish(name: "MagiKarp")



let petShop = PetShop(pets: [dog,cat,falcon,salmon])


petShop.fed()

var cage = Cage(pets: petShop.petsToCaged())
cage.petsInCage()
let eagle = Bird(name: "Eagle One")
cage.pets.append(eagle)
cage.petsInCage()
petShop.petsToExercise()
petShop.petsToTank()
petShop.cleanTank()
petShop.cleanCage()


