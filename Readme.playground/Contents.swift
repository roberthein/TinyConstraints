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
constraintView.backgroundColor = .red
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

PlaygroundPage.current.liveView = viewController

//: Edges
//: Attaching a view to its superview with NSLayoutConstraint:

//: with TinyConstraints:

//: Center
//: Constraining the center of a view to its superview with NSLayoutConstraint:

//: with TinyConstraints:




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
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 203, height: 203))
        let imageView = UIImageView(image: UIImage(named: "height&width.png")!)

        let label = UILabel(frame: CGRect(x: 0, y: 90, width: 200, height: 20))
        label.textColor = .white
        label.textAlignment = .center
        label.text = "\(constant)"

        view.addSubview(imageView)
        imageView.addSubview(label)

        if firstAttribute == .height {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1.5))
        }

        return view
    }
}
