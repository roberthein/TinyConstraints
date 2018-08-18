import Foundation
import UIKit

class ArrowView: UIView {
    
    private lazy var arrow = Arrow(for: orientation)
    private let orientation: Orientation
    
    required init(color: UIColor?, orientation: Orientation) {
        self.orientation = orientation
        super.init(frame: .zero)
        
        backgroundColor = color
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(arrow)
        
        switch orientation {
        case .horizontal:
            let margin: CGFloat = 5
            arrow.leftToSuperview(offset: margin)
            arrow.rightToSuperview(offset: -margin)
            arrow.centerYToSuperview()
            arrow.height(arrow.size.height)
        case .vertical:
            let margin: CGFloat = 5
            arrow.topToSuperview(offset: margin)
            arrow.bottomToSuperview(offset: -margin)
            arrow.centerXToSuperview()
            arrow.width(arrow.size.width)
        case .diagonal:
            let margin: CGFloat = 12
            arrow.topToSuperview(offset: margin)
            arrow.leftToSuperview(offset: margin)
            arrow.bottomToSuperview(offset: -margin)
            arrow.rightToSuperview(offset: -margin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
