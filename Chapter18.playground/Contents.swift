import UIKit
import XCTest



let account = BasicAccount()

account.deposit(amount: 10.0)
account.withdraw(amount: 5.0)

//account.balance = 1000000.0
//cannot assign to property; setter is inaccessible

let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.0)

let check = johnChecking.writeCheck(amount: 200.0)!

let janeChecking = CheckingAccount()
janeChecking.deposit(check)
janeChecking.balance

janeChecking.deposit(check)
janeChecking.balance


class SavingsAccount: BasicAccount {
    var interestRate: Double
//    private let pin: Int
    
    @available(*, deprecated, message: "Use init(interestRate:pin:) insted")
    init(interestRate: Double) {
        self.interestRate = interestRate
    }
    
    @available(*, deprecated, message: "Use processInterest(pin:) instead")
    func processInterest() {
        let interest = balance * interestRate
        deposit(amount: interest)
    }
}


var person = Person(first: "Aram", last: "Azbekian")
person.first
person.last
person.fullName

var classyP = ClassyPerson(first: "Buba", last: "Mahoney")
classyP.first
classyP.last
classyP.fullName


class Doctor: ClassyPerson {
    override var fullName: String {
        "Dr. \(first) \(last)"
    }
}

var john = Doctor(first: "John", last: "Malkovic")
john.first
john.last
john.fullName



//let sAccount = SavingsAccount(interestRate: 1.04)
//sAccount.processInterest()

func createAccount() -> some Account {
    CheckingAccount()
}



class BankingTests: XCTestCase {
    var checkingAccount: CheckingAccount!
    
    override func setUp() {
        super.setUp()
        checkingAccount = CheckingAccount()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNewAccountBalanceZero() {
        XCTAssertEqual(checkingAccount.balance, 0)
    }
    
    func testCheckOverBudgetFails() {
        let check = checkingAccount.writeCheck(amount: 100)
        XCTAssertNil(check)
    }
}

BankingTests.defaultTestSuite.run()



// challenges
class Logger {
    static var shared = Logger()
    
    private init() {}
    
    func log() {
        print("Logging...")
    }
}

//let logger = Logger()
Logger.shared.log()
//Logger.log()


struct Stack<Element> {
    private var elements: [Element] = []
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        if !elements.isEmpty {
            return elements.last
        }
        return nil
    }
    
    mutating func push(_ newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func pop() -> Element? {
        if !elements.isEmpty {
            let lastElement = elements.removeLast()
            return lastElement
        }
        return nil
    }
}

var stack = Stack<String>()
stack.push("heh")
let last = stack.peek()
stack.push("eheheheh")
stack.push("booya")
if let dropped = stack.pop() {
    print(dropped)
}
