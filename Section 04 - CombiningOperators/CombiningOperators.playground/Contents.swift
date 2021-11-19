import UIKit
import Combine

// MARK: - Prepend
func prependOperator() {
    let numbers = (1...5).publisher
    let publisher2 = (500...510).publisher
    /// since it is reactive programing, the last value pepended will be the first to be shown.
    numbers.prepend(100,101)
        .prepend(-1,-2)
        .prepend([45, 67])
        .prepend(publisher2)
        .sink {
            print($0)
        }
}
//prependOperator()


// MARK: - Append
func appendOperator() {
    let numbers = (1...10).publisher
    ///since we are appending the last one appended will be the last one shown.
    numbers.append(11,12)
        .append(99,-1)
        .sink {
            print($0)
        }
    
}
//appendOperator()


// MARK: - Switch To Latest
func switchToLatestExplanation() {
    let publisher1 = PassthroughSubject<String,Never>()
    let publisher2 = PassthroughSubject<String,Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<String,Never>,Never>()
    /// here we setup the switchToLatest, this will allow us to change the publisher that will manage the events by sending
    /// publishers a new publisher
    publishers.switchToLatest().sink {
        print($0)
    }
    publishers.send(publisher1)
    
    publisher1.send("Publisher 1 - Value 1")
    publisher1.send("Publisher 1 - Value 2")
    
    publishers.send(publisher2) // switching to publisher 2
    publisher2.send("Publisher 2 - Value 1")
    
    publisher1.send("Publisher 1 - Value 3") // this wont print because we are still on publisher 2
}
//switchToLatestExplanation()

//example of a real use for switchTo latest(remove comments and run it)


/*
 let images = ["denver", "seattle", "newyork"]
 var index = 0
 
 func getImage() -> AnyPublisher<UIImage?, Never> {
 return Future<UIImage?,Never> { promise in
 
 DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
 promise(.success(UIImage(named: images[index])))
 }
 }.print().map { $0 }
 .receive(on: RunLoop.main)
 .eraseToAnyPublisher()
 }
 
 let taps = PassthroughSubject<Void,Never>()
 let subscription = taps.map {
 _ in getImage()
 }.switchToLatest().sink {
 print($0!)
 }
 // denver
 taps.send()
 
 // seattle
 DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
 index += 1
 taps.send()
 }
 ///here the promise couldnt be kept because of them .5 diference so it will not load the seattle image.
 ///newyork
 DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
 index += 1
 taps.send()
 }
 */

// MARK: - Merge
func mergeOperator() {
    ///to merge diferent  streams both must have the same type
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<Int, Never>()
    publisher1.merge(with: publisher2).sink {
        print($0)
    }
    publisher1.send(10)
    publisher1.send(11)
    
    publisher2.send(1)
    publisher2.send(2)
}
//mergeOperator()


// MARK: - Combine Latest
func combineLatestOperator() {
    /// view photo on resources(combineLatest) you will get a touple between the combined publishers
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<String, Never>()
    publisher1.combineLatest(publisher2)
        .sink {
            print("P1:\($0), P2:\($1)")
        }
    ///when sending values publisher1  will not show the event until  publisher2 has also received a value.
    publisher1.send(10)
    publisher1.send(9) /// on another note here, if other values are sent to p1 before p2 gets a value then the p1 value will be the last received
    publisher2.send("A")
    /// since publisher2 already has been sent a value then by sending another value to p1 will show the event even if p2 has not been updated again
    publisher1.send(8)
    publisher2.send("B")
}
//combineLatestOperator()


// MARK: - Zip
func zipOperator() {
    /// another image on resources for this
    /// note: this looks very useful
    /// it will wait for the pair necesary at the order it was sent.
    let publisher1 = PassthroughSubject<Int,Never>()
    let publisher2 = PassthroughSubject<String,Never>()
    publisher1.zip(publisher2).sink {
        print("P1: \($0), P2: \($1)")
    }
    publisher1.send(1)
    publisher1.send(2)
    publisher2.send("A")
    publisher1.send(3)
    publisher2.send("B")
}
//zipOperator()
