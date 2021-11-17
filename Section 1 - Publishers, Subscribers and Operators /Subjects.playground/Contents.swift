import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
    typealias Input = String
    
    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completion")
    }
}

// Subjects - they are also publishers so you can subscribe to them.
    // - Publisher
    // - Subscribers

let subscriber = StringSubscriber()

let subject = PassthroughSubject<String, MyError>()

subject.subscribe(subscriber)

let subscription = subject.sink { (completion) in
    print("Received Completion from sink")
} receiveValue: { value in
    print("Received Value from sink")
}

///this will send a value to the subscriber
subject.send("A")
subscription.cancel() /// here we cancel the subscription so the subscritption to the subject will stop printing
subject.send("B")
subject.send("C") /// this wont print as we have reached the max ammount of items the subscriber will take



