import UIKit

struct Spaceship {
    var name: String
    var crew: [Spaceman?]
    
}
struct Spaceman: Codable {
    var name: String
    var race: String
}

//: ** 1-2 **
extension Spaceship{
    enum CodingKeys: String, CodingKey{
        case name = "spaceship_name"
        case crew
    }
}


extension Spaceship{
    enum CrewKeys: String, CodingKey{
        case captain
        case officer
    }
}


//let sm = Spaceman(name: "Felipe", race: "Hero")
//let ss = Spaceship(name: "Alcón Milenario", crew: [sm])


//let jsonEncoder = JSONEncoder()
//let jsonData = try jsonEncoder.encode(ss)//serialization
//
//let jsonString = String(data: jsonData, encoding: .utf8)!//deserialization
//print(jsonString)
//
//let jsonDecoder = JSONDecoder()
//var sm2 = try jsonDecoder.decode(Spaceship.self, from: jsonData)
//sm2.name = "Pucky"
//let jsonData2 = try jsonEncoder.encode(sm2)//serialization
//
//print(String(data: jsonData2, encoding: .utf8)!) //deserialization))
//


//: ** 1-3 **

extension Spaceship: Decodable{
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        let crewValues = try decoder.container(keyedBy: CrewKeys.self)
        let captain = try crewValues.decodeIfPresent(Spaceman.self, forKey: .captain)//if new spaceship came with captain
        let officer = try crewValues.decodeIfPresent(Spaceman.self, forKey: .officer)//if new spaceship came with officer
        crew = [captain, officer]
    }
    
}


let incoming = "{\"spaceship_name\": \"USS Enterprise\", \"captain\":{\"name\":\"Spock\", \"race\":\"Human\"}, \"officer\":{\"name\": \"Worf\", \"race\":\"Klingon\"}}"


let newSpaceship = try JSONDecoder().decode(Spaceship.self, from: incoming.data(using: .utf8)!)

print(newSpaceship)


//: ** 1-4 **

extension Spaceship: Encodable {
     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
var klingonSpaceship = Spaceship(name: "IKS NEGH'VAR", crew: [])
let klingonMessage = try PropertyListEncoder().encode(klingonSpaceship)
let jsonEncoder = JSONEncoder()
let jsonDecoder = JSONDecoder()

print("Testing")
let a = try? PropertyListDecoder().decode(Spaceship.self, from: klingonMessage)
print(klingonMessage)
print("a")
print(a!)
