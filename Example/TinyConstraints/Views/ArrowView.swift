
import UIKit

class ArrowView: UIView {
    
    convenience init(color: UIColor?, orientation: Orientation) {
        self.init(frame: .zero)
        
        backgroundColor = color
        layer.cornerRadius = 20
        clipsToBounds = true
        
        let arrow = Arrow(for: orientation)
        addSubview(arrow)
        
        switch orientation {
        case .horizontal:
            let margin: CGFloat = 5
            arrow.left(to: self, offset: margin)
            arrow.right(to: self, offset: -margin)
            arrow.centerY(to: self)
            arrow.height(arrow.size.height)
        case .vertical:
            let margin: CGFloat = 5
            arrow.top(to: self, offset: margin)
            arrow.bottom(to: self, offset: -margin)
            arrow.centerX(to: self)
            arrow.width(arrow.size.width)
        case .diagonal:
            let margin: CGFloat = 12
            arrow.top(to: self, offset: margin)
            arrow.left(to: self, offset: margin)
            arrow.bottom(to: self, offset: -margin)
            arrow.right(to: self, offset: -margin)
        }
    }
}
