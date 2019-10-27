import UIKit
let myAge : Int = 32
var avarageAge : Double = 31
avarageAge = (Double(myAge) + avarageAge)/2
let testNumber : Int = 20
let evenOdd = testNumber % 2

// Challenge 1
let exercises = 9
var exercisesSolved = 0
var answer = 0
answer += 1
answer += 10
answer = answer >> 3

// Challenge 2
var age: Int = 16
print(age)
age = 30
print(age)

// Challenge 3
//really really don't understand the objective of this exercise
let a: Int = 46
let b: Int = 10
// 1
let answer1: Int = (a * 100) + b
// 2
let answer2: Int = (a * 100) + (b * 100)
// 3
let answer3: Int = (a * 100) + (b / 10)
// Challenge 4

(5*3) - (4/2)*2
// Challenge 5

let a1 : Double = 10.2
let b1 : Double = 11.4
let avarage = (a1 + b1) / 2

// Challenge 6

let fahrenheit : Double  = 100
let celcius = (fahrenheit - 32) / 1.8

// Challenge 7
let position = 23
let row = (position + 1) / 8
let col = (position + 1) / row

let column = position / 8
var a3 : String = "";
for i in 0...63 {
    if ( (i % 8) == 0) {
        a3 = "\(a3) \n"
        
    }
    a3 = "\(a3) \(i) "
}
print(a3)

//Challenge 8
let degrees : Double = 100
let radians = degrees * Double.pi / 180


//Challenge 9
let x1 : Double = 10
let y1 : Double = 15
let x2 : Double = 20
let y2 : Double = 30
let x1Diff = x1 - x2
let y2Diff = y1 - y2
let distance = (pow(x1Diff, 2) + pow(y2Diff, 2))
distance.squareRoot()


