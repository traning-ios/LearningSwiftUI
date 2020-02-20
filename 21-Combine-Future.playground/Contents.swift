import UIKit
import Combine
import Foundation

var subscriptions = Set<AnyCancellable>()

public func example(of description: String, action: () -> Void) {
    print("\n example of: ", description, "---")
    action()
}


example(of: "Future") {
    func futureIncrement(
        integer: Int,
        afterDelay delay: TimeInterval
    ) -> Future<Int, Never> {
        Future<Int, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                promise(.success(integer + 1))
            }
        }
    }

    let future = futureIncrement(integer: 1, afterDelay: 1)
    future.sink(receiveCompletion: { (value) in
        print("value = \(value)")
    }) { (integer) in
        print("integer = \(integer)")
    }
    .store(in: &subscriptions)

    future
        .sink(receiveCompletion: { (completion) in
            print(completion)
        }) { (integer) in
            print(integer)
    }
    .store(in: &subscriptions)

}


