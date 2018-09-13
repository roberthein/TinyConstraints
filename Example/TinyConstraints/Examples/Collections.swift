import Foundation
import UIKit
import TinyConstraints

class Collections: UIView {
    
    private var state: State = .first {
        didSet {
            if let previousState = state.previous() {
                states[previousState.rawValue]?.deActivate()
            }
            states[state.rawValue]?.activate()
        }
    }
    
    private lazy var container = Container()
    private lazy var subview = ArrowView(color: UIColor.gradient[safe: 0], orientation: .horizontal)
    
    private var states: StateConstraints = [:]
    private var stateColor: StateColor = [:]
    private var counter = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(container)
        container.addSubview(subview)
        
        container.size(CGSize(width: 320, height: 320))
        container.center(in: self)
        
        for state in State.allCases {
            switch state {
            case .first:
                stateColor[state.rawValue] = UIColor.gradient[safe: 0]
                states[state.rawValue] = subview.origin(to: container, insets: CGVector(dx: 20, dy: 20)) + subview.size(CGSize(width: 100, height: 100))
            case .second:
                stateColor[state.rawValue] = UIColor.gradient[safe: 1]
                states[state.rawValue] = [
                    subview.centerX(to: container, isActive: false),
                    subview.centerY(to: container, isActive: false),
                    subview.width(200, isActive: false),
                    subview.height(200, isActive: false)
                ]
            case .third:
                stateColor[state.rawValue] = UIColor.gradient[safe: 2]
                states[state.rawValue] = subview.edges(to: container, insets: UIEdgeInsets(top: 20, left: 20, bottom: -20, right: -20), isActive: false)
            case .fourth:
                stateColor[state.rawValue] = UIColor.gradient[safe: 0]
                states[state.rawValue] = [
                    subview.top(to: container, offset: 20, isActive: false),
                    subview.bottom(to: container, offset: -20, isActive: false),
                    subview.right(to: container, offset: -20, isActive: false),
                    subview.width(100, priority: .defaultHigh, isActive: false)
                ]
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Collections: Updatable {
    
    func reset() {
        State.allCases.forEach { states[$0.rawValue]?.deActivate() }
        states[State.first.rawValue]?.activate()
        subview.backgroundColor = stateColor[State.first.rawValue]
        layoutIfNeeded()
    }
    
    func update() {
        counter += 1
        
        if counter % 2 == 0 {
            guard let nextState = state.next() else {
                return
            }
            
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
