import UIKit
import Combine

struct Post: Decodable {
    let title: String
    let body: String
}

func getPosts() -> AnyPublisher<[Post], Error> {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        fatalError("invalid URL")
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        /// by mapping it we decide what attributes we want to work with
        .map { $0.data }
        /// setup what is being decoded and with what
        .decode(type: [Post].self, decoder: JSONDecoder())
        /// we do erase... to ensure this is not tied up to any type of publisher so any publisher can use it
        .eraseToAnyPublisher()
}
///we are now able to sink the getposts as anypublisher
/// receiveCompletion handle any kind of errors
/// receiveValue is where we will obtain Data
// - IMPORTANT NOTE -
// If when we are receiving a Publisher we ignore it
// it will not be stored in memory, hence why you want to asign it to a constant
let cancellable = getPosts().sink(receiveCompletion: { _ in }, receiveValue: { print($0) })

