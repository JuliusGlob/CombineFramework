import UIKit
import Combine

//MARK: - Min Max
func minMaxOperator() {
    let publisher = [1, -45, 3, 45, 100].publisher
    publisher.max() /// you can use min or max it will trigger an event with the highest or lowest value in the array
        .sink {
        print($0)
    }
}
//minMaxOperator()


//MARK: - First Last
func firstLastOperator() {
    let publisher = ["A", "B", "C", "D"].publisher
    /// you will obtain the first or last item of the sequence... you can add conditions so that the event shows the firs ocurrence of that condition in the sequence
    publisher.first(where: { "Cat".contains($0) })
        .sink {
        print($0)
    }
}
//firstLastOperator()


//MARK: - Output
func outputOperator() {
    let publisher = ["A", "B", "C", "D"].publisher
    ///prints value at index
    publisher.output(at: 2).sink {
        print($0)
    }
    /// prints values at index in range (x...y)
    publisher.output(in: (0...2)).sink {
        print($0)
    }
}
//outputOperator()


//MARK: - Count
func countOperator() {
    let publisher1 = [1, -45, 3, 45, 100].publisher
    let publisher2 = PassthroughSubject<Int,Never>()
    
    publisher1.count().sink {
        print($0)
    }
    ///publisher 2 will hold the counts until a completion is send
    publisher2.count().sink {
        print($0)
    }
    publisher2.send(100)
    publisher2.send(200)
    publisher2.send(completion: .finished)
    publisher2.send(100)
    publisher2.send(203)
    publisher2.send(200)
    /// when a completion is sent it will not take further values
    publisher2.send(completion: .finished)

}
//countOperator()


//MARK: - Contains
func containOperator() {
    let publisher = ["A", "B", "C", "D"].publisher
    /// contains, will return a bool, this can be used to concatenate conditions with other operators
    publisher.contains("C").sink {
        print($0)
    }
}
//containOperator()


//MARK: - All Satisfy
func allSatisfyOperator() {
    let publisher = [1,2,3,4,5,6,7].publisher
    /// all items in the sequence must satisfy the condition, it will return a bool
    publisher.allSatisfy { $0 % 2 == 0 }
        .sink {
            print($0)
        }
}
//allSatisfyOperator()


//MARK: - Reduce
func reduceOperator() {
    let publisher = [1,2,3,4,5,6,7].publisher
    /// reduce adds all the sequence together reducing them to one particular value
    /// first argument ( starting value ), second value contains an accumulator holding previews values and a value corresponding to next in sequence
    publisher.reduce(0) { accumulator, value in
        print("accumulator\(accumulator), value: \(value)")
        /// note, use a return since we are not doing a single liner
        return accumulator + value
    }.sink {
        print($0)
    }
    
}
//reduceOperator()



