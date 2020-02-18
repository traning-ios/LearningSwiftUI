import UIKit
import Combine
import Foundation

var subscriptions = Set<AnyCancellable>()

public func example(of description: String, action: () -> Void) {
    print("\n example of: ", description, "---")
    action()
}

/*
example(of: "Publisher", action: {
    let myNotification = Notification.Name("MyNotification")
//    let publisher = NotificationCenter.default
//        .publisher(for: myNotification, object: nil)

    // 3
    let center = NotificationCenter.default

    // 4
    let observer = center.addObserver(
      forName: myNotification,
      object: nil,
      queue: nil) { notification in
        print("Notification received!")
    }

    // 5
    center.post(name: myNotification, object: nil)

    // 6
    center.removeObserver(observer)



})
*/

/*
example(of: "Just") {
  // 1
  let just = Just("Hello world!")

  // 2
  _ = just
    .sink(
      receiveCompletion: {
        print("Received completion", $0)
      },
      receiveValue: {
        print("Received value", $0)
    })

    _ = just
      .sink(
        receiveCompletion: {
          print("Received completion (another)", $0)
        },
        receiveValue: {
          print("Received value (another)", $0)
      })
}

*/


example(of: "assign(to:on:)") {
  // 1
  class SomeObject {
    var value: String = "" {
      didSet {
        print(value)
      }
    }

    var number: Int = 0 {
        didSet {
            print(number)
        }
    }
  }

  // 2
  let object = SomeObject()

  // 3
  let publisher = ["Hello", "world!"].publisher

  // 4
  _ = publisher
    .assign(to: \.value, on: object)
    //value just only type of string

}
