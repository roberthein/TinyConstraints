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
let attribute1 = ding.firstAttribute.rawValue
let object1 = ding.firstItem
let anchor1 = ding.firstAnchor
let attribute2 = ding.secondAttribute.rawValue
let object2 = ding.secondItem
let anchor2 = ding.secondAnchor


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
        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superView.backgroundColor = .red
        superView.layer.cornerRadius = 20



        return superView
    }
}

