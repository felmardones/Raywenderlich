import UIKit

//: ** Mini Exercise **
class Person {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
//: **1-1**
//cant change jhon if is let, so i change to var
//let john = Person(firstName: "Johnny", lastName: "Appleseed")
var john = Person(firstName: "Johnny", lastName: "Appleseed")
var homeOwner = john
john.firstName = "John" // John wants to use his short name!
john.firstName // "John"
homeOwner.firstName // "John"
print(john.fullName)
john.lastName = "Mar"
print(john.fullName)
//Answer: Also change...
print(homeOwner.fullName)

//: **1-2**

var felipe = Person(firstName: "Felipe", lastName: "Mardones")
var myrna = Person(firstName: "Myrna", lastName: "Freites")
var fran = Person(firstName: "Francisca", lastName: "Mardones")
var mati = Person(firstName: "Matías", lastName: "Mardones")
var pocho = Person(firstName: "Pocho", lastName: "Mardones")

let arrayPeople = [felipe, myrna, fran, mati, pocho, john]
let arrayPeopleTwo = [felipe, myrna, fran, mati, pocho]

func memberOf(person: Person, group: [Person]) -> Bool{
    for p in group{
        if person === p{
            return true
        }
    }
    return false
}


memberOf(person: john, group: arrayPeople)
memberOf(person: john, group: arrayPeopleTwo)


//: **1-3**
struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}
class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    var credits = 0.0
    var gradeAvg : Double {
        get {
            var totalPoints : Double = 0
            var totalCredits : Double = 0
//           will be better use reduce(grades[Grade] have to be hashable)
            for grade in grades{
                totalPoints += grade.points
                totalCredits += grade.credits
            }
            return totalPoints/totalCredits
        }
    }
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}
let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)
jane.recordGrade(history)
jane.recordGrade(math)

print(jane.gradeAvg)
print(jane.credits)
math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)
print(jane.credits)


extension Student {
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}

jane.fullName

//: ** Challenges **

struct User{
    var firstName : String
    var lastName : String
    var list : [String : List]

    init(firstName: String, lastName : String, list : [String : List]) {
        self.firstName = firstName
        self.lastName = lastName
        self.list = list
    }
    mutating func addList(name : String, _ listMovies : List){
        list[name] = listMovies
    }
    
    func listForName( forName : String) -> List?{
        let dictionaryForName = list[forName] != nil
        if dictionaryForName{
            return list[forName]
        }
        return nil
    }
}


struct List{
    var name : String
    var movies : [String]
    
    init(name : String, movies : [String]) {
        self.name = name
        self.movies = movies
    }
    
    func printMovies(){
        let moviesList = movies.map{ "\($0) \n"}
        print(moviesList)
    }
}
let movies = ["Lier Lier", "50 first Days", "How High"]
let movies2 = ["Captain America", "Ant Man", "Iron Man", "Avenger"]
let listOne = List(name: "Comedy", movies: movies)
let listTwo = List(name: "Action", movies: movies2)
let dictionaryList = [listOne.name : listOne]
let dictionaryListTwo = [listTwo.name : listTwo]

var jane2 = User(firstName: "Felipe", lastName: "Mardones", list: dictionaryList)
var john2 = User(firstName: "Felipe", lastName: "Mardones", list: dictionaryList)

let firstListReturns = jane2.listForName(forName: "Comedy")

print(firstListReturns!.movies)

jane2.addList( name : listTwo.name, listTwo)

let secondListReturns = jane2.listForName(forName: "Action")
print(secondListReturns!.movies)


print(jane2.list["Comedy"]?.movies as Any)
print(john2.list["Comedy"]?.movies as Any)

jane2.list["Comedy"]?.movies = ["Test"]
print(jane2.list["Comedy"]?.movies as Any)
print(john2.list["Comedy"]?.movies as Any)
jane2.list["Comedy"]?.movies.map{
    print("\($0)")
}
john2.list["Comedy"]?.movies.map{
    print("\($0)")
}
//Answer 1-1: Yes, all change propagate through the reference(Heap)
//Answer 1-2: When use class, the change propagate to all reference, in struct, don't share reference so just change the jane2 list
//: ** 1-2

// 1- T-Shirt can be struct or class depending of the point in vie. If Shirt, it's actually a t-shirt, must be object, but if only it's take as value(like in this challente), it's better to use a struct
// 2- User can be a Class, it's more like a real user than a "value" from user.
// 3- TOTALLY STRUCT. Address it's just a value
// 4- Shopping cart it similat to the t-shirt concept, but, the use of reference in class make better choise use Class


struct TShirt : Hashable{
    let sku : Int //add this for hashable protocol
    var size : String
    var color: UIColor
    var price: Double
    var img : String? //use string for playground, will be better use UIImage
    
    init(sku : Int, size : String, color : UIColor, price : Double, img : String?){//add init just for switch between class and struct
        self.sku = sku
        self.size = size
        self.color = color
        self.price = price
        self.img = img
    }
    static func == (lhs: TShirt, rhs: TShirt) -> Bool {
          return lhs.sku == rhs.sku
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(sku)
    }
}

    
class UserStore{
    var name : String
    var mail : String
    var cart : ShoppingCart
    init(name: String, mail : String, cart : ShoppingCart) {
        self.name = name
        self.mail = mail
        self.cart = cart
    }
}

class ShoppingCart{
    let order : Int
    var tshirts : [TShirt]
    
    init( order : Int, tshirts : [TShirt]){
        self.order = order
        self.tshirts = tshirts
    }
    
    func totalCost() -> Double{
        
        let total = tshirts.reduce(0){
            $0 + $1.price
        }
        return total
    }
    
}

let tShirtOne = TShirt(sku: 1, size: "L", color: UIColor.red, price: 9.99, img: "img01")
let tShirtTwo = TShirt(sku: 2, size: "L", color: UIColor.red, price: 5.99, img: "img01")
let tShirtThree = TShirt(sku: 3, size: "L", color: UIColor.red, price: 6.99, img: "img01")
let tShirtFour = TShirt(sku: 4, size: "L", color: UIColor.red, price: 7.99, img: "img01")
let tShirtFive = TShirt(sku: 5, size: "L", color: UIColor.red, price: 19.99, img: "img01")
let tShirtSix = TShirt(sku: 6, size: "L", color: UIColor.red, price: 29.99, img: "img01")
let tShirtSeven = TShirt(sku: 7, size: "L", color: UIColor.red, price: 39.99, img: "img01")

var cart = ShoppingCart(order: 101, tshirts: [tShirtOne,tShirtTwo,tShirtThree])

var userOne = UserStore(name: "Felipe Mardones", mail: "felipe@lalala.cl", cart: cart)


let totalCost = userOne.cart.totalCost()
print(userOne.cart.tshirts.map{"\($0.sku)"})
print(userOne.cart.totalCost())

userOne.cart.tshirts.append(tShirtSix)
userOne.cart.tshirts.insert(tShirtSeven, at: userOne.cart.tshirts.count - 1)
print(userOne.cart.tshirts.map{"\($0.sku)"})
print(userOne.cart.totalCost())
