import UIKit
import PlaygroundSupport
import TinyConstraints

//:# TinyConstraints
//: tl;dr Nothing but sugar.
//:
//: TinyConstraints is the syntactic sugar that makes Auto Layout sweeter for human use.

//: First we set up our ViewController and the UIView that we want to add the constraints to.
let viewController = UIViewController()
let constraintView = UIView()
let ding = TinyTheme.backgroundColor
viewController.view.backgroundColor = TinyTheme.backgroundColor
constraintView.backgroundColor = TinyTheme.constraintViewColor
//: Always remember to add the view as a subview before you add constraints, otherwise your app will crash 💥
viewController.view.addSubview(constraintView)

//: Size
//: Setting width and height with NSLayoutConstraint:
//:
//:`constraintView.heightAnchor.constraint(equalToConstant: 100).isActive = true`
//:
//:`constraintView.widthAnchor.constraint(equalToConstant: 100).isActive = true`

//: with TinyConstraints:

constraintView.height(100)
constraintView.width(100)

//: or even shorter, both at once:
constraintView.size(CGSize(width: 100, height: 100))

//: Center
//: Constraining the center of a view to its superview with NSLayoutConstraint:

//: with TinyConstraints:

//: [Edges](@next)

PlaygroundPage.current.liveView = viewController
