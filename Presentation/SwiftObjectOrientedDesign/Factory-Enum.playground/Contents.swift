import UIKit

enum Post:String {
    case sierra1 = "Sierra1"
    case sallyPort = "SallyPort"

    func performSearch() {
        switch self {
        case .sierra1:
            print("Searching at Sierra 1")
        case .sallyPort:
            print("Searching at Sally Port")
        }
    }
    
    
    static func getPostFrom(name: String) -> Post? {
        let lowercaseName = name.lowercased()
        switch lowercaseName {
        case sierra1.rawValue.lowercased():
            return sierra1
        case sallyPort.rawValue.lowercased():
            return sallyPort
        default:
            return nil
        }
    }
    
}


let currentPost:Post? = Post.getPostFrom(name: "Sierra1")
currentPost?.performSearch()
