import UIKit

func multiplyAndDivide(_ number: Int, by factor: Int)
    -> (product: Int, quotient: Int) {
        return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient
let (p, q) = multiplyAndDivide(4, by: 2)
print(p)
print(q)

func printFullName(_ firstName : String,_ lastName : String){
    print(firstName + " " + lastName)
}

printFullName("Felipe", "Mardones")

func calculateFullName(_ fullName : String) -> (String, Int){
    return (name: fullName, length: fullName.count)
}

let (name, length) = calculateFullName("Felipe Mardones")
print("My name is \(name) and the length it's \(length)")

//func add(a : Int, b : Int) -> Void{
//    print("\(a + b)")
//}
//func mult(a : Int, b : Int) -> Int{
//    return a * b
//}
//func mathTry(_ function: (Int, Int) -> Any, _ a : Int, _ b : Int){
//    print(function(a, b))
//}
//
//mathTry(add, 3, 3)
//mathTry(mult,2,2)

//: ** Challenges
//: **1-1**
//: 1: First one is exclusive, second is inclusive
//: 2:

for i in stride(from: 10.0, through: 9.0, by: -0.1){
    print(i)
}

func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool{
    if ( (number % divisor) == 0 ){ return true }
    return false
}

//: **1-2**
func isPrime(_ number: Int) -> Bool{
    var count = 0;
    for i in 1...number{
        if( count > 2){
            return false
        }
        if( number % i == 0 ){
            count += 1
        }
    }
    return true
}

func isPrimeImprove(_ number: Int) -> Bool{
    for i in 2..<number{
        if(number % i == 0){
            return false
        }
    }
    return true
}


print(isPrimeImprove(6))
print(isPrimeImprove(13))
print(isPrimeImprove(8893))

//: **1-3**
func fibonnacci(_ number: Int) -> Int{
    if(number == 1 || number == 2){
        return 1
    }else if(number == 0){
        return 0;
    }else{
        return fibonnacci(number - 1) + fibonnacci(number - 2)
    }

}

fibonnacci(1)
fibonnacci(2)
fibonnacci(3)
fibonnacci(4)
fibonnacci(5)
fibonnacci(10)


