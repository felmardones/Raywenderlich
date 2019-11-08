import UIKit

//: ** Mini Exercise **
// just do the important one's
var dic : [String : String ] = [:]
dic.reserveCapacity(2)
dic = ["Name" : "Felipe", "State" : "Santiago"]
func printName(playerName : String){
    if dic.values.contains(playerName){
        if let name = dic["Name"], let state = dic["State"] {
            print("\(name) is from \(state)")
            
        }
        
    }
}

printName(playerName: "Felipe")

let setLiteral : Set<Int> = [1,2,3,4,5,6]
let setInfer = Set([1,2,3,4,5,6])
print(setLiteral)
print(setInfer)
print(setLiteral.contains(3))

//: ** Challenges **
//: **1-1**
// 1- true 2- false 3- true
//: **1-2**
// don't understand what they want to us to do with the statement "has been declared as",it's like they're asking for the type of the array? but the "4","5","6".... show us like they want to tell them if it's the line throw's an error or not... For the first, approach, will be int, the second, 1,6,7,8 are true, only 5 throw's an error for out of bounderies.
// * after reading for second time, i can tell all are part of the 1 question, i will keep the answer for further references.
//* The right answer will be:

// 4-true 5-false 6-true 7-true 8-true 9-true 10-true 11-false->type conflict 12-false-> type conflict 13-true


//: **1-2**
var arrTest = [1,2,3,4,5,2];
func removingOnce(_ item: Int, from array: inout [Int] ) -> [Int]{
    var arr : [Int] = []
    if(array.contains(item)){
        guard let indexOf = array.firstIndex(of: item) else {
            print("not found")
            return array
        }
        let removed = array.remove(at: indexOf )
        arr.append(removed)
        return arr
    }
   
    return array
}
var removedElement = removingOnce(2,from: &arrTest)
print(removedElement)
print(arrTest)

//: **1-3**
var arrTestTwo = [1,2,3,4,5,2];

func removing(_ item: Int, from array: inout [Int]) -> [Int]{
    var removedElement = [Int]()
//    use reversed to prevent with out range index, while we delete items inside the array, the index ande total of the array change, so it's better do it with the reversed() function to never get out of range.
    for (index, value) in array.enumerated().reversed() {
        if value == item{
            let removedItem = array.remove(at: index)
            removedElement.append(removedItem)
        }
    }
    if removedElement.count > 0{
        print("removed: \(removedElement)")
    }
    print("array: \(array)")
    return array
}


removing(2, from: &arrTestTwo)

//: **1-4**

func reversed(_ array: inout [Int]) -> [Int]{
    var arrContainer = [Int]()
    for item in array{
        arrContainer.insert(item, at: 0)
    }
    array = arrContainer
    return array
}
var arr = [1,2,3,4,5,6,7,8,9]
print(arr)
reversed(&arr)
print(arr)

//: **1-5**

func middle(_ array: [Int]) -> Int?{
    if(array.count > 0){
        let index = Float(array.count) / 2.0
        let i = Int(index.rounded(.down))
        return array[i-1]
    }
    return nil
}
middle([1,2,3,4,5,6,7,8,9])

//: **1-6**
let arrMinMax = [4,2,3,4,5,6,7,8,9,20,12312]
func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    var min = 10;//put some number greater than the lowest of the array just to know if it's working right.
    var max = 10;
    for num in arrMinMax{
        if(min >= num){
          min = num
        }
        if( max <= num){
            max = num
        }
    }
    return (min,max)
}

if let (mini,maxi) = minMax(of: arrMinMax){
    print("Min: \(mini) and Max: \(maxi)");
}else{ print("no number found")}

//: **1-7**
// 1 and 3 are true, 2 cant infer the type.
//4-false 5-true 6- false(let!) 7-false
//8- true 9-true 10-true ... love swift so far =D

//: **1-8**
let states = ["CA" : "California", "NY" : "New York", "TX" : "Texas", "TS" : "Test State for challenge"]

func printStatesLongerThanEight(_ dictionary : [String : String]){
    for (index, item) in dictionary{
        if(item.count >= 8){
            print("States Code: \(index)  State : \(item)")
        }
    }
}
printStatesLongerThanEight(states)

// ** 1-9 **
func merging(_ dict1: [String: String], with dict2: [String: String]) ->
    [String: String]{
        //        can be done with for and compare the keys, if it's not equal, add the two pairs to the new dictionary to return, this also can be done with merge(where:)
        var dictMerge = dict1
        for (key,value) in dict2{
            if(!dictMerge.keys.contains(key)){
                dictMerge[key] = value
            }
        }
        return dictMerge
}

let statesTest = ["CA" : "California", "NY" : "New York", "TX" : "Texas", "TS" : "Test State for challenge"]
let statesTestNew = ["AL" : "ALsomthing", "IL" : "ILAnother", "TX" : "Texasss", "TS" : "Test State for challengesss"]//add sss to test if take the first dictionary or the second.

let mergingDictionaries = merging(statesTest, with: statesTestNew)
print(mergingDictionaries)

func occurrencesOfCharacters(in text: String) -> [Character: Int]{
    var dictionaryOfCharacter = [Character : Int]()
    for c in text{
        if dictionaryOfCharacter.keys.contains(c){
            if let count = dictionaryOfCharacter[c]{
                dictionaryOfCharacter[c] = count + 1
            }else{
                dictionaryOfCharacter[c, default: 0]
            }
        }else{
            dictionaryOfCharacter[c] = 1
        }
    }
    return dictionaryOfCharacter
}

let total = occurrencesOfCharacters(in: "aaaaaeeiooooouuuuuuuuuuu")
print(total)

//: **1-11**
func isInvertible(_ dictionary: [String: Int]) -> Bool{
    let uniqueSet = Set(dictionary.values)
    if(uniqueSet.count != dictionary.count){
        return false
    }
    return true
}
let statesTest1 = ["CA" : 1, "NY" : 2, "TX" :3, "TS" : 4]
let statesTest2 = ["CA" : 1, "NY" : 2, "TX" :3, "TS" : 2]
print(isInvertible(statesTest1))
print(isInvertible(statesTest2))

var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick":
    "Intern", "Ray": "Hacker"]

nameTitleLookup.updateValue(nil, forKey: "Patrick")
//nameTitleLookup.remove(at: nameTitleLookup.index(forKey: "Ray")!)
//or
nameTitleLookup["Ray"] = nil
print(nameTitleLookup)


let voidClosure: () -> () = {
    print("Swift Apprentice is awesome!")
}
voidClosure()

