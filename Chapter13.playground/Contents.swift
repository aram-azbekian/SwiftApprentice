import UIKit

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")

//class SimplePerson {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}

struct SimplePerson {
    let name: String
}

var var1 = SimplePerson(name: "John")
var var2 = var1

var homeowner = john
john.firstName = "John"
john.firstName
homeowner.firstName

homeowner.lastName = "Johnson"
homeowner.fullName
john.fullName

let imposterJohn = Person(firstName: "John",
                          lastName: "Appleseed")

john === homeowner
john === imposterJohn
homeowner === imposterJohn

homeowner = imposterJohn
john === homeowner

homeowner = john
john === homeowner

var imposters = (0..<100).map { _ in
    Person(firstName: "John", lastName: "Johnson")
}
imposters.contains {
    $0.firstName == john.firstName && $0.lastName == john.lastName
}

imposters.contains {
    $0 === john
}

imposters.insert(john, at: Int.random(in: 0..<100))
imposters.contains {
    $0 === john
}

if let indexOfJohn = imposters.firstIndex(where: {
    $0 === john
}) {
    imposters[indexOfJohn].lastName = "Bananapeel"
}
john.lastName

func memberOf(person: Person, group: [Person]) -> Bool {
    group.contains {
        $0 === person
    }
}
memberOf(person: john, group: imposters)
memberOf(person: imposterJohn, group: imposters)

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    var GPA: Double {
        var sumOfPoints = 0.0
        var sumOfCredits = 0.0
        grades.map {
            sumOfPoints += $0.points
            sumOfCredits += $0.credits
        }
        
        return sumOfPoints / sumOfCredits
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
let math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)

jane.GPA


extension Student {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
jane.fullName
