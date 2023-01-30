import UIKit

protocol Vehicle {
    func accelerate()
    func stop()
}

class Unicycle: Vehicle {
    var peddling = false
    
    func accelerate() {
        peddling = true
    }
    
    func stop() {
        peddling = false
    }
}

enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn(_ direction: Direction)
    func description() -> String
}

protocol VehicleParameters {
    var weight: Int { get }
    var name: String { get set }
}


protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double
    
    required init(initialAmount: Double) {
        value = initialAmount
    }
    
    required init?(transferAccount: Account) {
        value = transferAccount.value
    }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.0)
let transferAccount = accountType.init(transferAccount: account)!


protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelsSize: Double { get set }
}

protocol Area {
    var area: Double { get }
}

struct Square: Area {
    var side: Double
    
    var area: Double {
        side*side
    }
}

struct Triangle: Area {
    var base: Double
    var height: Double
    
    var area: Double {
        0.5 * base * height
    }
}

struct Circle: Area {
    var radius: Double
    
    var area: Double {
        .pi * radius * radius
    }
}

let square = Square(side: 5.0)
let triangle = Triangle(base: 1.2, height: 5.0)
let circle = Circle(radius: 4.0)

square.area
triangle.area
circle.area



/*
class Bike: WheeledVehicle {
    var numberOfWheels = 2
    var wheelsSize = 16.0
    
    var peddling = false
    var breaksApplied = false
    
    func accelerate() {
        peddling = true
        breaksApplied = false
    }
    
    func stop() {
        peddling = false
        breaksApplied = true
    }
}
*/


protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
//    typealias WeightType = Int
    
    var weight: Int { 100 }
}

class LightThing: WeightCalculatable {
//    typealias WeightType = Double
    
    var weight: Double { 0.0001 }
}


protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

class Bike: Vehicle, Wheeled {
    var numberOfWheels = 2
    var wheelSize = 16.0
    
    func accelerate() {
        print("Go")
    }
    
    func stop() {
        print("Don't go")
    }
}

func roundAndRound(transportation: Vehicle & Wheeled) {
    transportation.stop()
    print("The breaks are being applied to \(transportation.numberOfWheels) number of wheels")
}
roundAndRound(transportation: Bike())


protocol Reflective {
    var typeName: String { get }
}

extension String: Reflective {
    var typeName: String {
        "I'm string"
    }
}

let title = "Swift Apprentice"
title.typeName


class AnotherBike: Wheeled {
    var peddling = false
    var numberOfWheels = 2
    var wheelSize = 16.0
}

extension AnotherBike: Vehicle {
    func accelerate() {
        peddling = true
    }
    func stop() {
        peddling = false
    }
}

protocol Named {
    var name: String { get set }
}

class ClassyName: Named {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct StructyName: Named {
    var name: String
}

var named: Named = ClassyName(name: "Classy")
var copy = named
named.name = "Still Classy"
named.name
copy.name

named = StructyName(name: "Structy")
copy = named
named.name = "Still structy"
named.name
copy.name


protocol Named2: AnyObject {
    var name: String { get set }
}

class Record {
    var wins: Int
    var losses: Int
    
    init(wins: Int, losses: Int) {
        self.wins = wins
        self.losses = losses
    }
}

let a = Record(wins: 10, losses: 5)
let b = Record(wins: 10, losses: 5)

// a == b   -> Doesn't compile

extension Record: Equatable {
    static func ==(lhs: Record, rhs: Record) -> Bool {
        lhs.wins == rhs.wins &&
        lhs.losses == rhs.losses
    }
}

a == b

extension Record: Comparable {
    static func < (lhs: Record, rhs: Record) -> Bool {
        if lhs.wins == rhs.wins {
            return lhs.losses > rhs.losses
        }
        return lhs.wins < rhs.wins
    }
}

a >= b
a < b

let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]
leagueRecords.sort()
leagueRecords

leagueRecords.max()
leagueRecords.min()
leagueRecords.starts(with: [teamA, teamC])
leagueRecords.contains(teamA)



class Student {
    let email: String
    let firstName: String
    let lastName: String
    
    init(email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Student: Hashable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.email == rhs.email &&
        lhs.firstName == rhs.firstName &&
        lhs.lastName == rhs.lastName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
        hasher.combine(firstName)
        hasher.combine(lastName)
    }
}

let john = Student(email: "john@gmail.com",
                   firstName: "John",
                   lastName: "Appleseed")
let lockermap = [john: "148"]

extension Student: Identifiable {
    var id: String {
        email
    }
}

extension Student: CustomStringConvertible {
    var description: String {
        "\(firstName) \(lastName)"
    }
}
print(john)



// challenges

protocol Feadable {
    func feed()
}

protocol Flyable {
    func cage()
}

protocol Swimable {
    func putInATank()
}

protocol Walkable {
    func walk()
}

var tankArr: [Swimable] = []
var cageArr: [Flyable] = []

class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
}

extension Animal: Feadable {
    func feed() {
        print("Feeding the animal")
    }
}

class Dog: Animal { }
class Cat: Animal { }
class Fish: Animal { }
class Bird: Animal { }

extension Dog: Walkable {
    func walk() {
        print("Walking a dog")
    }
}

extension Cat { }

extension Fish: Swimable {
    func putInATank() {
        print("A fish has been put in a tank")
        tankArr.append(self)
    }
}

extension Bird: Flyable {
    func cage() {
        print("Putting a bird in a cage")
        cageArr.append(self)
    }
}

let nemo = Fish(name: "Nemo")
let dori = Fish(name: "Dori")
let tom = Cat(name: "Tom")
let beethoven = Dog(name: "Beethoven")
let eagle = Bird(name: "Eagle")
let parrot = Bird(name: "Parrot")

let allAnimals = [nemo, dori, tom, beethoven, eagle, parrot]

for animal in allAnimals {
    animal.feed()
    if let animal = animal as? Flyable {
        animal.cage()
        continue
    }
    if let animal = animal as? Swimable {
        animal.putInATank()
    }
    if let animal = animal as? Walkable {
        animal.walk()
    }
}
