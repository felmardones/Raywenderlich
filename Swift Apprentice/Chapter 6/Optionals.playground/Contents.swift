import UIKit

//: ** Mini Exercises

var myFavoriteSong : String? = "Corsario Universal"

let parsedInt = Int("10")
//: it's because dont know afte compiler there is a value to parse, i think...

let parsedIntTwo = Int("dog")//nil


if let myFavoriteSong = myFavoriteSong{
    print(myFavoriteSong)
}else{
    print("I don't have a favorite song")
}

//: ** Challenges **
//: **1-1**
//: 1-true 2-false 3-true 4-true

//: **1-2**

func divideIfWhole(number : Int, divider : Int) -> Int?{
    let count = dividerHelper(number, divider)//this line throw a error, but dont know why... still work everything...ANNOYING!!!
    if count > 0{
        return count
    }
    return nil
}
var count : Int = 0

public func dividerHelper(_ number : Int, _ divider : Int) -> Int{
    if(number % divider == 0){
        let newNumber = number / divider
        count += 1
//the exercise ask for the division answer, but i miss understand that and came with another aproach,
//how many time the number can divide until the result wasn't 0. so i make this func recursive, to do the count.
        dividerHelper(newNumber, divider)
    }
    print("count: \(count)")
    return count
}

func getDivide(n : Int, d : Int){
//    guard let divideIfWhole = divideIfWhole(number: n, divider: d) else {
//        print("Not Divisible :[")
//        return
//    }
//    print("Yep, it divides \(divideIfWhole)")

    let divide = divideIfWhole(number: n, divider: d) ?? 0
    print("It divide \(divide) times")
}

//put 10 by 3 first to avoid conflic with the global count, yeah, am lazy, but it's just a.... -.-
getDivide(n: 10, d: 3 );
getDivide(n: 10, d: 2 );
getDivide(n: 1000, d: 2 );

// ** 1-4 **
let number: Int??? = 10
print(number!!!)

//: i think this is the approach they what to see
if let num = number{
    if let num = num{
        if let num = num{
            print(num)
        }
    }
}

func printNumber(_ number: Int???){
    guard let n = number else{
        print("nil")
        return
    }
    print(n!! as Any)
}
printNumber(10)
printNumber(nil)
