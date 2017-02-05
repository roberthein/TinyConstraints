
import TinyConstraints

class Collections: UIView {
    var state: State = .first {
        didSet {
            if let previousState = state.previous() {
                states[previousState.rawValue]?.deActivate()
            }
            states[state.rawValue]?.activate()
        }
    }
    
    lazy var container: Container = {
        let container = Container()
        return container
    }()
    
    lazy var subview: UIView = {
        let arrow = ArrowView(color: UIColor.gradient[safe: 0], orientation: .horizontal)
        return arrow
    }()
    
    var states: StateConstraints = [:]
    var stateColor: StateColor = [:]
    var counter = 0
    
    convenience init() {
        self.init(frame: .zero)
        
        addSubview(container)
        container.size(CGSize(width: 320, height: 320))
        container.center(in: self)
        
        container.addSubview(subview)
        
        for state in State.allCases {
            switch state {
            case .first:
                stateColor[state.rawValue] = UIColor.gradient[safe: 0]
                states[state.rawValue] = [subview.left(to: container, offset: 20), subview.top(to: container, offset: 20), subview.width(100), subview.height(100)]
            case .second:
                stateColor[state.rawValue] = UIColor.gradient[safe: 1]
                states[state.rawValue] = [subview.centerX(to: container), subview.centerY(to: container), subview.width(200), subview.height(200)]
            case .third:
                stateColor[state.rawValue] = UIColor.gradient[safe: 2]
                states[state.rawValue] = subview.edges(to: container, insets: UIEdgeInsets(top: 20, left: 20, bottom: -20, right: -20))
            case .fourth:
                stateColor[state.rawValue] = UIColor.gradient[safe: 3]
                states[state.rawValue] = [subview.top(to: container, offset: 20), subview.bottom(to: container, offset: -20), subview.right(to: container, offset: -20), subview.width(100)]
            }
        }
        
        state = .first
    }
}

extension Collections: Updatable {
    
    func reset() {
        State.allCases.forEach { self.states[$0.rawValue]?.deActivate() }
        states[State.first.rawValue]?.activate()
        subview.backgroundColor = stateColor[State.first.rawValue]
        layoutIfNeeded()
    }
    
    func update() {
        counter += 1
        
        if counter % 2 == 0 {
            guard let nextState = state.next() else { return }
            state = nextState
            
            let animator = UIViewPropertyAnimator(duration: 0, timingParameters: UISpringTimingParameters(mass: 0.3, stiffness: 15, damping: 3.5, initialVelocity: CGVector(dx: 2, dy: 2)))
            animator.addAnimations {
                self.subview.backgroundColor = self.stateColor[nextState.rawValue]
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }
}
