import UIKit
import Combine

guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
    fatalError("invalid URL")
}

let publisher = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .decode(type: [Int].self, decoder: JSONDecoder())
    .sink(receiveCompletion: { _ in} , receiveValue: {
        print($0)
    })
