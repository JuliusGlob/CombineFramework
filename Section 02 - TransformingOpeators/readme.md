## Transforming operators
You can think of them as something that takes one or several input streams to return a new stream.

Some useful operators are: 
- .collect() - makes it easy to collect all received elements and emit a single array contaning all of them. Note this is a greedy operator, the publisher must emit a completion: .finished in order to finish operating.
- .map - this operator allows us to transform all elements from a publisher in a closure.
- .mapkeypath - when using .map you can acces an object's attributes by doing /map(\.x) where x is an attribute corresponding to the object being mapped.
- .flatmap() - this operator allows us to tranform a given publisher into another one. 
- .replaceNil() - self explanatory allows us to replace nil values with something we can use, we can then map and force unwrap to obtain for example an array with no nil values. "Note no kittens will die with this force unwrapping"
- .replaceEmpty(with:) - This is used to replace (or instert) a value if a publisher completes without emiting a value
- .scan - exposes the currently emitted value, along with the latest one in a closure, we can use this to accumulate results.

