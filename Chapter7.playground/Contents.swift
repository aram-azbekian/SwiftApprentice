import UIKit

var players = ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli",
               "Franklin"]
print(players.firstIndex(of: "Dan") as Any)

let scores = [2, 2, 8, 6, 1, 2, 1]
for (index, player) in players.enumerated() {
    print("Player \(player) has a score of \(scores[index]) points")
}

var bobData = [
    "name": "Bob",
    "city": "San-Francisco",
    "state": "California"
]
if let city = bobData["city"], let state = bobData["state"] {
    print("Bob lives in \(city), \(state)")
}


// challenges


func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var arrayCopy = array
    
    for (index, element) in array.enumerated() {
        if element == item {
            arrayCopy.remove(at: index)
            break
        }
    }
    
    return arrayCopy
}
print(removingOnce(6, from: scores))
print(removingOnce(7, from: scores))

func removing(_ item: Int, from array: [Int]) -> [Int] {
    var arrayCopy = array
    var i = 0
    
    for element in array {
        if element != item {
            i += 1
        } else {
            arrayCopy.remove(at: i)
        }
    }
    
    return arrayCopy
}
print(removing(2, from: scores))
print(removing(6, from: scores))
print(removing(3, from: scores))


func reversed(_ array: [Int]) -> [Int] {
    var arrayReversed: [Int] = []
    var i = array.count - 1
    
    while i >= 0 {
        arrayReversed.append(array[i])
        i -= 1
    }
    
    return arrayReversed
}
print(reversed(scores))


func middle(_ array: [Int]) -> Int? {
    if array.isEmpty {
        return nil
    } else {
        let n = array.count
        let i = n % 2 == 0 ? n / 2 - 1 : n / 2
        
        return array[i]
    }
}
print(middle(removingOnce(1, from: scores)) as Any)


func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers.isEmpty {
        return nil
    }
    
    var min = numbers[0]
    var max = numbers[0]
    
    for i in 1..<numbers.count {
        if numbers[i] < min {
            min = numbers[i]
        } else if numbers[i] > max {
            max = numbers[i]
        }
    }
    
    return (min, max)
}
print(minMax(of: scores) as Any)
print(minMax(of: removing(1, from: scores)) as Any)


var dict1 = ["NY": "New York", "CA": "California", "WA": "Washington"]
for val in dict1.values {
    if val.count > 8 {
        print(val)
    }
}


func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var dict1Copy = dict1
    
    for (key, value) in dict2 {
        if dict1[key] == nil {
            dict1Copy.updateValue(value, forKey: key)
        }
    }
    
    return dict1Copy
}

let dictOne = ["name": "Aram", "age": "28", "height": "170"]
let dictTwo = ["height": "168", "occupation": "programmer"]
print(merging(dictOne, with: dictTwo))


func occurenciesOfCharacters(in text: String) -> [Character: Int] {
    var answer: [Character: Int] = [:]
    
    for char in text {
        answer[char, default: 0] += 1
    }
    
    return answer
}
print(occurenciesOfCharacters(in: "aram"))
print(occurenciesOfCharacters(in: "california"))
print(occurenciesOfCharacters(in: "bebrari"))


let dic = ["one": 1, "two": 2, "three": 3, "anotherOne": 1]
let anotherDic = ["age": 28, "height": 170, "weight": 68]

func isInvertible(_ dictionary: [String: Int]) -> Bool {
    var someSet: Set<Int> = []
    
    for value in dictionary.values {
        if someSet.contains(value) {
            return false
        } else {
            someSet.insert(value)
        }
    }
    
    return true
}

print(isInvertible(dic))
print(isInvertible(anotherDic))


var nameTitleLookup: [String: String?] = ["Mary": "Engineer",
"Patrick": "Intern", "Ray": "Hacker"]

nameTitleLookup.updateValue(nil, forKey: "Patrick")
nameTitleLookup["Ray"] = nil

print(nameTitleLookup)
