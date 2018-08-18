import Foundation
import UIKit
import TinyConstraints

class Advanced: UIView {
    
    private var lastBottomConstraint: Constraint?
    private var lastSubview: UIView?
    private let margin: CGFloat = 20
    private var counter = 0
    private var heights: Constraints = []
    
    private lazy var container = Container()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
        
        container.width(310)
        container.height(min: 310)
        container.height(310, priority: .defaultLow)
        container.center(in: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func appendSubview() {
        let arrow = ArrowView(color: UIColor.gradient[safe: counter], orientation: .vertical)
        arrow.setHugging(.defaultLow, for: .vertical)
        arrow.setCompressionResistance(.defaultHigh, for: .vertical)
        container.addSubview(arrow)
        
        arrow.top(to: lastSubview ?? container, lastSubview?.bottomAnchor ?? container.topAnchor, offset: margin)
        arrow.left(to: container, offset: margin)
        arrow.right(to: container, offset: -margin)
        
        layoutIfNeeded()
        
        heights.append(arrow.height(to: lastSubview ?? container, priority: .defaultLow))
        heights.append(contentsOf: arrow.height(min: 100, max: 220, priority: .defaultHigh))
        
        lastBottomConstraint?.isActive = false
        lastBottomConstraint = arrow.bottom(to: container, offset: -margin, relation: .equalOrLess)
        lastSubview = arrow
        counter += 1
    }
}

extension Advanced: Updatable {
    
    func collapse() {
        heights.forEach { $0.constant = 0 }
        counter = 0
        
        UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.7) {
            self.container.subviews.forEach { $0.alpha = 0 }
            }.startAnimation()
    }
    
    func reset() {
        container.subviews.forEach { $0.removeFromSuperview() }
        heights.removeAll()
        lastSubview = nil
        lastBottomConstraint = nil
    }
    
    func update() {
        if counter >= UIColor.gradient.count {
            collapse()
        } else {
            if counter == 0 {
                reset()
            }
            appendSubview()
        }
        
        UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7) {
            self.layoutIfNeeded()
            }.startAnimation()
    }
}
