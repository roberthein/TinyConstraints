//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import TinyConstraints

var str = "Hello, playground"

//: Create your viewController
let viewController = UIViewController()

let constraintView = UIView()
constraintView.backgroundColor = .red

viewController.view.addSubview(constraintView)

constraintView.centerX(to: viewController.view)
constraintView.height(200)
constraintView.width(200)

PlaygroundPage.current.liveView = viewController

extension NSLayoutConstraint: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        let test = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        test.backgroundColor = .red

        return test
    }
}

