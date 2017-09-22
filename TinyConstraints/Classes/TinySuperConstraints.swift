//
//  TinySuperConstraints.swift
//  TinyConstraints
//
//  Created by Wolfgang Lutz on 22.09.17.
//  Copyright © 2017 Robert-Hein Hooijmans. All rights reserved.
//

import UIKit

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
    
    @available(tvOS 10.0, *)
    @available(iOS 10.0, *)
    @discardableResult
    func edgesToSuperview(excluding excludedEdge: LayoutEdge = .none, inset: CGFloat = 0) -> Constraints {
        var result = Constraints()

        if !(excludedEdge == .top) { result.append(self.topToSuperview(offset: inset)) }
        
        if self.effectiveUserInterfaceLayoutDirection == .leftToRight {
            if !(excludedEdge == .leading || excludedEdge == .left)   { result.append(self.leftToSuperview(inset: inset)) }
            if !(excludedEdge == .trailing || excludedEdge == .right) { result.append(self.rightToSuperview(inset: inset)) }
        } else {
            if !(excludedEdge == .leading || excludedEdge == .right) { result.append(self.rightToSuperview(inset: inset)) }
            if !(excludedEdge == .trailing || excludedEdge == .left) { result.append(self.leftToSuperview(inset: inset)) }
        }
        
        if !(excludedEdge == .bottom) { result.append(self.bottomToSuperview(offset: -inset)) }
        
        return result
    }
    
    @discardableResult
    public func centerInSuperview(offset: CGPoint = .zero, priority: LayoutPriority = LayoutPriority.required, isActive: Bool = true) -> Constraints {
        return self.center(in: self.superview!, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func edgesToSuperview(insets: EdgeInsets = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        return self.edges(to: self.superview!, insets: insets, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func originToSuperiew(insets: CGVector = .zero, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        return self.origin(to: self.superview!, insets: insets, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func widthToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.width(to:self.superview!, dimension, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func heightToSuperview( _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.height(to:self.superview!, dimension, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }
    
    @available(tvOS 10.0, *)
    @available(iOS 10.0, *)
    @discardableResult
    public func leadingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, inset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        if self.effectiveUserInterfaceLayoutDirection == .rightToLeft {
            return self.leading(to: self.superview!, anchor, offset: -inset, relation: relation, priority: priority, isActive: isActive)
        } else {
            return self.leading(to: self.superview!, anchor, offset: inset, relation: relation, priority: priority, isActive: isActive)
        }
    }
    
    @discardableResult
    public func leftToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, inset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.left(to: self.superview!, anchor, offset: inset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @available(tvOS 10.0, *)
    @available(iOS 10.0, *)
    @discardableResult
    public func trailingToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, inset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        if self.effectiveUserInterfaceLayoutDirection == .rightToLeft {
            return self.trailing(to: self.superview!, anchor, offset: inset, relation: relation, priority: priority, isActive: isActive)
        } else {
            return self.trailing(to: self.superview!, anchor, offset: -inset, relation: relation, priority: priority, isActive: isActive)
        }
    }
    
    
    @discardableResult
    public func rightToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, inset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.right(to: self.superview!, anchor, offset: -inset, relation: relation, priority: priority, isActive: isActive)
    }
    
    
    @discardableResult
    public func topToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.top(to: self.superview!, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    
    @discardableResult
    public func bottomToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.bottom(to: self.superview!, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerXToSuperview( _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.centerX(to: self.superview!, anchor, offset: offset, priority: priority, isActive: isActive)
    }
    
    @discardableResult
    public func centerYToSuperview( _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return self.centerY(to: self.superview!, anchor, offset: offset, priority: priority, isActive: isActive)
    }
}
