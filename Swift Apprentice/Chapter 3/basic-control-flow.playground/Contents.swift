import UIKit

//** I really want to do all exercise from the books, but so far are more beginners "must do". I will jump to the Challenge's



//: **1-1**

//: the scope of lastName

//: **1-2**

//: true | false | true | true

//: **1-3**
//: This is a really bad exercise to learn loops, it's just pos[row+1][col+1]. The contentof the book it's good, but the challenges and mini exercise are confusing(so far), it's much better hacking with swift or udemy angela yu in this case.

//: **1-4**
let a : Double = 1;
let b : Double = 3;
let c : Double = 2;
let x = ( -b - (pow(b, 2.0) - 4 * a * c).squareRoot() ) / (2 * a)
print(x)

//: **1-5**

let date = (month: "february", year : 1987)
let (month, year) = date
//i really (lazy) don't want to do a infinit else if statement, so i use switch/case and just add the print. I don't know if there're some formula to get the total day of the month or just put it directly like i do next. The book need to especify more on their exercise and what they want to accomplish, it's just REALLY annoying... -1 star for that.
switch month {
    case "january":
        break;
    case "february":
        if ((year % 4) == 0 || (year % 400) == 0 && (year % 100) != 0 ){
            print("february: 29")
        }else{
            print("february: 28")
        }
        break;
    case "march":
        break;
    case "april":
        break;
    case "may":
        break;
    case "june":
        print("June: 30 days")
        break;
    case "july":
        break;
    case "august":
        break;
    case "september":
        break;
    case "october":
        break;
    case "november":
        break;
    default:
        print("December: 31 days")
        break;
}
//: **1-6**
let number = 5.0
let log = log2(number)
if log.rounded(.up) == log.rounded(.down){
    print("it's base 2")
}else{
    print("it's not base 2")
}
var count : Double = 0
var str_count : String = ""
while(count < 10){
    if((Int(count) % 3) == 0){
        str_count += "\n"
    }
    str_count += "| \(pow(count,2.0)) |"
    count += 1
}
print(str_count)


//: **1-7**
//: **ANOTHER FIBONACCI Exercise.... boring**
//: without array or some collection to hold the old value, i just track with 'old_n' and 'old_n2'.
var counter_n = 0
var n = 0;
var old_n = 0;
var old_n2 = 0;
var str_fib = ""
while(counter_n < 20){
    if(n == 0){
        str_fib += "0 "
        old_n = n
        n = 1
    }else{
        str_fib += "\(n) "
        old_n2 = n
        n = n + old_n
        old_n = old_n2

    }
    counter_n += 1
}
print(str_fib)

//: **1-9**
let factorial = 6
var counterFactorial = 1
var total = 2;
counter_n = 1
while(counter_n < factorial){
    counterFactorial += counterFactorial * counter_n
    counter_n += 1;

}
print(counterFactorial)

//: **1-10**

//: so boring, at least, put some context or history, "you're playing dice and you bet, bla bla bla...." and the probability it's 1/3

let random = Int.random(in: 2...12)
var countRolls = 0
var res = 0
while(res != random){
    let dice1 = Int.random(in: 1...6)
    let dice2 = Int.random(in: 1...6)
    res = (dice1 + dice2)
    print("res: \(res)")
    print("random : \(random)")
    countRolls += 1
}
print("Count Rolls: \(countRolls)")//count how many time rolls the dice until get the random number


