import UIKit


struct PizzaOrder {
    let typeOfPizza: String
    let size: Double
    let topping: String
}

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea: CustomStringConvertible {
    let center: Location
    var radius: Double
    var description: String {
            """
            Area with center: (x: \(center.x), y: \(center.y)),
            radius: \(radius)
            """
    }
    
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter =
        distance(from: center, to: location)
        
        return distanceFromCenter < radius
    }
    
    func overlaps(_ with: DeliveryArea) -> Bool {
        let distanceFromCenter =
        distance(from: center, to: with.center)
        
        return distanceFromCenter < radius || distanceFromCenter < with.radius
    }
}

let storeLocation = Location(x: 3, y: 3)
var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

func distance(from source: Location, to target: Location) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX*distanceX + distanceY*distanceY).squareRoot()
}

func isInDeliveryRange(location: Location) -> Bool {
    let deliveryDistance = distance(from: location, to: storeArea.center)
    
    return deliveryDistance < storeArea.radius
}
isInDeliveryRange(location: Location(x: 5, y: 5))


let area = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
let customerLocation = Location(x: 7, y: 7)
area.contains(customerLocation)
area.overlaps(storeArea)

print(area)


// challenges
struct InventoryContainer: CustomStringConvertible {
    var appleCount: Int
    var pearCount: Int
    var orangeCount: Int
    var totalAmountOfFruits: Int
    var description: String {
        """
        Inventory currently contains:
          - apples: \(appleCount)
          - pears: \(pearCount)
          - orange: \(orangeCount)
        
        The total amount of fruits is \(totalAmountOfFruits)
        """
    }
    
    mutating func sortFruits(_ truck: [String]) {
        for fruit in truck  {
            switch fruit {
            case "apple":
                appleCount += 1
            case "pear":
                pearCount += 1
            case "orange":
                orangeCount += 1
            default:
                break
            }
            totalAmountOfFruits += 1
        }
    }
}

let truck =
    ["apple", "apple", "apple", "orange", "orange", "pear"]
var inventory = InventoryContainer(appleCount: 0, pearCount: 0, orangeCount: 0, totalAmountOfFruits: 0)
inventory.sortFruits(truck)
print(inventory)


struct TShirt {
    let size: String
    let color: String
    let material: String
    
    func calculatePrice() -> Double {
        var price = 0.0
        
        switch size {
        case "XS", "S":
            price += 10.0
        case "M":
            price += 12.0
        case "L", "XL":
            price += 15.0
        default:
            break
        }
        
        if material == "silk" {
            price += 20.0
        } else {
            price += 10.0
        }
        
        if color == "rainbow" {
            price += 2.0
        }
        
        return price
    }
}

let tshirt1 = TShirt(size: "M", color: "black", material: "silk")
let tshirt2 = TShirt(size: "XL", color: "rainbow", material: "leather")

print(tshirt1.calculatePrice())
print(tshirt2.calculatePrice())
