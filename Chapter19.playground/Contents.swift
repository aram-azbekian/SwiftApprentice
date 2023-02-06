import UIKit

//infix operator **
//
//func **(base: Int, power: Int) -> Int {
//    precondition(power >= 2)
//    var result = base
//    for _ in 2...power {
//        result *= base
//    }
//    return result
//}
//
//let base = 2
//let exponent = 2
//base ** exponent
//
//infix operator **=
//
//func **=(lhs: inout Int, rhs: Int) {
//    lhs = lhs ** rhs
//}
//
//var number = 2
//number **= exponent

// MARK: - mini-excercises

//infix operator **
//
//func **(string: String, times: Int) -> String {
//    precondition(times >= 2)
//    var result = string
//    for _ in 2...times {
//        result += string
//    }
//    return result
//}
//
//let str1 = "abc"
//var str2 = str1 ** 5
//
//infix operator **=
//
//func **=(lhs: inout String, rhs: Int) {
//    lhs = lhs ** rhs
//}
//
//var test_str = "dacr"
//test_str **= 5

infix operator **

func **<T: BinaryInteger>(base: T, power: Int) -> T {
    precondition(power >= 2)
    var result = base
    for _ in 2...power {
        result *= base
    }
    return result
}

infix operator **=

func **=<T: BinaryInteger>(lhs: inout T, rhs: Int) {
    lhs = lhs ** rhs
}

// skipped the rest of the chapter
