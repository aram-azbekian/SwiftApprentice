import UIKit

let months = [
    "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
]

func semester(for month: String) -> String {
    switch month {
    case "August", "September", "October", "November", "December":
        return "Autumn"
    case "January", "February", "March", "April", "May":
        return "Spring"
    default:
        return "Not in semester"
    }
}

semester(for: "April")


/*
enum Month {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}
*/

enum Month: Int {
    case january = 1, february, march, april, may, june, july,
         august, september, october, november, december
    
    var semester: String {
        switch self {
        case .august, .september, .october, .november, .december:
            return "Autumn"
        case .january, .february, .march, .april, .may:
            return "Spring"
        case .june, .july:
            return "Summer"
        }
    }
    
    var monthsUntilWinterBreak: Int {
        Month.december.rawValue - self.rawValue
    }
}

func semester(for month: Month) -> String {
    switch month {
    case .august, .september, .october, .november, .december:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Summer"
    }
}

var month = Month.april
semester(for: month)

month = .september
semester(for: month)


let semester = month.semester


func monthsUntilWinterBreak(for month: Month) -> Int {
    Month.december.rawValue - month.rawValue
}
monthsUntilWinterBreak(for: .april)


let fifthMonth = Month(rawValue: 5)!
monthsUntilWinterBreak(for: fifthMonth)


let monthsLeft = fifthMonth.monthsUntilWinterBreak


enum Icon: String {
    case music
    case sports
    case weather
    
    var filename: String {
        "\(rawValue).png"
    }
}

let icon = Icon.weather
icon.filename


enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin.quarter
coin.rawValue

let coinWallet: [Coin] = [
    .penny, .penny, .quarter, .nickel, .nickel, .quarter, .dime, .dime
]


var balance = 100

/*
func withdraw(amount: Int) {
    balance -= amount
}
 */

enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}

func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough money")
    }
}

let result = withdraw(amount: 99)
switch result {
case .success(let newBalance):
    print("Your new balance is \(newBalance)")
case .error(let message):
    print(message)
}


enum HTTPMethod {
    case get
    case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there!")
guard case .post(let body) = request else {
    fatalError("No message was posted")
}
print(body)


enum TrafficLight {
    case red, yellow, green
}
let trafficLight = TrafficLight.red

enum LightSwitch {
    case on, off
}
let homeLightSwitch = LightSwitch.on


enum Pet: CaseIterable {
    case cat, dog, bird, turtle, fish, hamster
}

for pet in Pet.allCases {
    print(pet)
}


enum Math {
    static let e = 2.7183
    
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}
let factorial = Math.factorial(of: 6)


let nestEgg = 25000 * pow(Math.e, 0.07 * 20)


var age: Int?
age = 17
age = nil

switch age {
case .none:
    print("No value")
case .some(let value):
    print("Got a value: \(value)")
}



// challenges

let coinPurse: [Coin] =
    [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func numberOfCents(coins: [Coin]) -> Int {
    coins.reduce(0) { $0 + $1.rawValue }
}
numberOfCents(coins: coinPurse)


enum NewMonth: Int {
    case january = 1, february, march, april, may, june, july,
        august, september, october, november, december
    
    var monthsTillSummer: Int {
        if rawValue < Month.june.rawValue {
            return Month.june.rawValue - rawValue
        } else if rawValue > Month.august.rawValue {
            return Month.august.rawValue - rawValue + 12
        } else {
            return 0
        }
    }
}

let month1 = NewMonth(rawValue: 3)!
month1.monthsTillSummer

let month2 = NewMonth.november
month2.monthsTillSummer

let month3 = NewMonth.june
month3.monthsTillSummer


enum Direction {
    case north
    case south
    case east
    case west
}

let movements: [Direction] = [.north, .north, .west, .south,
 .west, .south, .south, .east, .east, .south, .east]
var location = (x: 0, y: 0)

movements.map {
    switch $0 {
    case .north:
        location.y += 1
    case .south:
        location.y -= 1
    case .west:
        location.x -= 1
    case .east:
        location.x += 1
    }
}
location
