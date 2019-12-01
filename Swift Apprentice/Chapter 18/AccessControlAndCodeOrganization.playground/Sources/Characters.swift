import Foundation


public protocol GameCharacter : class{
    var name : String { get set }
    var hitPoints : Int { get set }
    var attackPoints : Int { get set }
}
enum GameCharacterType{
    case elves
    case giant
    case wizard
}

struct GameCharacterFactory{
    static func make(ofType type : GameCharacterType) -> GameCharacter{
        switch type {
        case .elves:
            return Elves()
        case .giant:
            return Giant()
        case .wizard :
            return Wizard()
        }
    }
}


class Wizard : GameCharacter{
    var name: String
    var hitPoints: Int
    var attackPoints: Int
    
    init() {
        self.name = "Wizard"
        self.hitPoints = 5
        self.attackPoints = 5
    }
}

class Elves : GameCharacter{
    var name: String
    var hitPoints: Int
    var attackPoints: Int
    
    init() {
        self.name = "Elves"
        self.hitPoints = 3
        self.attackPoints = 10
    }
}

class Giant : GameCharacter{
    var name: String
    var hitPoints: Int
    var attackPoints: Int
    
    init() {
        self.name = "Giant"
        self.hitPoints = 10
        self.attackPoints = 3
    }
}


public func battle(_ p1 : GameCharacter,vs p2 : GameCharacter){
    
    //we make a while loop
    repeat{
        print("BATTLE BEGIN!!!")
        p2.hitPoints -= p1.attackPoints
        print("\(p1.name) hit \(p2.name)")
        if(p2.hitPoints > 0){
            print("\(p2.name) suvive!")
            p1.hitPoints -= p2.attackPoints
            print("\(p2.name) hit \(p1.name)")

            if(p1.hitPoints <= 0){
                print("\(p1.name) DEFEATED")
            }else{
                print("\(p1.name) suvive!")
            }
        }else{
            print("\(p2.name) DEFEATED")
        }
        print("RESUME: \(p1.name) Life: \(p1.hitPoints) ")
        print("RESUME: \(p2.name) Life: \(p2.hitPoints) ")

    }while(p1.hitPoints == 0 || p2.hitPoints == 0)
}




