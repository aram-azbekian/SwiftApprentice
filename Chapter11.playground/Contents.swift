import UIKit

struct LightBulb {
    static let maxCurrent = 40
    var isOn = false
    var current = 0 {
        willSet {
            if newValue > LightBulb.maxCurrent {
                print("""
                      Current is too high,
                      falling back to previous setting.
                      """)
                isOn = false
            }
        }
        didSet {
            if current > LightBulb.maxCurrent {
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.isOn = true
light.current = 50
light.current
light.isOn
light.current = 40
light.isOn = true
light.current
light.isOn
light.current = 60
light.current
light.isOn


struct Circle {
    var radius: Double
    var circumference: Double {
        Double.pi * radius * 2
    }
}
var circle = Circle(radius: 5.0)



// challenges

// start
struct IceCream {
    let name: String
    let ingredients: [String]
}

// parameters' default values
struct IceCream2 {
    let name = "chocolate"
    let ingredients = ["ing1", "ing2", "ing3"]
}
let ice = IceCream2()

struct IceCream3 {
    var name = "chocolate"
    lazy var ingredients: [String] = {
        var ingredients: [String] = []
        for i in 1...1000 {
            ingredients.append("ing" + String(i))
        }
        return ingredients
    }()
    
    init(_ name: String) {
        self.name = name
    }
}
var ice2 = IceCream3("banana")
print(ice2.ingredients.count)


struct FuelTank {
    var level: Double {
        willSet {
            if newValue < 0.1 {
                lowFuel = true
            } else {
                lowFuel = false
            }
        }
        didSet {
            if level < 0 {
                level = 0
            } else if level > 1 {
                level = 1
            }
        }
    }
    var lowFuel: Bool
}
var fuel = FuelTank(level: 0.5, lowFuel: false)
fuel.level
fuel.lowFuel
fuel.level = 0.02
fuel.level
fuel.lowFuel
fuel.level = 1.2
fuel.level
fuel.lowFuel
fuel.level = -10
fuel.level
fuel.lowFuel
