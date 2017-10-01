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
    
    public extension View {
        
        @discardableResult
        func edgesToSuperview(excluding excludedEdge: LayoutEdge = .none, insets: TinyEdgeInsets = .zero) -> Constraints {
            var constraints = Constraints()
            
            if excludedEdge != .top {
                constraints.append(topToSuperview(offset: insets.top))
            }
            
            if excludedEdge != .left {
                constraints.append(leftToSuperview(offset: insets.left))
            }
            
            if excludedEdge != .right {
                constraints.append(rightToSuperview(offset: -insets.right))
            }
            
            if excludedEdge != .bottom {
                constraints.append(bottomToSuperview(offset: -insets.bottom))
            }
            
            return constraints
        }
    }
#else
    import UIKit
    
    public extension View {
        
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        func edgesToSuperview(excluding excludedEdge: LayoutEdge = .none, insets: TinyEdgeInsets = .zero) -> Constraints {
            var constraints = Constraints()
            
            if excludedEdge != .top {
                constraints.append(topToSuperview(offset: insets.top))
            }
            
            if effectiveUserInterfaceLayoutDirection == .leftToRight {
                
                if !(excludedEdge == .leading || excludedEdge == .left) {
                    constraints.append(leftToSuperview(offset: insets.left))
                }
                
                if !(excludedEdge == .trailing || excludedEdge == .right) {
                    constraints.append(rightToSuperview(offset: -insets.right))
                }
            } else {
                
                if !(excludedEdge == .leading || excludedEdge == .right) {
                    constraints.append(rightToSuperview(offset: -insets.right))
                }
                
                if !(excludedEdge == .trailing || excludedEdge == .left) {
                    constraints.append(leftToSuperview(offset: insets.left))
                }
            }
            
            if excludedEdge != .bottom {
                constraints.append(bottomToSuperview(offset: -insets.bottom))
            }
            
            return constraints
        }
        
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        public func leadingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
            guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
            
            if effectiveUserInterfaceLayoutDirection == .rightToLeft {
                return leading(to: superview, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
            } else {
                return leading(to: superview, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
            }
        }
        
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        public func trailingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
            guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
            
            if effectiveUserInterfaceLayoutDirection == .rightToLeft {
                return trailing(to: superview, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
            } else {
                return trailing(to: superview, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
            }
        }
    }
#endif

public extension View {
    
    enum LayoutEdge {
        case top
        case bottom
        case trailing
        case leading
        case left
        case right
        case none
    }
    
    
    @discardableResult
    public func centerInSuperview(offset: CGPoint = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return center(in: superview, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func edgesToSuperview(insets: TinyEdgeInsets = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return edges(to: superview, insets: insets, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func originToSuperview(insets: CGVector = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return origin(to: superview, insets: insets, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func widthToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return width(to: superview, dimension, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func heightToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return height(to: superview, dimension, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func leftToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return left(to: superview, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func rightToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return right(to: superview, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func topToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return top(to: superview, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func bottomToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return bottom(to: superview, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerXToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return centerX(to: superview, anchor, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerYToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        return centerY(to: superview, anchor, offset: offset, priority: priority, isActive: isActive)
    }
}
