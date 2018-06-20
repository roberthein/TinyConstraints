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

let ding = constraintView.height(200)

PlaygroundPage.current.liveView = viewController

extension Constraint: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {

        guard secondItem != nil else {
            return onlyOneAttributeView
        }

        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superView.backgroundColor = .red


        return "lalala"
    }

    var onlyOneAttributeView: Any {
        var superView = UIView()

        if firstAttribute == .height {

            let label = UILabel(frame: CGRect(x: -50, y: 90, width: constant, height: 20))
            label.textColor = .white
            label.textAlignment = .center
            superView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: constant))

            superView.addSubview(label)
            label.text = "<------\(constant)------>"
            label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1.5))
        }

        superView.backgroundColor = .red
        superView.layer.cornerRadius = 20

        return superView
    }
}


