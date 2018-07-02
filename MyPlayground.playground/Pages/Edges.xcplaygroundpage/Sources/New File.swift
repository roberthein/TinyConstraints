import UIKit

extension NSLayoutConstraint: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
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
