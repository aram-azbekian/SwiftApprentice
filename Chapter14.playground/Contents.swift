import UIKit

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is being removed from memory")
    }
}

/*
class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}
*/

class Student /* : Person */ {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []
    
    weak var partner: Student?
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    /*
    convenience init(student: Student) {
        self.init(firstName: student.firstName,
                  lastName: student.lastName)
    }
    */
    
    init(firstName: String, lastName: String, grades: [Grade]) {
        self.firstName = firstName
        self.lastName = lastName
        self.grades = grades
    }
    
    convenience init(student: Student) {
        self.init(firstName: student.firstName,
                  lastName: student.lastName,
                  grades: student.grades)
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    
    func addToGraduates() {
        graduates.append(Student(student: self))
    }
    
    deinit {
        addToGraduates()
        print("\(firstName) is being deallocated")
    }
}

var graduates: [Student] = []

let john = Person(firstName: "John", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")
john.firstName
jane.firstName

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

let oboePlayer = OboePlayer(firstName: "Jane",
                            lastName: "Appleseed")
var hallMonitor = Student(firstName: "Jill",
                          lastName: "Bananapeel")

oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime

hallMonitor = oboePlayer
hallMonitor.firstName

(hallMonitor as? BandMember)?.minimumPracticeTime

hallMonitor as! BandMember
(hallMonitor as! BandMember).minimumPracticeTime

/*
class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    
    override func recordGrade(_ grade: Grade) {
        super.recordGrade(grade)
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}
*/

class StudentAthlete: Student {
    var sports: [String]
    
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
}



var someone = Person(firstName: "Johnny", lastName: "Appleseed") // 1
var anotherSomeone: Person? = someone // + 1
var lotsOfPeople = [someone, someone, anotherSomeone, someone] // + 4
anotherSomeone = nil // - 1
lotsOfPeople = [] // -4
someone = Person(firstName: "Johnny", lastName: "Appleseed")
            // original one: -1; newly created object: +1


var alice: Student? = Student(firstName: "Alice",
                             lastName: "Appleseed")
var bob: Student? = Student(firstName: "Bob",
                            lastName: "Appleseed")
alice?.partner = bob
bob?.partner = alice
alice?.partner
bob?.partner

alice = nil
bob = nil



// challenges
class A {
    init() {
        print("I'm A!")
    }
    deinit {
        print("A is being deinitialized")
    }
}

class B: A {
    override init() {
        print("I'm B")
        super.init()
        print("I'm B")
    }
    deinit {
        print("B is being deinitialized")
    }
}

class C: B {
    override init() {
        print("I'm C")
        super.init()
        print("I'm C")
    }
    deinit {
        print("C is being deinitialized")
    }
}

let c = C()

do {
    let c = C()
}

let cAsA = C() as A


class StudentBaseballPlayer: StudentAthlete {
    var position: String
    var number: Int
    var battingAverage: Double
    
    required init(firstName: String, lastName: String) {
        position = "center"
        number = 12
        battingAverage = 1.2
        super.init(firstName: firstName, lastName: lastName)
        self.sports.append("Baseball")
    }
    
    convenience init(position: String,
                     number: Int,
                     battingAverage: Double,
                     athlete: StudentAthlete) {
        self.init(firstName: athlete.firstName,
                   lastName: athlete.lastName)
        self.sports = sports + ["Baseball"]
        self.position = position
        self.number = number
        self.battingAverage = battingAverage
    }
}
