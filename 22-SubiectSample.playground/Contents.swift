import UIKit
import Combine
import Foundation

public func example(of description: String, action: () -> Void) {
    print("\n example of: ", description, "---")
    action()
}


example(of: "PassthroughSubject") {
  // 1
  enum MyError: Error {
    case test
  }

  // 2
  final class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError

    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }

    func receive(_ input: String) -> Subscribers.Demand {
      print("Received value", input)
      // 3
      return input == "World" ? .max(1) : .none
    }

    func receive(completion: Subscribers.Completion<MyError>) {
      print("Received completion", completion)
    }
  }

  // 4
  let subscriber = StringSubscriber()

    // 5
    let subject = PassthroughSubject<String, MyError>()

    // 6
    subject.subscribe(subscriber)

    // 7
    let subscription = subject
      .sink(
        receiveCompletion: { completion in
          print("Received completion (sink)", completion)
        },
        receiveValue: { value in
          print("Received value (sink)", value)
        }
      )

    subject.send("ahihi")


    subscription.cancel()

    subject.send("xin chao")
//    subject.send(completion: .finished)
    subject.send("gui 1 event khac")
    subject.send(completion: .failure(.test))
    subject.send("ket thuc")
}
