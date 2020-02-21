import UIKit
import Combine
import Foundation

public func example(of description: String, action: () -> Void) {
    print("\n example of: ", description, "---")
    action()
}

/*
example(of: "Dynamically adjusting demand") {
    final class IntSubsciber: Subscriber {
        typealias Input = Int
        typealias Failure = Never

        func receive(subscription: Subscription) {
            subscription.request(.max(2))
        }

        func receive(_ input: Int) -> Subscribers.Demand {
             print("receive value", input)
            switch input {
            case 1:
                return .max(2)
            case 3:
                return .max(1)
            default:
                return .none
            }
        }

        func receive(completion: Subscribers.Completion<Never>) {
            print("received completion ", completion)
        }
    }

    let subsciber = IntSubsciber()
    let subject = PassthroughSubject<Int, Never>()

    subject.subscribe(subsciber)

    subject.send(1)
    subject.send(2)
    subject.send(3)
    subject.send(4)
    subject.send(5)
    subject.send(6)
    subject.send(completion: .finished)
}
*/

var subscriptions = Set<AnyCancellable>()

example(of: "Type erasure") {
  // 1
  let subject = PassthroughSubject<Int, Never>()

  // 2
  let publisher = subject.eraseToAnyPublisher()

  // 3
  publisher
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)

  // 4
  subject.send(0)
}
