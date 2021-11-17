import Foundation

// MARK: - Basic notification Setup
func basicNotificationSetup() {
    ///setup the name of the notification
    let notification = Notification.Name("MyNotification")
    ///setup the notification center
    let center = NotificationCenter.default
    ///setup the observer
    let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
        print("Notification received! for basic setup")
    }
    ///send notification
    center.post(name: notification, object: nil)
    ///if you no longer need the subscription then remove the observer (must keep this in mind for app's lifecycle)
    center.removeObserver(observer)
    
}
// MARK: - Sending Notofications Using Publisher and subscriber, use of Cancellable
func sendNotificationUsingPublisherAndSubscriber() {
    let notification = Notification.Name("MyNotificationTwo")
    /// create publisher to publish the notification.
    let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
    
    /// create a subscription for this publisher.
    let subscription = publisher.sink { _ in
        print("Notification received through publisher and subscriber")
    }
    /// create notificiation center and post notification -> Note that the post will be sent to the current subscriptors, so this has to go after subscription.
    NotificationCenter.default.post(name: notification, object: nil)
    /// cancel the subscription if you no longer need to listen to events.
    /// if the subscription is not canceled then it will automatically be canceled when it's out of scope.
    subscription.cancel()
    /// since we canceled the subscription next line wont run.
    NotificationCenter.default.post(name: notification, object: nil)
}

basicNotificationSetup()
sendNotificationUsingPublisherAndSubscriber()
