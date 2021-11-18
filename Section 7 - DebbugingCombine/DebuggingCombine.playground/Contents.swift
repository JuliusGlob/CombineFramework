import UIKit
import Combine

//MARK: - Printing Events
func printingEvents() {
    let publisher = (1...20).publisher
    publisher
        .print("Debugging") ///the .print operator will display actions being done by the publisher
        .sink {
            print($0)
        }
}
//printingEvents()

//MARK: - Acting on events - performing side effects

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}
let request = URLSession.shared.dataTaskPublisher(for: url)

/// The basic idea is with handleEvents you will be able to see how the publisher is handling the events on every scernario.
let subscription =
    request.handleEvents(receiveSubscription: { _ in print("Subscription received") },
                         receiveOutput: {_, _ in print("Received output")},
                         receiveCompletion: {_ in print("Received Completion")},
                         receiveCancel: {print("Received Cancel")},
                         receiveRequest: {_ in print("Receive Request")})
    .sink(receiveCompletion: { print($0) }) { data, _ in
        print(data)
    }


