//: Playground - noun: a place where people can play

import UIKit

enum Automobile: String {
    case car
    case bus

    func go() -> Int {
        switch self {
        case .car:
            return 1
        case .bus:
            return 2
        }
    }
}

let traffic:[Automobile] = [Automobile(rawValue: "car")!, .car, .bus, .car, .bus, .car, .bus, .car]

for auto in traffic {
    auto.go()
}
