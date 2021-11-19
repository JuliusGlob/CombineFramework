import UIKit
import Combine

var subscription3: AnyCancellable? = nil

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("invalid URL")
}
//MARK: - Share

/// if we just create multiple subscriptions to the publisher, then each of them will trigger a new datafetch
/// the solution to this is adding the .share() operator by doing this, the second subscription will use the request from the first subscription
let shareRequest = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().share()

let subscription1 = shareRequest.sink(receiveCompletion: { _ in }, receiveValue: {
    print("subscription 1")
    print($0)
})

let subscription2 = shareRequest.sink(receiveCompletion: { _ in }, receiveValue: {
    print("subscription 2")
    print($0)
})

/// if we subscribe after the publisher is done publishing we wont get data
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription3 = shareRequest.sink(receiveCompletion: { _ in }, receiveValue: {
        print("subscription 3")
        print($0)
    })
}
