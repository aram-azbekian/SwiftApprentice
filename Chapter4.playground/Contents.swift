import UIKit

let range = 1...10
for i in range {
    print(i*i)
}

for i in range {
    print(sqrt(Double(i)))
}

var sum = 0
for row in 0..<8 where row % 2 != 0 {
    for column in 0..<8 {
        sum += row * column
    }
}

let age = 28
switch age {
case 0...2:
    print("Infant")
case 3...12:
    print("Child")
case 13...19:
    print("Teenager")
case 20...39:
    print("Adult")
case 40...60:
    print("Middle-aged")
case _ where age > 60:
    print("Elderly")
default:
    break
}

let tup = (name: "Aram", age: 28)
switch tup {
case let (name, age) where 0...2 ~= age:
    print("\(name) is an infant")
case let (name, age) where 3...12 ~= age:
    print("\(name) is a child")
case let (name, age) where 13...19 ~= age:
    print("\(name) is a teenager")
case let (name, age) where 20...39 ~= age:
    print("\(name) is an adult")
case let (name, age) where 40...60 ~= age:
    print("\(name) is a middle-aged")
case let (name, age) where age > 60:
    print("\(name) is an elderly")
default:
    break
}


// challenges

var num = 10
for i in 0...10 {
    print(num-i)
}

for i in 0...10 {
    print(Double(i)/10)
}
