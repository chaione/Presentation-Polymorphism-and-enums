import Cocoa

var Operations = ["Start"]

public class Delivery {
    var status = "readyToBeSearched"
}

func vehicleArrivedAt(post:String, delivery: Delivery) {
    delivery.status = "readyToBeSearched"
    
    if post == "Sierra_1" {
        Operations.append("Notify SAS of new vehicle at \(post)")
        Operations.append("Notify Delta 10 of new vehicle at \(post)")
    }
    
    if post == "SallyPort" {
        Operations.append("Notify SAS of new vehicle at \(post)")
        Operations.append("Notify Delta 5 of new vehicle at \(post)")
    }

}

func PerformNextTaskAt(post: String, officer: String, delivery: Delivery) {
    if post == "Sierra_1" {
        if officer == "SAS" {
            if delivery.status == "readyToBeSearched" {
                Operations.append("\(officer) searching at \(post)")
                PerformNextTaskAt(post: post, officer: "Delta 10", delivery: delivery)
            } else {
                Operations.append("\(officer) releasing vehicle at \(post)")
            }
        }
        
        if officer == "Delta 10" {
            if delivery.status == "readyToBeSearched" {
                Operations.append("\(officer) covering vehicle at \(post)")
            }
        }
    }
    
    if post == "SallyPort" {
        if officer == "SAS" {
            if delivery.status == "readyToBeSearched" {
                Operations.append("\(officer) searching at \(post)")
                PerformNextTaskAt(post: post, officer: "Delta 5", delivery: delivery)
            } else {
                Operations.append("\(officer) releasing at \(post)")
            }
        }
        
        if officer == "Delta 5" {
            if delivery.status == "readyToBeSearched" {
                Operations.append("\(officer) covering vehicle at \(post)")
            }
        }
    }
}

func CompleteCurrentTaskAt(post: String, officer: String, delivery: Delivery) {
    if post == "Sierra_1" {
        if officer == "SAS" {
            if delivery.status == "readyToBeSearched" {
                delivery.status == "Searched"
                Operations.append("\(officer) finished searching vehicle at \(post)")
                CompleteCurrentTaskAt(post: post, officer: "Delta 10", delivery: delivery)
            }
        }
        
        if officer == "Delta 10" {
            Operations.append("\(officer) stopped covering vehicle at \(post)")
        }
    }
    
    if post == "SallyPort" {
        if officer == "SAS" {
            if delivery.status == "readyToBeSearched" {
                delivery.status == "Searched"
                Operations.append("\(officer) finished searching vehicle at \(post)")
                CompleteCurrentTaskAt(post: post, officer: "Delta 5", delivery: delivery)
            }
        }
        
        if officer == "Delta 5" {
            Operations.append("\(officer) stopped covering vehicle at \(post)")
        }
    }
}

var delivery = Delivery()

vehicleArrivedAt(post: "Sierra_1", delivery: delivery)
PerformNextTaskAt(post: "Sierra_1", officer: "SAS", delivery: delivery)
CompleteCurrentTaskAt(post: "Sierra_1", officer: "SAS", delivery: delivery)

vehicleArrivedAt(post: "SallyPort", delivery: delivery)
PerformNextTaskAt(post: "SallyPort", officer: "SAS", delivery: delivery)
CompleteCurrentTaskAt(post: "SallyPort", officer: "SAS", delivery: delivery)





Operations

