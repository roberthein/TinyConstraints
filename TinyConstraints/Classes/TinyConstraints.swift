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

public extension Constrainable {
    
    // MARK: Center
    @discardableResult
    public func center(in view: Constrainable, offset: CGPoint = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
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
    public func center(in view: Constrainable, offset: CGPoint) -> Constraints {
        return center(in: view, offset: offset, priority: .required, isActive: true)
    }
    
    // MARK: Edges
    @discardableResult
    public func edges(to view: Constrainable, insets: TinyEdgeInsets = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
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
    public func edges(to view: Constrainable, insets: TinyEdgeInsets) -> Constraints {
        return edges(to: view, insets: insets, priority: .required, isActive: true)
    }
    
    // MARK: Size
    @discardableResult
    public func size(_ size: CGSize, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
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
    public func size(to view: Constrainable, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
        let constraints = [
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: offset).with(priority),
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: offset).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func size(to view: Constrainable, offset: CGFloat) -> Constraints {
        return size(to: view, multiplier: 1, offset: offset, priority: .required, isActive: true)
    }
    
    // MARK: Origin
    @discardableResult
    public func origin(to view: Constrainable, insets: CGVector = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
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
    public func origin(to view: Constrainable, insets: CGVector) -> Constraints {
        return origin(to: view, insets: insets, priority: .required, isActive: true)
    }
    
    // MARK: Width
    @discardableResult
    public func width(_ width: CGFloat, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return widthAnchor.constraint(equalToConstant: width).with(priority).set(active: isActive)
        case .equalOrLess: return widthAnchor.constraint(lessThanOrEqualToConstant: width).with(priority).set(active: isActive)
        case .equalOrGreater: return widthAnchor.constraint(greaterThanOrEqualToConstant: width).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func width(to view: Constrainable, _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return widthAnchor.constraint(equalTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return widthAnchor.constraint(lessThanOrEqualTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return widthAnchor.constraint(greaterThanOrEqualTo: dimension ?? view.widthAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        }
    }

    @discardableResult
    public func widthToHeight(of view: Constrainable, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return width(to: view, view.heightAnchor, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func width(to view: Constrainable, offset: CGFloat) -> Constraint {
        return width(to: view, multiplier: 1, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func width(min: CGFloat? = nil, max: CGFloat? = nil, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
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
    
    // MARK: Height
    @discardableResult
    public func height(_ height: CGFloat, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return heightAnchor.constraint(equalToConstant: height).with(priority).set(active: isActive)
        case .equalOrLess: return heightAnchor.constraint(lessThanOrEqualToConstant: height).with(priority).set(active: isActive)
        case .equalOrGreater: return heightAnchor.constraint(greaterThanOrEqualToConstant: height).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func height(to view: Constrainable, _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return heightAnchor.constraint(equalTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return heightAnchor.constraint(lessThanOrEqualTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return heightAnchor.constraint(greaterThanOrEqualTo: dimension ?? view.heightAnchor, multiplier: multiplier, constant: offset).with(priority).set(active: isActive)
        }
    }

    @discardableResult
    public func heightToWidth(of view: Constrainable, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return height(to: view, view.widthAnchor, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func height(to view: Constrainable, offset: CGFloat) -> Constraint {
        return height(to: view, nil, multiplier: 1, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func height(min: CGFloat? = nil, max: CGFloat? = nil, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        prepareForLayout()
        
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
    public func aspectRatio(_ ratio: CGFloat, relation: ConstraintRelation = .equal, priotity: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return widthToHeight(of: self, multiplier: ratio, offset: 0, relation: relation, priority: priotity, isActive: isActive)
    }
    
    // MARK: Leading
    @discardableResult
    public func leadingToTrailing(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        return leading(to: view, view.trailingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func leadingToTrailing(of view: Constrainable, offset: CGFloat) -> Constraint {
        return leadingToTrailing(of: view, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func leading(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return leadingAnchor.constraint(equalTo: anchor ?? view.leadingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return leadingAnchor.constraint(lessThanOrEqualTo: anchor ?? view.leadingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return leadingAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.leadingAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func leading(to view: Constrainable, offset: CGFloat) -> Constraint {
        return leading(to: view, nil, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    // MARK: Left
    @discardableResult
    public func leftToRight(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        return left(to: view, view.rightAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func leftToRight(of view: Constrainable, offset: CGFloat) -> Constraint {
        return leftToRight(of: view, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func left(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return leftAnchor.constraint(equalTo: anchor ?? view.leftAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return leftAnchor.constraint(lessThanOrEqualTo: anchor ?? view.leftAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return leftAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.leftAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func left(to view: Constrainable, offset: CGFloat) -> Constraint {
        return left(to: view, nil, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    // MARK: Trailing
    @discardableResult
    public func trailingToLeading(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        return trailing(to: view, view.leadingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func trailingToLeading(of view: Constrainable, offset: CGFloat) -> Constraint {
        return trailingToLeading(of: view, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func trailing(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return trailingAnchor.constraint(equalTo: anchor ?? view.trailingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return trailingAnchor.constraint(lessThanOrEqualTo: anchor ?? view.trailingAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return trailingAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.trailingAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func trailing(to view: Constrainable, offset: CGFloat) -> Constraint {
        return trailing(to: view, nil, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    // MARK: Right
    @discardableResult
    public func rightToLeft(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        return right(to: view, view.leftAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func rightToLeft(of view: Constrainable, offset: CGFloat) -> Constraint {
        return rightToLeft(of: view, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func right(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return rightAnchor.constraint(equalTo: anchor ?? view.rightAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return rightAnchor.constraint(lessThanOrEqualTo: anchor ?? view.rightAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return rightAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.rightAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func right(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat) -> Constraint {
        return right(to: view, anchor, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    // MARK: Top
    @discardableResult
    public func topToBottom(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        return top(to: view, view.bottomAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func topToBottom(of view: Constrainable, offset: CGFloat) -> Constraint {
        return topToBottom(of: view, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    @discardableResult
    public func top(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return topAnchor.constraint(equalTo: anchor ?? view.topAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return topAnchor.constraint(lessThanOrEqualTo: anchor ?? view.topAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return topAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.topAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func top(to view: Constrainable, offset: CGFloat) -> Constraint {
        return top(to: view, nil, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    // MARK: Bottom
    @discardableResult
    public func bottomToTop(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        return bottom(to: view, view.topAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func bottomToTop(of view: Constrainable, offset: CGFloat) -> Constraint {
        return bottomToTop(of: view, offset: offset, relation: .equal, priority: .required, isActive: true)
    }

    @discardableResult
    public func bottom(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        switch relation {
        case .equal: return bottomAnchor.constraint(equalTo: anchor ?? view.bottomAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrLess: return bottomAnchor.constraint(lessThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).with(priority).set(active: isActive)
        case .equalOrGreater: return bottomAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).with(priority).set(active: isActive)
        }
    }
    
    @discardableResult
    public func bottom(to view: Constrainable, offset: CGFloat) -> Constraint {
        return bottom(to: view, nil, offset: offset, relation: .equal, priority: .required, isActive: true)
    }
    
    // MARK: Center X
    @discardableResult
    public func centerX(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        let constraint = centerXAnchor.constraint(equalTo: anchor ?? view.centerXAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerX(to view: Constrainable, offset: CGFloat) -> Constraint {
        return centerX(to: view, nil, offset: offset, priority: .required, isActive: true)
    }
    
    // MARK: Center Y
    @discardableResult
    public func centerY(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        prepareForLayout()
        
        let constraint = centerYAnchor.constraint(equalTo: anchor ?? view.centerYAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerY(to view: Constrainable, offset: CGFloat) -> Constraint {
        return centerY(to: view, nil, offset: offset, priority: .required, isActive: true)
    }
}

public extension View {
    
    public func setHugging(_ priority: LayoutPriority, for axis: ConstraintAxis) {
        setContentHuggingPriority(priority, for: axis)
    }
    
    public func setCompressionResistance(_ priority: LayoutPriority, for axis: ConstraintAxis) {
        setContentCompressionResistancePriority(priority, for: axis)
    }
}
