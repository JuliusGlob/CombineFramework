## Publisher: 
 A publisher delivers elements to one or more Subscriber instances. This publisher will have an Output and Failure type declared
Extensions on pusblisher define a wide variety of operators that you can compose to create sophisticated event-processing chains. 

Rather than implementing the publisher protocol yourself you can create a publisher by using the following methods: 
- Use PassthroughSubject to publish values on demand with .send()
- Use a CurrentValueSubject to publish whenever you update the subject's underlying value
- Add the @Published decorator so the property gains a publisher that emits an event whenever the property's value changes.

## Subscriptions:
Subscriptions are class constrained because a Subscription has identity, defined by the moment in time a particular subscriber attached to a publisher. Canceling a Subscription must be thread-safe.

You can only cancel a Subscription once.

Canceling a subscription frees up any resources previously allocated by attaching the Subscriber.

More Details to understand Combine Publishers and Subscriptors on Combine: https://www.donnywals.com/understanding-combines-publishers-and-subscribers/

## Subject:
A publisher that exposes a method for outside callers to publish elements.
It can be used to "inject" values into a stream this can be useful for adapting imperative code to the Combine model.


## Type Eraser
It is a way to hide an object's real type An example of where this is useful would be implementing the generic types available AnyCancellable and AnyPublisher. This allows us to implement the .eraseToAnyPublisher() operator, which will allow us to adjust the implementation as needed so callers of that publisher wont need to care about what publisher is used under the hood.
This topic goes on and on: https://www.donnywals.com/understanding-type-erasure-in-swift/
