import UIKit
import Combine
import Foundation

//var subscriptions = Set<AnyCancellable>()

public func example(of description: String, action: () -> Void) {
    print("\n example of: ", description, "---")
    action()
}

var arrray = [1, 2, 3]

func showArray() {
    arrray.shuffle()
    print(arrray)
}

showArray()
/*
example(of: "Custom Subscriber") {
  // 1
    let publisher = ["A", "B", "C", "D"].publisher

  // 2
  final class IntSubscriber: Subscriber {
    // 3
    typealias Input = String
    typealias Failure = Never

    // 4
    func receive(subscription: Subscription) {
      subscription.request(.max(3))
    }

    // 5
    func receive(_ input: String) -> Subscribers.Demand {
      print("Received value", input)
      return .none
    }

    // 6
    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }

    let subscriber = IntSubscriber()

    publisher.subscribe(subscriber)
}

*/


//example(of: "Future") {
//  func futureIncrement(
//    integer: Int,
//    afterDelay delay: TimeInterval) -> Future<Int, Never> {
//
//  }
//}
