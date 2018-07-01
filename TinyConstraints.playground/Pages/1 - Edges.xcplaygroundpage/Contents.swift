import UIKit
import PlaygroundSupport
import TinyConstraints

//: Edges

//: First we set up our ViewController and the UIView that we want to add the constraints to.
let viewController = UIViewController()
viewController.view.backgroundColor = TinyTheme.backgroundColor

let containerView = UIView()
containerView.backgroundColor = TinyTheme.otherViewColor

viewController.view.addSubview(containerView)

containerView.height(100)
containerView.width(100)

let edgesView = UIView()
edgesView.backgroundColor = TinyTheme.constraintViewColor

containerView.addSubview(edgesView)

//: Attaching a view to its superview with NSLayoutConstraint:
//: `view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true`
//: `view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true`
//: `view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true`
//: `view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true`
//: with TinyConstraints:

//edgesView.edges(to: superview)
edgesView.edges(to: containerView, insets: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))

PlaygroundPage.current.liveView = viewController
