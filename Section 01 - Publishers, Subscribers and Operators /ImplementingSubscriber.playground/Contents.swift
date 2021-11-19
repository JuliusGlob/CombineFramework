import UIKit
import Combine

class StringSubscriber: Subscriber {
    
    /// setup the data you will be working with
    typealias Input = String
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        print("Received Subscription")
        /// Setup how many items the publisher will give the subscriptor
        subscription.request(.max(3)) //backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
        /// here we confirm that we will use the ammount of requests we setup on the first method
        /// setup to .unlimited to receive all values
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
   
    
}

let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher

let subscriber = StringSubscriber()

publisher.subscribe(subscriber) /// we will receive as many strings as we setup on the StringSubscriber
