import UIKit

let parsedInt = Int("dog")

let myFavoriteSong: String? = nil
if let myFavoriteSong = myFavoriteSong {
    print(myFavoriteSong)
} else {
    print("I do not have a favorite song")
}

let number: Int??? = 10
print(number!!!)

if let number = number {
    if let number = number {
        if let number = number {
            print(number)
        }
    }
}

func printNumber(_ number: Int???) {
    guard let number = number else { return }
    guard let number = number else { return }
    guard let number = number else { return }
    
    print(number)
}
printNumber(number)
