import Foundation

public struct Person {
    public private(set) var first: String
    public private(set) var last: String
    public var fullName: String {
        "\(first) \(last)"
    }
    
    public init(first: String, last: String) {
        self.first = first
        self.last = last
    }
}

open class ClassyPerson {
    public private(set) var first: String
    public private(set) var last: String
    open var fullName: String {
        get {
            "\(first) \(last)"
        }
    }
    
    public init(first: String, last: String) {
        self.first = first
        self.last = last
    }
}
