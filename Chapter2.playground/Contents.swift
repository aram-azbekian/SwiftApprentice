import Foundation

// Mini-excercises

let age1: Double = 42
let age2: Double = 21
let avg1 = (age1 + age2) / 2

let firstName = "Aram"
let lastName = "Azbekian"
let fullName = firstName + " " + lastName
let myDetails = "Hello, my name is \(fullName)"

let tup = (2022, 12, 11, -0.2)
var tup2 = (year: 2022, month: 12, day: 11, avgTemp: -0.2)
let (_, _, day, avgTemp) = tup2
day
avgTemp
tup2.avgTemp = 0.8
tup2

// Challenges

let coordinates: (Int, Int) = (2, 3)
let namedCoordinate: (x: Int, y: Int) = (x: 2, y: 3)

let a = 4
let b: Int32 = 100
let c: UInt8 = 12
a + Int(b) - Int(c)
