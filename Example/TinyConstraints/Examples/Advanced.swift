
import TinyConstraints

class Advanced: UIView {
    var lastBottomConstraint: Constraint?
    var lastSubview: UIView?
    let margin: CGFloat = 20
    var counter = 0
    
    lazy var container: Container = {
        let container = Container()
        return container
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        addSubview(container)
        container.width(310)
        container.height(min: 310)
        container.center(in: self)
    }
    
    func appendSubview() {
        
        let arrow = ArrowView(color: UIColor.gradient[safe: counter], orientation: .vertical)
        arrow.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        arrow.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        container.addSubview(arrow)
        
        arrow.top(to: lastSubview ?? container, lastSubview?.bottomAnchor ?? container.topAnchor, offset: margin)
        arrow.left(to: container, offset: margin)
        arrow.right(to: container, offset: -margin)
        layoutIfNeeded()
        arrow.height(to: lastSubview ?? container, priority: UILayoutPriorityDefaultLow)
        arrow.height(min: 100, max: 220)
        
        lastBottomConstraint?.isActive = false
        lastBottomConstraint = arrow.bottom(lessThan: container, offset: -margin)
        lastSubview = arrow
        counter += 1
    }
}

extension Advanced: Updatable {
    
    func reset() {
        container.subviews.forEach { $0.removeFromSuperview() }
        lastSubview = nil
        lastBottomConstraint = nil
        counter = 0
    }
    
    func update() {
        if counter >= UIColor.gradient.count {
            reset()
        } else {
            appendSubview()
        }
        
        UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7) {
            self.layoutIfNeeded()
            }.startAnimation()
    }
}
