import UIKit



enum ConvertError : Error{
    case invalidString
    case NaN
}
func convertString(string value : String) throws{
    guard value != "" else{
        throw ConvertError.invalidString
    }
    guard let number = Int(value) as Int? else{
        throw ConvertError.NaN
    }
    let a = (number % 2 == 0) ? number : number - 1
    print(number)
    print("Rounding Number : \(a)")
}


try? convertString(string: "120")
try? convertString(string: "-120")
try? convertString(string: "HOLA")

func safeConvert(_ converting: () throws -> () ) -> String{
    do{
        try converting()
        return "Completed convertion"
    }catch ConvertError.invalidString{
        return "Invalid String, cant convert to Int"
    }catch ConvertError.NaN{
        return "Invalid String, can't convert words to number"
    }catch{
        return "No idea what's wrong"
    }
}

safeConvert{
    try convertString(string: "120")
    try convertString(string: "40052854032445")
    try convertString(string: "")
    try convertString(string: "HOLA")

}
