import UIKit
import Combine

// MARK: - Filter
/// same condition as the usual filter, it will iterate through an array and given a certain
/// condition it will exclude those for which the condition is false
func filterOperator() {
    let numbers = (1...20).publisher
    
    numbers.filter { $0 % 2 == 0 }
        .sink {
            print($0)
        }
}
//filterOperator()


// MARK: - Remove Duplicates
/// doesnt work as you would expect, since this is reactive programming you have a sequence of events,
/// this means, that a duplicate will be removed if the current event == last event
func removeDuplicateOperator() {
    let words = "apple apple apple fruit apple apple mango watermelon apple".components(separatedBy: " ").publisher
    
    words
        .removeDuplicates()
        .sink {
            print($0)
        }
}
//removeDuplicateOperator()


// MARK: - Compact Map
/// it is used to remove the nil from strings
func compactMapOperator() {
    ["a", "1.24", "b", "3.45", "6.7"].publisher
        .compactMap { Float($0) }
        .sink {
            print($0)
            
        }
}
//compactMapOperator()


// MARK: - ignoreOutput
func ignoreOutputOperator() {
    let numbers = (1...5000).publisher
    /// helps ignore the ourputs, computing time is considerably faster
    numbers.ignoreOutput().sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
}
//ignoreOutputOperator()


// MARK: - First
func firstOperator() {
    let numbers = (1...9).publisher
    ///returns the first operator where the condition is fullfiled
    numbers.first(where : {$0 % 2 == 0})
        .sink {
            print($0)
        }
}
//firstOperator()


// MARK: - Last
func lastOperator() {
    let numbers = (1...9).publisher
    numbers.last(where: { $0 % 2 == 0 })
        .sink {
            print($0)
        }
}
//lastOperator()


// MARK: - Drop First
func dropFistOperator() {
    ///could be used for pagination
    let numbers = (1...10).publisher
    /// setup the ammount of numbers that will be dropped
    numbers.dropFirst(5)
        .sink { print($0) }
}
//dropFistOperator()

// MARK: - Drop While
func dropWhileOperator() {
    let numbers = (1...10).publisher
    /// when the condition is satisfied it will take all values remaining until the end.
    numbers.drop(while: { $0 % 3 != 0 })
        .sink {
            print($0)
        }
}
//dropWhileOperator()


// MARK: - Drop Until Output
func dropUntilOutputOperator() {
    /// drop the values from a sequence until it gets an output from another publisher
    let taps = PassthroughSubject<Int, Never>()
    let isReady = PassthroughSubject<Void, Never>()
    taps.drop(untilOutputFrom: isReady)
        .sink {
            print($0)
        }
    (1...10).forEach{ n in
        taps.send(n)
        if n == 3 {
            isReady.send()
        }
    }
}
//dropUntilOutputOperator()



// MARK: - Prefix Operator
/// select first n items from an array
func prefixOperator() {
    let numbers = (1...10).publisher
    numbers.prefix(5).sink {
        print($0)
    }
    print("-------------------")
    numbers.prefix(while: { $0 < 3 }).sink {
        print($0)
    }
}
//prefixOperator()


/*
 
 Challenge: Filter all the things
 
 Create an example that publishes a collection of numbers from 1 through 100, and use filtering operators to:
 
 1. Skip the first 50 values emitted by the upstream publisher.
 2. Take the next 20 values after those first 50 values.
 3. Only take even numbers.
 
 Expected Output:
 52 54 56 58 60 62 64 66 68 70
 
 */

func Solution() {
    
    let numbers = (1...100).publisher
    numbers.dropFirst(50)
        .prefix(20)
        .filter { $0 % 2 == 0 }
        .sink {
        print($0)
    }
    
}
/// starting by droping first 50 numbers, then prefix to take the first 20 that will be available, then filter even numbers
//Solution()
