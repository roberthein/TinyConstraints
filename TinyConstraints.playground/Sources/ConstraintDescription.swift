import UIKit

extension NSLayoutConstraint: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {

        guard secondItem != nil else {
            return onlyOneAttributeView
        }

        if let firstView = firstItem as? UIView, let secondView = secondItem as? UIView, secondView == firstView.superview {
            return toSuperView
        }

        let superView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        superView.backgroundColor = .red


        return "lalala"
    }

    var onlyOneAttributeView: UIView {
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

    var toSuperView: UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 203, height: 203))
        let imageView = UIImageView(image: UIImage(named: "toSuperview.png")!)

        let label = UILabel(frame: CGRect(x: 0, y: 90, width: 200, height: 20))
        label.textColor = .white
        label.textAlignment = .center
        label.text = "\(constant)"

        view.addSubview(imageView)
        imageView.addSubview(label)

        print(firstAttribute.rawValue)

        if firstAttribute == .top {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.5))
        } else if firstAttribute == .bottom {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1.5))
        } else if firstAttribute == .trailing {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 1.0))
        }

        return view
    }
}
