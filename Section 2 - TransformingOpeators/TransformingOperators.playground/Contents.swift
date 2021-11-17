import UIKit
import Combine

// MARK: - Collect
/// collect all values and give you an array of items
/// can be used  as collect (n) where n is how many items you want to group together
func collectOperator(_ itemsPerGroup: Int = 0) {
    /// if itemsPerGroup == 0 then  it works as .collect()
    ["A", "B", "C", "D", "E"].publisher.collect(itemsPerGroup).sink {
        print($0)
    }
}
//collectOperator(4)


// MARK: - Map
/// takes an array of items and transforms it into a diferent set of items
func mapOperator() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    [123, 45, 67].publisher.map {
        formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
    }.sink {
        print($0)
    }
}
//mapOperator()


// MARK: - MapKeypath
/// can be used to access diferent attributes from an object and will be able to work with the output as you would in a normal map operator
func mapKeypathOperator() {
    struct Point {
        let x: Int
        let y: Int
    }
    
    let publisher = PassthroughSubject<Point, Never>()
    
    publisher.map(\.x, \.y).sink { x, y in
        print("x is \(x) and y is \(y)")
    }
    publisher.send(Point(x: 2, y: 10))
}
//mapKeypathOperator()


// MARK: - FlatMap
/// can be used to flatten the multiple upstream publishers into a single downstream publisher
struct School {
    let name: String
    let noOfStudents: CurrentValueSubject<Int, Never>
    
    init(name: String, noOfStudents: Int) {
        self.name = name
        self.noOfStudents = CurrentValueSubject(noOfStudents)
    }
}

func flatMapOperator() {
    let citySchool = School(name: "Universidad Tecnologica Nacional", noOfStudents: 100)
    let school = CurrentValueSubject<School,Never>(citySchool)
    /// by adding flatMap we are able to receive notifications on the particular attribute that is being changed
    school.flatMap {
        $0.noOfStudents
    }
    .sink {
        print($0)
    }
    
    citySchool.noOfStudents.value = 105
}
//flatMapOperator()


// MARK: - ReplaceNil
/// self explanatory
func replaceNilOperator() {
    ///Take into consideration that if we use replaceNil then our values will be of optional type.
    
    ["A", "B", "C", "D", nil, "F"].publisher.replaceNil(with: "*")
        ///by using the map operator we can safely force unwrap the values, Because it's impossible to have nil values remaining
        .map { $0! }
        .sink {
            print($0)
        }
    
}
//replaceNilOperator()


// MARK: - replaceEmpty
func replaceEmptyOperator() {
    let empty = Empty<Int, Never>()
    /// we can use replaceEmpty to obtain a desired value in case of an Empty event
    empty
        .replaceEmpty(with: 1)
        .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })
}
//replaceEmptyOperator()


//MARK: - Scan

func scanOperator() {
    ///acts as an accumulator, collecting and modifying values and publishing intermediate results
    let publisher = (1...10).publisher
    
    publisher.scan([]) { numbers, value -> [Int] in
        /// just a reminder a single value with no return assumes a return is being used.
        numbers + [value]
        
    } .sink {
        print($0)
    }
}
