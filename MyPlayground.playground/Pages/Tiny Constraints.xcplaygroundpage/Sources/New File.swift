import UIKit

extension NSLayoutConstraint: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
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
