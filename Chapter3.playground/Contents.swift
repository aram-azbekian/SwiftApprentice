import Foundation

// Mini-excercises

let myAge = 28
let isTeenager = myAge >= 13 && myAge <= 19

let theirAge = 30
let bothTeenagers = isTeenager && theirAge >= 13 && theirAge <= 19

let reader = "Aram Azbekian"
let author = "Matt Galloway"
let authorIsReader = reader == author
let readerBeforeAuthor = reader < author


if myAge >= 13 && myAge <= 19 {
    print("Teenager")
} else {
    print("Not a teenager")
}

let answer = myAge >= 13 && myAge <= 19 ? "Teenager" : "Not a teenager"
print(answer)


var counter = 0
while counter < 10 {
    print("Counter is \(counter)")
    counter += 1
}

var counter2 = 0
var roll = 0

repeat {
    roll = Int.random(in: 0...5)
    counter2 += 1
} while roll != 0
print("After \(counter2) rolls roll is \(roll)")


let month = "november"
let year = 2022
if month == "january" {
    print(31)
} else if month == "february" {
    print(year % 4 == 0 ? 29 : 28)
} else if month == "march" {
    print(31)
} else if month == "april" {
    print(30)
} else if month == "may" {
    print(31)
} else if month == "june" {
    print(30)
} else if month == "july" {
    print(31)
} else if month == "august" {
    print(31)
} else if month == "september" {
    print(30)
} else if month == "october" {
    print(31)
} else if month == "november" {
    print(30)
} else if month == "december" {
    print(31)
}


var power = 0
let num = 28
while Int(pow(Double(2), Double(power))) < num {
    power += 1
}
print(power)


var num2 = 4
var result = 0
while num2 != 0 {
    result += num2
    num2 -= 1
}
print(result)
