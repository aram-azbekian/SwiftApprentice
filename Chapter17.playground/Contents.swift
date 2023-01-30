import UIKit

enum PetKind {
    case cat
    case dog
}

struct KeeperKind {
    var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)

/*
class Cat {}
class Dog {}

class Keeper<Animal> {}

var aCatKeeper = Keeper<Cat>()
//var temp = Keeper() -> doesn't compile
*/

class Cat {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Keeper<Animal: Pet> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal
    
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

let jason = Keeper(name: "Jason",
                   morningCare: Cat(name: "Whiskers"),
                   afternoonCare: Cat(name: "Sleepy"))

let jill = Keeper(name: "Jill",
                  morningCare: Dog(name: "Jack"),
                  afternoonCare: Dog(name: "Balloon"))

//let temp = Keeper(name: "Aaa",
//                  morningCare: String("yes"),
//                  afternoonCare: String("no"))
// will not work because later we conform Animal to a Pet Protocol


protocol Pet {
    var name: String { get }
}

extension Cat: Pet { }
extension Dog: Pet { }


extension Array where Element: Cat {
    func meow() {
        forEach { print("\($0.name) says meow!") }
    }
}

protocol Meowable {
    func meow()
}

extension Cat: Meowable {
    func meow() {
        print("\(self.name) says meow!")
    }
}

extension Array: Meowable where Element: Meowable {
    func meow() {
        forEach { $0.meow() }
    }
}



let animalAges: [Int] = [2, 5, 7, 9]
// identical to
let animalAges2: Array<Int> = [2, 5, 7, 9]


enum OptionalDate {
    case none
    case some(Date)
}

enum OptionalString {
    case none
    case some(String)
}

// ==>

enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}


func swapped<T, U>(_ x: T, _ y: U) -> (U, T) {
    (y, x)
}
swapped(33, "Jay")


class NewKeeper<Animal: Pet> {
    var name: String
    
    private var pets: Array<Animal> = []
    
    var animalsCount: Int {
        pets.count
    }
    
    init(name: String) {
        self.name = name
    }
    
    func lookAfter(_ pet: Animal) {
        self.pets.append(pet)
    }
    
    func animalAtIndex(_ idx: Int) -> Animal? {
        if idx < pets.count {
            return pets[idx]
        }
        return nil
    }
}

let cat1 = Cat(name: "Whiskers")
let cat2 = Cat(name: "Sleepy")
let cat3 = Cat(name: "Tom")

let keeper: NewKeeper<Cat> = NewKeeper(name: "Christine")
keeper.lookAfter(cat1)
keeper.animalsCount

keeper.lookAfter(cat2)
keeper.lookAfter(cat3)
keeper.animalsCount

if let animal = keeper.animalAtIndex(2) {
    print(animal.name)
}

let optionalCat = keeper.animalAtIndex(10)
print(type(of: optionalCat))
