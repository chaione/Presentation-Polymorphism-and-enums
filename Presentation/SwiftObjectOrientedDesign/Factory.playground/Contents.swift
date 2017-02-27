import UIKit

protocol Post {
    var name: String { get set }
    func performSearch()
}

struct Sierra1: Post {
    var name = "SIERRA1"
    func performSearch() {
        print("Searching at Sierra 1")
    }
}

struct SallyPort: Post {
    var name = "SALLYPORT"
    func performSearch() {
        print("Searching at Sally Port")
    }
}

struct PostFactory {
    func getPostFrom(postName: String) -> Post {
        switch postName.uppercased() {
        case "SIERRA1":
            return Sierra1()
        case "SALLYPORT":
            return SallyPort()
        default:
            return Sierra1()
        }
        
        
    }
}

var factory = PostFactory()

let nextPost:Post = factory.getPostFrom(postName: "SallyPort")
nextPost.performSearch()
