//: [Previous](@previous)

import UIKit
import PlaygroundSupport
import TinyConstraints

let viewController = UIViewController()
viewController.view.backgroundColor = TinyTheme.backgroundColor

let firstView = UIView()
firstView.backgroundColor = TinyTheme.otherViewColor

let secondView = UIView()
secondView.backgroundColor = TinyTheme.constraintViewColor

viewController.view.addSubview(firstView)
viewController.view.addSubview(secondView)

firstView.size(CGSize(width: 50, height: 100))

secondView.size(CGSize(width: 50, height: 100))
secondView.leftToRight(of: firstView, offset: 10)

PlaygroundPage.current.liveView = viewController

//: [Next](@next)
