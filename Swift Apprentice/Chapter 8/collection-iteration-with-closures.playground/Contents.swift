import UIKit

//: ** Mini Exercises
// **1-1**
let names = ["Luz", "Luis", "Myrna", "Felipe", "Francisca", "Matías"]
let namesPrint = names.reduce(""){
    $0 + " " + $1
}
print(namesPrint)
// **1-2**
let namesFilter = names.filter{
        $0.count > 4
    }.reduce(""){
        $0 + " " + $1
    }
print(namesFilter)

//: **1-3**
let namesAndAges = ["Felipe" : 32, "Myrna" : 33, "Matías" : 10, "Francisca" : 6]

let overAge = namesAndAges.filter(){
    $0.value >= 18
}

print(overAge)
//: **1-4**

let onlyNames = namesAndAges.filter(){
        $0.value >= 18
    }.map{
        $0.key
    }
print(onlyNames)

//: **Challenges**
//: **1-1**

func repeatTask(times: Int, task: () -> Void){
    for _ in 1...times{
        task()
    }
}

repeatTask(times: 10){
    print("Swift Apprentice is a great book!")
}


//: **1-2**
func mathSum(length: Int, series: (Int) -> Int) -> Int{
    var sum = Int()
    for i in 1...length{
        sum = sum + series(i)
    }
    return sum
}

func fibonacci(_ number: Int) -> Int {
    if (number <= 0) {
        return 0
    } else if (number == 1) || (number == 2) {
        return 1
    } else {
        return fibonacci(number - 1) + fibonacci(number - 2)
    }
}

let sum = mathSum(length: 4){
    fibonacci($0)
}
print(sum)

//: **1-3**
let appRatings : Dictionary = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]
var avarageDictionary = [String : Int]()
 appRatings.forEach{ key, values  in
    
    avarageDictionary[key] = (values.reduce(0, +) / values.count)
}

print(avarageDictionary)

let appAboveAvarage = avarageDictionary.filter{
    $1 >= 3
}

print(" App above 3 \(appAboveAvarage)")
// in the book, says to use filter and map, but i don't get why use map if we can get the result only with filter... if someone read this and know why, plis tell me!!!

