import UIKit

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

struct SimpleDate {
    var month = "January"
    var day = 1
    
    var totalDaysInCurrentMonth: Int {
        switch month {
        case "January", "March", "May", "July", "August",
            "October", "December":
            return 31
        case "April", "June", "September", "November":
            return 30
        case "February":
            return 28
        default:
            return 0
        }
    }
    
    var monthsUntilWinterBreak: Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        if day == totalDaysInCurrentMonth {
            if month == "December" {
                month = "January"
            } else {
                month = months[months.firstIndex(of: month)!.advanced(by: 1)]
            }
            day = 1
        } else {
            day += 1
        }
    }
}

//let date = SimpleDate(month: "October")
//date.monthsUntilWinterBreak

let date = SimpleDate()
date.month
date.monthsUntilWinterBreak

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month
valentinesDay.day

let newYearsDay = SimpleDate()
newYearsDay.day
newYearsDay.month

let octoberFirst = SimpleDate(month: "October")
octoberFirst.month
octoberFirst.day

let januaryTwentySecond = SimpleDate(day: 22)
januaryTwentySecond.day
januaryTwentySecond.month


struct Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
    
    static func triange(of number: Int) -> Int {
        (1...number).reduce(0, +)
    }
}
Math.factorial(of: 6)
Math.triange(of: 10)


extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            } else {
                testFactor += 1
            }
        }
        
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        
        return primes
    }
}
Math.primeFactors(of: 81)


extension SimpleDate {
    init(month: Int, day: Int) {
        self.month = months[month-1]
        self.day = day
    }
}
let halloween = SimpleDate(month: 10, day: 31)
halloween.day
halloween.month



// challenges

struct Circle {
    var radius = 0.0
    
    var area: Double {
        get {
            .pi * radius * radius
        }
        set {
            radius = (newValue / .pi).squareRoot()
        }
    }
    
    mutating func grow(byFactor: Int) {
        area *= Double(byFactor)
    }
}
var circle = Circle(radius: 5)
circle.area
circle.radius

circle.grow(byFactor: 3)
circle.area
circle.radius


// changed the SimpleData struct
var decemberThirtyFirst = SimpleDate(month: 12, day: 31)
decemberThirtyFirst.day
decemberThirtyFirst.month

decemberThirtyFirst.advance()
decemberThirtyFirst.day
decemberThirtyFirst.month

var februaryTwentyEighth = SimpleDate(month: 2, day: 28)
februaryTwentyEighth.day
februaryTwentyEighth.month

februaryTwentyEighth.advance()
februaryTwentyEighth.day
februaryTwentyEighth.month

extension Math {
    static func isEven(number: Int) -> Bool {
        number % 2 == 0
    }
    
    static func isOdd(number: Int) -> Bool {
        number % 2 != 0
    }
}

Math.isEven(number: 2)
Math.isEven(number: 17)
Math.isOdd(number: 6)
Math.isOdd(number: 21)


extension Int {
    func primeFactors() -> [Int] {
        var remainingValue = self
        
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            } else {
                testFactor += 1
            }
        }
        
        if remainingValue > 1 {
            primes.append(remainingValue)
        }
        
        return primes
    }
}
81.primeFactors()
