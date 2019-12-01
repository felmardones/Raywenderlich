import UIKit


//: **1-1**
enum FormField {
  case firstName(String)
  case lastName(String)
  case emailAddress(String)
  case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let age) = submittedAge, age == minimumAge {
    print("Yeah, match with \(minimumAge)")
}else{
    print("No!!!! it's not \(minimumAge)")
}

//: **1-2**
enum CelestialBody {
  case star
  case planet(liquidWater: Bool)
  case comet
}
let telescopeCensus = [ CelestialBody.star, CelestialBody.planet(liquidWater: false), CelestialBody.planet(liquidWater: true), CelestialBody.planet(liquidWater: true), CelestialBody.comet
]

for i in telescopeCensus{
    
    if case CelestialBody.planet(let planet) = i, planet == true{
        print("yeah! this planet have liquid water!!!!")
    }
}


let queenAlbums = [
  ("A Night at the Opera", 1974),
  ("Sheer Heart Attack", 1974),
  ("Jazz", 1978),
  ("The Game", 1980)
]

for album in queenAlbums{
    switch album {
    case (_ , 1974):
        print("This album was released in 1974")
    default:
        print("This album was'nt released in 1974")
    }
}

let coordinates = (lat: 192.89483, long: -68.887463)

switch coordinates {
case (let lat, _) where lat > 0:
    print("North Side MF!!!!")
case (let lat, _) where lat < 0:
    print("South Side BITCHEs!!!!!")
case (0,0):
    print("EQUATOR!")
default:
    print("Oh no, the code fail!")
}
