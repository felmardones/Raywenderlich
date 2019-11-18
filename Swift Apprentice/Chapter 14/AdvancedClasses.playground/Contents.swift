import UIKit

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}
class Person {
    var firstName: String
    var lastName: String
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student : Person {
    var grades: [Grade] = []
    //    override init(firstName: String, lastName: String) {
    //        super.init(firstName: firstName, lastName: lastName)
    //    }
    required init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    convenience init(){
        self.init(firstName: "Felipe", lastName: "Mardones")
    }
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}
let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")
john.firstName // "John"
jane.firstName // "Jane"
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)


class BandMember: Student {
    var minimumPracticeTime = 2
}
class OboePlayer: BandMember {
    // This is an example of an override, which we’ll cover soon.
    override var minimumPracticeTime: Int {
        get {
            return super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

func phonebookName(_ person: Person) -> String {
    return "\(person.lastName), \(person.firstName)"
}
let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane",
                            lastName: "Appleseed")
phonebookName(person) // Appleseed, Johnny
phonebookName(oboePlayer) // Appleseed, Jane

var hallMonitor = Student(firstName: "Jill",
                          lastName: "Bananapeel")

hallMonitor = oboePlayer

//(oboePlayer as Student).minimumPracticeTime // ERROR: No longer a band
//member!
//hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime // 4 (optional)
//hallMonitor as! BandMember // Careful! Failure would lead to a runtime
//crash.
(hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)
if let hallMonitor = hallMonitor as? BandMember {
    print("This hall monitor is a band member and practices")
}

func afterClassActivity(for student: Student) -> String {
    return "Goes home!"
}
func afterClassActivity(for student: BandMember) -> String {
    return "Goes to practice!"
}

afterClassActivity(for: oboePlayer) // Goes to practice!
afterClassActivity(for: oboePlayer as Student) // Goes home!

class StudentAthlete: Student {
    var sports: [String]
    init(firstName: String, lastName: String, sports: [String]) {
        // 1
        self.sports = sports
        // 2
        let passGrade = Grade(letter: "P", points: 0.0,
                              // 3
            credits: 0.0)
        super.init(firstName: firstName, lastName: lastName)
        // 4
        recordGrade(passGrade)
    }
    
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    var failedClasses: [Grade] = []
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    var isEligible: Bool {
        return failedClasses.count < 3
    }
}


class Team {
    var players: [StudentAthlete] = []
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
            
        }
        return true
    }
}

//: ** Challenges **
//:** 1-1 **

class A{
    init() {
        print("I'am <\(String(describing: A.self))>!")
    }
    deinit {
        print("DEINIT A")
    }
}
class B : A{
    override init() {
        print("I'am <\(String(describing: B.self))>!")
        super.init()
    }
    deinit {
        print("DEINIT B")
        
    }
}
class C : B{
    override init() {
        print("I'am <\(String(describing: C.self))>!")
        super.init()
    }
    deinit {
        print("DEINIT C")
        
    }
}
do{
    let _ = C()
}


//: **1-2**

let c2 = C() as A
//Answer: Use as because we cast to superClass Instance, if is Subclass Instance, will be "as?" and not "as".

//: ** 1-3 **

class StudentBaseballPlayer : StudentAthlete{
    var position : String
    var number : Int
    var battingAverage : Double
    
    init(position: String, number : Int, battingAverage : Double, firstName: String, lastName: String, sports: [String]) {
        self.position = position
        self.number = number
        self.battingAverage = battingAverage
        
        super.init(firstName: firstName, lastName: lastName, sports: [])
    }
    
    required init(firstName: String, lastName: String) {
        self.position = ""
        self.number = 0
        self.battingAverage = 0.0
        super.init(firstName: firstName, lastName: lastName)
    }
}

//: answer : Benefits: Re-use code, use as Student     Drawbacks: init get more big, if the student graduate, the class it's usefull. If there's another "carrer" like "studentSoccerPlayer", will be redundance, too deep hierarchy....
