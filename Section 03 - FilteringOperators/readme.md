## Filtering Operators
These operators will allow you to modify the outputs you will receive from sequences. 

- .filter  - Allows us to add a condition in a closure in which we will test the value to a certain condition to verify it will be part or not of the result.
- .removeDuplicates - This doesnt work as you would expect. This being reactive programming duplicates will be removed as long as new value == last value.
- .compactMap - This operator allows us to obtain only non nil values, particullary useful to for example turn items from an string array to Integers or Double
- .ignoreOutput - ignores all upstream events however it passes along a finished or failed completion state. it's useful if you dont care about values but you want to know if a publisher is finished
- .first/.last - This operator will find the first/last value that matches to a given criteria in a subscription, it works as you would expect, if you go for last it will iterate from the end of the list.
- .dropFirst/.dropLast - Allows us to disregard from the result the first/last n elements 
- .dropwhile - This operator diregards all elements until a condition is satisfied
- .drop(untilOutputFrom) - This publisher will begin to publish events once a criteria is met
- .prefix(untilOutputFrom) - This would be the oposite to .drop where we will stop receiving values once a criteria is met 

