import UIKit
import Combine

//MARK: - RunLoop
func runLoop() {
    ///this means the timer for the loop is on the main thread
    let runloop = RunLoop.main
    /// schedule overload items
    /// after: when will the schedule start runing
    /// interval: how often will it repeat
    /// tolerance: if the timer is late, then dont worry about it --- this can also impact on the performance of the app
    /// option: ?
    /// finally perform the closure to execute
    let subscription = runloop.schedule(after: runloop.now, interval: .seconds(2), tolerance: .milliseconds(100)) {
        print("Timer fired")
    }
    
    /// if we want to cancel the schedule after a certain time then we perform an schedule to cancel the subscription
    runloop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
        subscription.cancel()
    }
}
//runLoop()

//MARK: - Timer Class

/// set on the timer, the frequency, the thread on which it will perform its operations and the in: part is for diferent types of values we may work with
let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect() /// the timer needs to be connected to the subscriptor in order to start counting
    .scan(0) { counter, _ in /// by using scan we turned the input of type date into a type int that can be incremented
        counter + 1
    }
    .sink { /// here the event posted will be an int thanks to the scan
        print($0)
    }
    .cancel() // comment this cancel out to test this code


//MARK: - DispatchQueue

let queue = DispatchQueue.main
let source = PassthroughSubject<Int,Never>()
var counter = 0

let cancellable = queue.schedule(after: queue.now, interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}
let subscription2 = source.sink {
    print($0)
}
