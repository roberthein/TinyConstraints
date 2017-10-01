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

import UIKit


public extension View {
    
    @available(tvOS 10.0, *)
    @available(iOS 10.0, *)
    @discardableResult
    func edgesToSuperview(excluding excludedEdge: LayoutEdge = .none, inset: CGFloat = 0) -> Constraints {
        var constraints = Constraints()
        
        if excludedEdge != .top {
            constraints.append(topToSuperview(offset: inset))
        }
        
        if effectiveUserInterfaceLayoutDirection == .leftToRight {
            
            if !(excludedEdge == .leading || excludedEdge == .left) {
                constraints.append(leftToSuperview(inset: inset))
            }
            
            if !(excludedEdge == .trailing || excludedEdge == .right) {
                constraints.append(rightToSuperview(inset: inset))
            }
        } else {
            
            if !(excludedEdge == .leading || excludedEdge == .right) {
                constraints.append(rightToSuperview(inset: inset))
            }
            
            if !(excludedEdge == .trailing || excludedEdge == .left) {
                constraints.append(leftToSuperview(inset: inset))
            }
        }
        
        if excludedEdge != .bottom {
            constraints.append(bottomToSuperview(offset: -inset))
        }
        
        return constraints
    }
    
    @available(tvOS 10.0, *)
    @available(iOS 10.0, *)
    @discardableResult
    public func leadingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, inset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        
        if effectiveUserInterfaceLayoutDirection == .rightToLeft {
            return leading(to: superview, anchor, offset: -inset, relation: relation, priority: priority, isActive: isActive)
        } else {
            return leading(to: superview, anchor, offset: inset, relation: relation, priority: priority, isActive: isActive)
        }
    }
    
    @available(tvOS 10.0, *)
    @available(iOS 10.0, *)
    @discardableResult
    public func trailingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, inset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        guard let superview = superview else { fatalError("Unable to create this constraint to it's superview, because it has no superview.") }
        
        if effectiveUserInterfaceLayoutDirection == .rightToLeft {
            return trailing(to: superview, anchor, offset: inset, relation: relation, priority: priority, isActive: isActive)
        } else {
            return trailing(to: superview, anchor, offset: -inset, relation: relation, priority: priority, isActive: isActive)
        }
    }
}

