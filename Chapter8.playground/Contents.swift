import UIKit

let names = ["Aram", "Ira", "Masha", "Sasha", "Yan", "Kolya"]
let reducedStr = names.reduce("") {
    $0 + $1
}

let reducedAndFiltered = names
    .filter({ $0.count > 3 })
    .reduce("") { $0 + $1 }

let namesAndAges = [
    "Aram": 28,
    "Ira": 17,
    "Masha": 19,
    "Sasha": 31,
    "Yan": 14,
    "Kolya": 29
]

let belowEighteen = namesAndAges
    .filter({ $0.value < 18 })

let belowEighteenNames = namesAndAges
    .filter({ $0.value < 18 })
    .map({ $0.key })


// challenges

func repeatTask(times: Int, task: () -> Void) {
    for _ in 0..<times {
        task()
    }
}

repeatTask(times: 10) {
    print("Swift Apprentice is a great book!")
}

func mathSum(length: Int, series: (Int) -> Int) -> Int {
    var sum = 0
    
    for i in 1...length {
        let number = series(i)
        sum += number
    }
    
    return sum
}

print(mathSum(length: 10, series: { num in
    num*num
}))

// copy-paste of fibonacci func from Chapter 5
func fibonacci(_ number: Int) -> Int {
    if number < 0 {
        return 0
    }
    
    if number == 1 || number == 2 {
        return 1
    }
    
    return fibonacci(number - 1) + fibonacci(number - 2)
}
print(mathSum(length: 10, series: fibonacci(_:)))


let appRatings = [
  "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
  "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
  "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]

var averageRatings: [String: Double] = [:]

appRatings.forEach({
    averageRatings[$0.key] = Double($0.value.reduce(0, +)) /
        Double($0.value.count)
})
print(averageRatings)

let ratingAboveThree = averageRatings
    .filter({ $0.value > 3.0 })
    .map({ $0.key })
print(ratingAboveThree)
