import UIKit
import Combine

let publisher = PassthroughSubject<Int, Never>().eraseToAnyPublisher()
// This is done to hide the type of publisher you are using so whoever is using it will
// not know this is a PassthroughSubject it also loses the functionalities of a
// Passthrough subject // this is a Swift feature. Boxes the concrete type behind another type.


