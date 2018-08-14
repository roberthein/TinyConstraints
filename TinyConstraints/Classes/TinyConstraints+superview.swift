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
            
            if !excludedEdge.contains(.top) {
                constraints.append(topToSuperview(offset: insets.top))
            }
            
            if !excludedEdge.contains(.left) {
                constraints.append(leftToSuperview(offset: insets.left))
            }
            
            if !excludedEdge.contains(.right) {
                constraints.append(rightToSuperview(offset: -insets.right))
            }
            
            if !excludedEdge.contains(.bottom) {
                constraints.append(bottomToSuperview(offset: -insets.bottom))
            }
            
            return constraints
        }
    }
#else
    import UIKit
    
    public extension View {
        
        // MARK: Edges
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        func edgesToSuperview(excluding excludedEdge: LayoutEdge = .none, insets: TinyEdgeInsets = .zero) -> Constraints {
            var constraints = Constraints()
            
            if !excludedEdge.contains(.top) {
                constraints.append(topToSuperview(offset: insets.top))
            }
            
            if effectiveUserInterfaceLayoutDirection == .leftToRight {
                
                if !(excludedEdge.contains(.leading) || excludedEdge.contains(.left)) {
                    constraints.append(leftToSuperview(offset: insets.left))
                }
                
                if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.right)) {
                    constraints.append(rightToSuperview(offset: -insets.right))
                }
            } else {
                
                if !(excludedEdge.contains(.leading) || excludedEdge.contains(.right)) {
                    constraints.append(rightToSuperview(offset: -insets.right))
                }
                
                if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.left)) {
                    constraints.append(leftToSuperview(offset: insets.left))
                }
            }
            
            if !excludedEdge.contains(.bottom) {
                constraints.append(bottomToSuperview(offset: -insets.bottom))
            }
            
            return constraints
        }
        
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        func edgesToSuperview(insets: TinyEdgeInsets) -> Constraints {
            return edgesToSuperview(excluding: .none, insets: insets)
        }
        
        // MARK: Leading
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        public func leadingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
            let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
            
            if effectiveUserInterfaceLayoutDirection == .rightToLeft {
                return leading(to: constrainable, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
            } else {
                return leading(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
            }
        }
        
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        public func leadingToSuperview(offset: CGFloat) -> Constraint {
            return leadingToSuperview(nil, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
        }
        
        // MARK: Trailing
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        public func trailingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
            let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
            
            if effectiveUserInterfaceLayoutDirection == .rightToLeft {
                return trailing(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
            } else {
                return trailing(to: constrainable, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
            }
        }
        
        @available(tvOS 10.0, *)
        @available(iOS 10.0, *)
        @discardableResult
        public func trailingToSuperview(offset: CGFloat) -> Constraint {
            return trailingToSuperview(nil, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
        }
    }
#endif

public struct LayoutEdge: OptionSet {
    public let rawValue: UInt8
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
    public static let top = LayoutEdge(rawValue: 1 << 0)
    public static let bottom = LayoutEdge(rawValue: 1 << 1)
    public static let trailing = LayoutEdge(rawValue: 1 << 2)
    public static let leading = LayoutEdge(rawValue: 1 << 3)
    public static let left = LayoutEdge(rawValue: 1 << 4)
    public static let right = LayoutEdge(rawValue: 1 << 5)
    public static let none = LayoutEdge(rawValue: 1 << 6)
}

public extension View {
    
    private func safeConstrainable(for superview: View?, usingSafeArea: Bool) -> Constrainable {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        prepareForLayout()
        
        #if os(iOS) || os(tvOS)
            if #available(iOS 11, tvOS 11, *){
                if usingSafeArea {
                    return superview.safeAreaLayoutGuide
                }
            }
        #endif
        
        return superview
    }
    

    // MARK: Center
    @discardableResult
    public func centerInSuperview(offset: CGPoint = .zero, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return center(in: constrainable, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerInSuperview(offset: CGPoint) -> Constraints {
        return centerInSuperview(offset: offset, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Edges
    @discardableResult
    public func edgesToSuperview(insets: TinyEdgeInsets = .zero, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return edges(to: constrainable, insets: insets, priority: priority, isActive: isActive)
    }
    

    // MARK: Origin
    @discardableResult
    public func originToSuperview(insets: CGVector = .zero, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraints {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return origin(to: constrainable, insets: insets, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func originToSuperview(insets: CGVector) -> Constraints {
        return originToSuperview(insets: insets, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Width
    @discardableResult
    public func widthToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return width(to: constrainable, dimension, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func widthToSuperview(offset: CGFloat) -> Constraint {
        return widthToSuperview(nil, multiplier: 1, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Height
    @discardableResult
    public func heightToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return height(to: constrainable, dimension, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func heightToSuperview(offset: CGFloat = 0) -> Constraint {
        return heightToSuperview(nil, multiplier: 1, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Left
    @discardableResult
    public func leftToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return left(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func leftToSuperview(offset: CGFloat) -> Constraint {
        return leftToSuperview(nil, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Right
    @discardableResult
    public func rightToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return right(to: constrainable, anchor, offset: -offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func rightToSuperview(offset: CGFloat = 0) -> Constraint {
        return rightToSuperview(nil, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Top
    @discardableResult
    public func topToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return top(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func topToSuperview(offset: CGFloat) -> Constraint {
        return topToSuperview(nil, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Bottom
    @discardableResult
    public func bottomToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return bottom(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func bottomToSuperview(offset: CGFloat) -> Constraint {
        return bottomToSuperview(nil, offset: offset, relation: .equal, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Center X
    @discardableResult
    public func centerXToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return centerX(to: constrainable, anchor, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerXToSuperview(offset: CGFloat) -> Constraint {
        return centerXToSuperview(nil, offset: offset, priority: .required, isActive: true, usingSafeArea: false)
    }
    
    // MARK: Center Y
    @discardableResult
    public func centerYToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, usingSafeArea: Bool = false) -> Constraint {
        let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
        return centerY(to: constrainable, anchor, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerYToSuperview(offset: CGFloat) -> Constraint {
        return centerYToSuperview(nil, offset: offset, priority: .required, isActive: true, usingSafeArea: false)
    }
}
