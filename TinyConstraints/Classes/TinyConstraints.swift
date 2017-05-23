//
//    MIT License
//
//    Copyright (c) 2017 Robert-Hein Hooijmans <rh.hooijmans@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.
//

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

public enum ConstraintDirection {
    case topConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var top: ConstraintDirection {
        return .topConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func top(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .topConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case bottomConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var bottom: ConstraintDirection {
        return .bottomConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func bottom(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .bottomConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case leftConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var left: ConstraintDirection {
        return .leftConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func left(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .leftConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case rightConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var right: ConstraintDirection {
        return .rightConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func right(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .rightConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case leadingConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var leading: ConstraintDirection {
        return .leadingConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func leading(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .leadingConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case trailingConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var trailing: ConstraintDirection {
        return .trailingConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func trailing(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .trailingConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case leadingToTrailingConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var leadingToTrailing: ConstraintDirection {
        return .leadingToTrailingConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func leadingToTrailing(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .leadingToTrailingConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case trailingToLeadingConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var trailingToLeading: ConstraintDirection {
        return trailingToLeadingConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func trailingToLeading(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .trailingToLeadingConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case leftToRightConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var leftToRight: ConstraintDirection {
        return leftToRightConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func leftToRight(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .leftToRightConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case rightToLeftConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var rightToLeft: ConstraintDirection {
        return rightToLeftConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func rightToLeft(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .rightToLeftConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case topToBottomConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var topToBottom: ConstraintDirection {
        return topToBottomConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func topToBottom(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .topToBottomConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case bottomToTopConstraint(offset: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static var bottomToTop: ConstraintDirection {
        return bottomToTopConstraint(offset: 0, relation: .equal, priority: .required)
    }
    public static func bottomToTop(_ offset: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .bottomToTopConstraint(offset: offset, relation: relation, priority: priority)
    }
    
    case centerXConstraint(offset: CGFloat, priority: ConstraintPriority)
    public static var centerX: ConstraintDirection {
        return centerXConstraint(offset: 0, priority: .required)
    }
    public static func centerX(_ offset: CGFloat, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .centerXConstraint(offset: offset, priority: priority)
    }
    
    case centerYConstraint(offset: CGFloat, priority: ConstraintPriority)
    public static var centerY: ConstraintDirection {
        return centerYConstraint(offset: 0, priority: .required)
    }
    public static func centerY(_ offset: CGFloat, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .centerYConstraint(offset: offset, priority: priority)
    }
    
    case heightConstraint(heightPoints: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static func height(_ height: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .heightConstraint(heightPoints: height, relation: relation, priority: priority)
    }
    case heightConstraintToView(view: Constrainable, relation: ConstraintRelation, priority: ConstraintPriority)
    public static func height(_ view: Constrainable, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .heightConstraintToView(view: view, relation: relation, priority: priority)
    }
    
    case widthConstraint(widthPoints: CGFloat, relation: ConstraintRelation, priority: ConstraintPriority)
    public static func width(_ width: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .widthConstraint(widthPoints: width, relation: relation, priority: priority)
    }
    
    case widthConstraintToView(view: Constrainable, relation: ConstraintRelation, priority: ConstraintPriority)
    public static func width(_ view: Constrainable, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required) -> ConstraintDirection {
        return .widthConstraintToView(view: view, relation: relation, priority: priority)
    }
    
}

public extension Constrainable {
    
    @discardableResult
    public func center(in view: Constrainable, offset: CGPoint = .zero, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayoutIfNeeded()
        
        let constraints = [
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x).with(priority),
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func edges(to view: Constrainable, insets: EdgeInsets = .zero, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayoutIfNeeded()
        
        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).with(priority),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).with(priority),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).with(priority),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func edges(_ directions: [ConstraintDirection], to view: Constrainable) -> Constraints {
        var constraints = [Constraint]()
        for direction in directions {
            switch direction {
            case .topConstraint(let offset, let relation, let priority):
                constraints.append(top(to: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .bottomConstraint(let offset, let relation, let priority):
                constraints.append(bottom(to: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .leftConstraint(let offset, let relation, let priority):
                constraints.append(left(to: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .rightConstraint(let offset, let relation, let priority):
                constraints.append(right(to: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .leadingConstraint(let offset, let relation, let priority):
                constraints.append(leading(to: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .trailingConstraint(let offset, let relation, let priority):
                constraints.append(trailing(to: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .leadingToTrailingConstraint(let offset, let relation, let priority):
                constraints.append(leadingToTrailing(of: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .trailingToLeadingConstraint(let offset, let relation, let priority):
                constraints.append(trailingToLeading(of: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .leftToRightConstraint(let offset, let relation, let priority):
                constraints.append(leftToRight(of: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .rightToLeftConstraint(let offset, let relation, let priority):
                constraints.append(rightToLeft(of: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .topToBottomConstraint(let offset, let relation, let priority):
                constraints.append(topToBottom(of: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .bottomToTopConstraint(let offset, let relation, let priority):
                constraints.append(bottomToTop(of: view, offset: offset, relation: relation, priority: priority, isActive: true))
            case .centerXConstraint(let offset, let priority):
                constraints.append(centerX(to: view, offset: offset, priority: priority, isActive: true))
            case .centerYConstraint(let offset, let priority):
                constraints.append(centerY(to: view, offset: offset, priority: priority, isActive: true))
            case .heightConstraint(let heightPoints, let relation, let priority):
                constraints.append(height(heightPoints, relation: relation, priority: priority, isActive: true))
            case .heightConstraintToView(let view, let relation, let priority):
                constraints.append(height(to: view, multiplier: 1, offset: 0, relation: relation, priority: priority, isActive: true))
            case .widthConstraint(let heightPoints, let relation, let priority):
                constraints.append(width(heightPoints, relation: relation, priority: priority, isActive: true))
            case .widthConstraintToView(let view, let relation, let priority):
                constraints.append(width(to: view, multiplier: 1, offset: 0, relation: relation, priority: priority, isActive: true))
            }
        }
        return constraints
    }
    
    @discardableResult
    public func size(_ size: CGSize, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayoutIfNeeded()
        
        let constraints = [
            widthAnchor.constraint(equalToConstant: size.width).with(priority),
            heightAnchor.constraint(equalToConstant: size.height).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func origin(to view: Constrainable, insets: CGVector = .zero, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayoutIfNeeded()
        
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.dx).with(priority),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.dy).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func width(_ width: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return widthAnchor.constraint(equalToConstant: width).with(priority).set(active: isActive)
        case .equalOrLess: return widthAnchor.constraint(lessThanOrEqualToConstant: width).with(priority).set(active: isActive)
        case .equalOrGreater: return widthAnchor.constraint(greaterThanOrEqualToConstant: width).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func width(to view: Constrainable, _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return widthAnchor.constraint(equalTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return widthAnchor.constraint(lessThanOrEqualTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return widthAnchor.constraint(greaterThanOrEqualTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func width(min: CGFloat? = nil, max: CGFloat? = nil, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayoutIfNeeded()
        
        var constraints: Constraints = []
        
        if let min = min {
            let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: min).with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        if let max = max {
            let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: max).with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        return constraints
    }
    
    @discardableResult
    public func height(_ height: CGFloat, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return heightAnchor.constraint(equalToConstant: height).with(priority).set(active: isActive)
        case .equalOrLess: return heightAnchor.constraint(lessThanOrEqualToConstant: height).with(priority).set(active: isActive)
        case .equalOrGreater: return heightAnchor.constraint(greaterThanOrEqualToConstant: height).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func height(to view: Constrainable, _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return heightAnchor.constraint(equalTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return heightAnchor.constraint(lessThanOrEqualTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return heightAnchor.constraint(greaterThanOrEqualTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func height(min: CGFloat? = nil, max: CGFloat? = nil, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayoutIfNeeded()
        
        var constraints: Constraints = []
        
        if let min = min {
            let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: min).with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        if let max = max {
            let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: max).with(priority)
            constraint.isActive = isActive
            constraints.append(constraint)
        }
        
        return constraints
    }
    
    @discardableResult
    public func leadingToTrailing(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        return leading(to: view, view.trailingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func leading(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return leadingAnchor.constraint(equalTo: anchor ?? view.leadingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return leadingAnchor.constraint(lessThanOrEqualTo: anchor ?? view.leadingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return leadingAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.leadingAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func leftToRight(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        return left(to: view, view.rightAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func left(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return leftAnchor.constraint(equalTo: anchor ?? view.leftAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return leftAnchor.constraint(lessThanOrEqualTo: anchor ?? view.leftAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return leftAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.leftAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func trailingToLeading(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        return trailing(to: view, view.leadingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func trailing(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return trailingAnchor.constraint(equalTo: anchor ?? view.trailingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return trailingAnchor.constraint(lessThanOrEqualTo: anchor ?? view.trailingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return trailingAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.trailingAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func rightToLeft(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        return right(to: view, view.leftAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func right(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return rightAnchor.constraint(equalTo: anchor ?? view.rightAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return rightAnchor.constraint(lessThanOrEqualTo: anchor ?? view.rightAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return rightAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.rightAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func topToBottom(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        return top(to: view, view.bottomAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func top(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return topAnchor.constraint(equalTo: anchor ?? view.topAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return topAnchor.constraint(lessThanOrEqualTo: anchor ?? view.topAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return topAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.topAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func bottomToTop(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        return bottom(to: view, view.topAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func bottom(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        switch relation {
        case .equal: return bottomAnchor.constraint(equalTo: anchor ?? view.bottomAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return bottomAnchor.constraint(lessThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return bottomAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func centerX(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        let constraint = centerXAnchor.constraint(equalTo: anchor ?? view.centerXAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerY(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: ConstraintPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayoutIfNeeded()
        
        let constraint = centerYAnchor.constraint(equalTo: anchor ?? view.centerYAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    
}

public extension View {
    
    public func setHugging(_ priority: ConstraintPriority, for axis: ConstraintAxis) {
        setContentHuggingPriority(priority.value, for: axis)
    }
    
    public func setCompressionResistance(_ priority: ConstraintPriority, for axis: ConstraintAxis) {
        setContentCompressionResistancePriority(priority.value, for: axis)
    }
}
