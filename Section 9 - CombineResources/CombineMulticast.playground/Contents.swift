import UIKit
import Combine

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("invalid url")
}

let subject = PassthroughSubject<Data,URLError>()

/// the multicast operator allows us to reuse the data received
let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().multicast(subject: subject)

let subscription1 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("subscription 1")
    print($0)
})

let subscription2 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("subscription 2")
    print($0)
})


let subscription3 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("subscription 3")
    print($0)
})


/// it is necesary to connect the diferent requests and pass them through a subject
request.connect()
subject.send(Data())
