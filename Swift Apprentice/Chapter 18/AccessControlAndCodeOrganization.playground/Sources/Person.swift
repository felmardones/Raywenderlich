import Foundation

protocol Info{
    var name : String { get }
    var lastName : String { get }
    var fullName : String { get }
}
struct Person: Info{
    private(set) var name : String
    private(set) var lastName :String
    public var fullName : String{
        get{
            return name + " " + lastName
        }
    }
}

open class ClassyPerson: Info {
    private(set) var name : String
    private(set) var lastName : String
    open var fullName : String{
        get{
            return "\(name) \(lastName)"
        }
    }
    
    public init(name : String, lastName : String) {
        self.name = name
        self.lastName = lastName
    }
}
