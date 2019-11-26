import UIKit

class Cat{
    var name : String
    init(name : String) {
        self.name = name        
    }
}

class Dog{
    var name : String
    
    init(name : String){
        self.name = name
    }
}


class Keeper<Animal>{
    var name : String
    var petsCare : Array<Animal>?
    var morningCare : Animal
    var afternoonCare : Animal
    
    init(name : String, morningCare : Animal, afternoonCare : Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
    
    func countAnimal() -> Void {
        if let pets = self.petsCare{
            print(pets.count)
        }else{
            print("There is no pets to be count")
        }
    }
    
    func animalAtIndex(_ index : Int) -> Animal?{
        guard let pets = self.petsCare else {
            print("There is no pets to be count")
            return nil
        }
        return pets[index]
    }
}

let jason = Keeper(name: "Jason",
morningCare: Cat(name: "Whiskers"),
afternoonCare: Cat(name: "Sleepy"))

//: ** Mini-Exercises
let dog1 = Dog(name: "Boby-1")
let dog2 = Dog(name: "Boby-2")
let dog3 = Dog(name: "Boby-3")
let dog4 = Dog(name: "Boby-4")
let dog5 = Dog(name: "Boby-5")
let dog6 = Dog(name: "Boby-6")

let cat1 = Dog(name: "Byt-1")
let cat2 = Dog(name: "Byt-2")
let cat3 = Dog(name: "Byt-3")
let cat4 = Dog(name: "Byt-4")
let cat5 = Dog(name: "Byt-5")
let cat6 = Dog(name: "Byt-6")
let felipe = Keeper(name: "Felipe", morningCare: Dog(name: "Bobby"), afternoonCare: Dog(name: "Pocho"))

//: Answer : The compiler will through an error because the first type don't match with the second type
//: Answer: Nothing, are the  same type
let felipe2 = Keeper(name: "Felipe", morningCare: cat2, afternoonCare: cat1)
felipe2.petsCare = [cat1,cat2,cat3,cat4,cat5]
felipe.petsCare = [dog1,dog2,dog3,dog4,dog5,dog6]
felipe.countAnimal()
felipe2.countAnimal()
print(felipe.animalAtIndex(3)!.name)
print(felipe2.animalAtIndex(1)!.name)

