import UIKit

// challenges


func printHashes(_ numberOfHashes: Int) -> String {
    var output = ""
    
    for _ in 0..<numberOfHashes {
        output += "#"
    }
    
    return output
}

func characterCount(_ string: String) {
    var stringStorage: [Character: Int] = [:]
    
    for char in string {
        stringStorage[char, default: 0] += 1
    }
    
//    for char in stringStorage {
//        print("\(char.key): \(char.value)")
//    }
    
    stringStorage
        .sorted{ $0.1 > $1.1 }
        .map{ print("\($0.0): \(printHashes($0.1))") }
}
characterCount("hello")
characterCount("Amsterdam")
characterCount("abbasakiiin")


func countWordsInAString(_ string: String) -> Int {
    var counter = 0
    
    if string.isEmpty { return 0 }
    
    let startIndex = string.startIndex
    let n = string.count
    for i in 0..<n {
        let curIndex = string.index(startIndex, offsetBy: i)
        if string[curIndex].isWhitespace {
            counter += 1
        }
    }
    counter += 1
    
    return counter
}
print(countWordsInAString("hello how are you"))
print(countWordsInAString("a"))


func nameFormatter(_ string: String) -> String {
    var output = ""
    
    let commaIndex = string.firstIndex(of: ",")!
    let spaceIndex = string.index(commaIndex, offsetBy: 1)
    
    let lastName = string[..<commaIndex]
    let firstName = string[string.index(after: spaceIndex)...]
    
    output = String(firstName) + " " + String(lastName)
    
    return output
}
print(nameFormatter("Azbekian, Aram"))
print(nameFormatter("Galloway, Matt"))


func components(_ string: String, separatedBy separator: String) -> [String] {
    let indicies = string.indices
    var output: [String] = []
    var separatorIdx = separator.startIndex
    var startOfWord = string.startIndex
    var endOfWord = string.startIndex
    
    for index in indicies {
        if string[index] == separator[separatorIdx] {
            if separator[separatorIdx] == separator.last {
                output.append(String(string[startOfWord...endOfWord]))
                startOfWord = string.index(after: index)
                separatorIdx = separator.startIndex
                continue
            }
            separatorIdx = separator.index(separatorIdx, offsetBy: 1)
        } else {
            endOfWord = index
        }
    }
    output.append(String(string[startOfWord...endOfWord]))
    
    return output
}
print(components("Jojo, Joestar, Blinken, gazel", separatedBy: ", "))
