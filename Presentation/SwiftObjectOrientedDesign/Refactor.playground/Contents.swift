import Cocoa

var Operations = ["Start"]

public class Delivery {
    var status = "readyToBeSearched"
}

public protocol Post {
    func name() -> String
    func coveringOfficer() -> Officer
    func vehicleArrived (delivery: Delivery)
}

extension Post {
    func PhoneNumber() -> String{
        return ""
    }
}

public class Sierra1: Post {
    public func coveringOfficer() -> Officer {
        return Delta10()
    }

    public func vehicleArrived(delivery: Delivery) {
        Operations.append("Notify SAS of new vehicle at \(name())")
        Operations.append("Notify Delta 10 of new vehicle at \(name())")
        delivery.status = "readyToBeSearched"
    }

    public func name() -> String {
        return "Sierra_1"
    }
    
    func PhoneNumber() -> String {
        return "123-123-1234"
    }
}

public class SallyPort: Post {
    public func coveringOfficer() -> Officer {
        return Delta5()
    }

    public func vehicleArrived(delivery: Delivery) {
        Operations.append("Notify SAS of new vehicle at \(name())")
        Operations.append("Notify Delta 5 of new vehicle at \(name())")
        Operations.append("Notify Protected Area of new vehicle at \(name())")
        delivery.status = "readyToBeSearched"
    }

    public func name() -> String {
        return "SallyPort"
    }
}

public protocol Officer {
    func position() -> String
    func performTaskAtPost(post: Post, delivery: Delivery)
    func completeTaskAtPost(post: Post, delivery: Delivery)
}

public class Delta5: Officer{
    public func completeTaskAtPost(post: Post, delivery: Delivery) {
       Operations.append("\(position()) stopped covering vehicle at \(post.name)")
    }

    public func performTaskAtPost(post: Post, delivery: Delivery) {
        if delivery.status == "readyToBeSearched" {
            Operations.append("\(position()) Alerting Protected Area vehicle at \(post.name())")
            Operations.append("\(position()) covering vehicle at \(post.name())")
        }
    }

    public func position() -> String {
        return "Delta 5"
    }
}

public class Delta10: Officer {
    public func completeTaskAtPost(post: Post, delivery: Delivery) {
        Operations.append("\(position()) stopped covering vehicle at \(post.name)")
    }

    public func performTaskAtPost(post: Post, delivery: Delivery) {
        if delivery.status == "readyToBeSearched" {
            Operations.append("\(position()) covering vehicle at \(post.name())")
        }
    }

    public func position() -> String {
        return "Delta 10"
    }
}

public class SAS: Officer {
    
    public func position() -> String {
        return "SAS"
    }

    public func performTaskAtPost(post: Post, delivery: Delivery) {
        if delivery.status == "readyToBeSearched" {
            Operations.append("\(position()) searching at \(post)")
            post.coveringOfficer().performTaskAtPost(post: post, delivery: delivery)
        } else {
            Operations.append("\(position()) releasing vehicle at \(post)")
        }
    }

    public func completeTaskAtPost(post: Post, delivery: Delivery) {
        if delivery.status == "readyToBeSearched" {
            delivery.status == "Searched"
            Operations.append("\(position()) finished searching vehicle at \(post.name())")
            post.coveringOfficer().completeTaskAtPost(post: post, delivery: delivery)
        }
    }
    
    
}


var delivery = Delivery()
var sas = SAS()
var post = Sierra1()
post.vehicleArrived(delivery: delivery)
sas.performTaskAtPost(post: Sierra1(), delivery: delivery)
sas.completeTaskAtPost(post: Sierra1(), delivery: delivery)

var post2 = SallyPort()
post2.vehicleArrived(delivery: delivery)
sas.performTaskAtPost(post: SallyPort(), delivery: delivery)
sas.completeTaskAtPost(post: SallyPort(), delivery: delivery)



Operations




