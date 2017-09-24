
import TinyConstraints

class Basic: UIView {
    var sizes: Constraints = []
    var counter = 1
    
    lazy var container: Container = {
        let container = Container()
        return container
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        addSubview(container)
        container.width(320)
        container.height(min: 320, priority: .defaultHigh)
        container.center(in: self)
        
        var row = -1
        for i in 0..<9 {
            let column = i % 3
            if column == 0 {
                row = row + 1
            }
            
            let arrow = ArrowView(color: UIColor.gradient[safe: row], orientation: .diagonal)
            container.addSubview(arrow)
            
            sizes.append(contentsOf: arrow.size(CGSize(width: 60, height: 60)))
            arrow.centerX(to: container, offset: (CGFloat(column) * 100) - 150 + (100 / 2))
            arrow.centerY(to: container, offset: (CGFloat(row) * 100) - 150 + (100 / 2))
        }
    }
}

extension Basic: Updatable {
    
    func reset() {
        counter = 1
        sizes.forEach { $0.constant = 60 }
        layoutIfNeeded()
    }
    
    func update() {
        var previous: TimeInterval = 0
        counter += 1
        
        let shouldZoomIn: Bool? = counter % 2 == 0 ? false : counter % 3 == 0 ? true : nil
        guard let zoom = shouldZoomIn else { return }
        
        for (i, constraint) in sizes.enumerated() {
            let same = i % 2 == 0
            let delay = zoom ? TimeInterval(i) * 0.02 : 0
            let spring = UISpringTimingParameters(mass: zoom ? 0.2 : 0.05, stiffness: 5, damping: zoom ? 0.8 : 1.0, initialVelocity: CGVector(dx: 0, dy: 0))
            let animator = UIViewPropertyAnimator(duration: 2, timingParameters: spring)
            
            constraint.constant = zoom ? 90 : 60
            animator.addAnimations {
                self.layoutIfNeeded()
            }
            
            animator.startAnimation(afterDelay: same ? previous : delay)
            previous = delay
        }
        
        if counter >= 3 {
            counter = 0
        }
    }
}
