import UIKit

func printFullName(_ firstName: String, _ lastName: String) {
    print(firstName + " " + lastName)
}
printFullName("Aram", "Azbekian")

func calculateFullName(_ firstName: String, _ lastName: String) -> (String, Int) {
    var fullName = firstName + " " + lastName
    var count = fullName.count
    return (fullName, count)
}
let (myFullName, charCount) = calculateFullName("Aram", "Azbekian")

// challenges

for i in stride(from: 10.0, through: 9.0, by: -0.1) {
    print(i)
}

func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
    number % divisor == 0 ? true : false
}

func isPrime(_ number: Int) -> Bool {
    if number < 0 {
        return false
    }
    
    for i in 2..<number {
        if isNumberDivisible(number, by: i) {
            return false
        }
    }
    
    return true
}

isPrime(6)
isPrime(13)
isPrime(8893)


func fibonacci(_ number: Int) -> Int {
    if number < 0 {
        return 0
    }
    
    if number == 1 || number == 2 {
        return 1
    }
    
    return fibonacci(number - 1) + fibonacci(number - 2)
}

fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(5)
fibonacci(10)
