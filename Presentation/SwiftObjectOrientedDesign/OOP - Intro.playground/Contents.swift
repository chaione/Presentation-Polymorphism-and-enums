import UIKit

protocol Automobile {

    var wheels:Int {get set}

    func go() -> Int

}

class Car: Automobile {
    var wheels:Int = 4

    func go() -> Int {
        return 1
    }
}

class Bus: Automobile {
    var wheels:Int = 8

    func go() -> Int {
        return 2
    }
}

class Truck: Automobile {
    internal var wheels: Int = 8
    internal func go() -> Int {
        return 3
    }
    
}


// Test classes
let b = Bus()
b.go()

let traffic:[Automobile] = [Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus(), Car(), Bus()]







for auto in traffic {
    auto.go()
}


// Factory
class autoFactory {
    
    class func getAuto(auto: String) -> Automobile {
        switch auto {
        case "Bus":
            return Bus()
        case "Car":
            return Car()
        default:
            return Car()
        }
    }
}

let factoryTraffic:[Automobile] = [autoFactory.getAuto(auto: "Bus"),autoFactory.getAuto(auto: "Car"),autoFactory.getAuto(auto: "Bus"),autoFactory.getAuto(auto: "Car"),autoFactory.getAuto(auto: "Car"),autoFactory.getAuto(auto: "Bus"),autoFactory.getAuto(auto: "Bus"),autoFactory.getAuto(auto: "Car"),autoFactory.getAuto(auto: "Bus")]

for auto in factoryTraffic {
    auto.go()
}

