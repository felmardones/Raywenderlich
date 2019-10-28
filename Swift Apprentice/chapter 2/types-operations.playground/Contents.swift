import UIKit

/*:
 # Mini - Exercise
*/

//: **1-1**

let age1 = 42
let age2 = 21

//:1-2 1-3
//: **why is it wrong? dont know, work fine to me....(bad examples), only it's not double**

//let avg1 = (age1 + age2) / 2
let avg1 = Double((age1 + age2) / 2)


//: **2-1**

let firstName = "Felipe"
let lastName = "Mardones"
//: **2-2**
let fullName = firstName + " " + lastName
//: **2-3**
let myDetails = "Hello, my name is \(fullName)"

//: **3-1**

//let temp : (Int, Int, Int, Double) = (month : 1, day : 2, year : 1999, tempOfTheDay : 40)
var temp : (Int, Int, Int, Double) = (month : 1, day : 2, year : 1999, tempOfTheDay : 40)
temp.3 = 20
var (month, day, year, avarageTemperature) = temp
avarageTemperature = 30
let (_, d, _, avgTemp) = temp


/*:
 # ** Challenges **
*/

//: **1-1** and **1-2** are just garbage, really don't see the objective of the challenge.... will be better to asign the second challenge with the firts challenge tuple's

//:

//: **1-3**
//: false
//: true
//: true
//: false if the question is asking for all lines at same time, but if the question is about each line separately, will be true

//: **1-4**
//: it's not valid, the right answer will be **let day = tuple.day** with "day" lowercase

//: **1-5**
//: let it's constant, can't modify after declaration

//: **1-6**
//: Double

//: **1-7**
//: 8

//: **1-8**
//: "10 multiplied by 5 equals 50

//: **1-9**
//: without type conversion, will through an error. With type conversion(Int), the result is 92

//: **1-10**
//: precision, double it's can storage more byte's(8) than float(4).


