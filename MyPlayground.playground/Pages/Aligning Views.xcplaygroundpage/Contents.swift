//: [Previous](@previous)

import UIKit
import PlaygroundSupport
import TinyConstraints

//:# Aligning Views
//: First we set up our ViewController and the UIViews that we want to add the constraints to.

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

//: Now we can align the left side of the secondView to the right size of the firstView like this:

secondView.bottomToTop(of: firstView, offset: 10)

PlaygroundPage.current.liveView = viewController
