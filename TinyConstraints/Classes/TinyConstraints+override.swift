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

import Foundation

#if os(OSX)
import AppKit
#else
import UIKit
#endif

@available(iOS 10.0, *)
public extension Constrainable {

    private func excludeConstraintIfExists<T: AnyObject>(withAnchor anchor: NSLayoutAnchor<T>, to view: Constrainable? = nil, withAnchor secondViewAnchor: NSLayoutAnchor<T>? = nil) {
        guard let selfView = self as? View,
            let view = view as? View else {
            return
        }

        if let constraint = view.constraints.first(where: { constraint -> Bool in
            let matchingItems = (constraint.firstItem as? View) == selfView && (constraint.secondItem as? View) == view
            let mathingAnchors = constraint.firstAnchor == anchor && constraint.secondAnchor == secondViewAnchor
            return matchingItems && mathingAnchors
        }) {
            view.removeConstraint(constraint)
        }
    }

    @discardableResult
    public func center(in view: Constrainable, offset: CGPoint = .zero, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: centerXAnchor, to: view, withAnchor: view.centerXAnchor)
            excludeConstraintIfExists(withAnchor: centerYAnchor, to: view, withAnchor: view.centerYAnchor)
        }

        return center(in: view, offset: offset, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func edges(to view: Constrainable, excluding excludedEdge: LayoutEdge = .none, insets: TinyEdgeInsets = .zero, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            if !excludedEdge.contains(.top) {
                excludeConstraintIfExists(withAnchor: topAnchor, to: view, withAnchor: view.topAnchor)
            }

            if !excludedEdge.contains(.left) {
                excludeConstraintIfExists(withAnchor: leftAnchor, to: view, withAnchor: view.leftAnchor)
            }

            if !excludedEdge.contains(.bottom) {
                excludeConstraintIfExists(withAnchor: bottomAnchor, to: view, withAnchor: view.bottomAnchor)
            }

            if !excludedEdge.contains(.right) {
                excludeConstraintIfExists(withAnchor: rightAnchor, to: view, withAnchor: view.rightAnchor)
            }
        }

        return edges(to: view, excluding: excludedEdge, insets: insets, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func size(_ size: CGSize, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: widthAnchor)
            excludeConstraintIfExists(withAnchor: heightAnchor)
        }

        return self.size(size, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func size(to view: Constrainable, multiplier: CGFloat = 1, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: widthAnchor, to: view, withAnchor: view.widthAnchor)
            excludeConstraintIfExists(withAnchor: heightAnchor, to: view, withAnchor: view.heightAnchor)
        }
        
        return self.size(to: view, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func origin(to view: Constrainable, insets: CGVector = .zero, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: leftAnchor, to: view, withAnchor: view.leftAnchor)
            excludeConstraintIfExists(withAnchor: topAnchor, to: view, withAnchor: view.topAnchor)
        }
        
        return origin(to: view, insets: insets, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func width(_ width: CGFloat, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: widthAnchor)
        }
        
        return self.width(width, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func width(to view: Constrainable, _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: widthAnchor, to: view, withAnchor: view.widthAnchor)
        }
        
        return self.width(to: view, dimension, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func widthToHeight(of view: Constrainable, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: widthAnchor, to: view, withAnchor: view.heightAnchor)
        }
        
        return widthToHeight(of: view, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func width(min: CGFloat? = nil, max: CGFloat? = nil, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: widthAnchor)
        }
        
        return self.width(min: min, max: max, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func height(_ height: CGFloat, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: heightAnchor)
        }
        
        return self.height(height, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func height(to view: Constrainable, _ dimension: NSLayoutDimension? = nil, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: heightAnchor, to: view, withAnchor: view.heightAnchor)
        }
        
        return self.height(to: view, dimension, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func heightToWidth(of view: Constrainable, multiplier: CGFloat = 1, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: heightAnchor)
        }
        
        return heightToWidth(of: view, multiplier: multiplier, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func height(min: CGFloat? = nil, max: CGFloat? = nil, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraints {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: heightAnchor)
        }
        
        return self.height(min: min, max: max, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func aspectRatio(_ ratio: CGFloat, relation: ConstraintRelation = .equal, priotity: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        return widthToHeight(of: self, multiplier: ratio, offset: 0, relation: relation, priority: priotity, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func leadingToTrailing(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        prepareForLayout()
        return leading(to: view, view.trailingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func leading(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: leadingAnchor, to: view, withAnchor: view.leadingAnchor)
        }
        
        return leading(to: view, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func leftToRight(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        prepareForLayout()
        return left(to: view, view.rightAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func left(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: leftAnchor, to: view, withAnchor: anchor ?? view.leftAnchor)
        }
        
        return left(to: view, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func trailingToLeading(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        return trailing(to: view, view.leadingAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func trailing(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: trailingAnchor, to: view, withAnchor: anchor ?? view.trailingAnchor)
        }
        
        return trailing(to: view, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func rightToLeft(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        return right(to: view, view.leftAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func right(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: rightAnchor, to: view, withAnchor: anchor ?? view.rightAnchor)
        }
        
        return right(to: view, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func topToBottom(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        return top(to: view, view.bottomAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func top(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: topAnchor, to: view, withAnchor: anchor ?? view.topAnchor)
        }
        
        return top(to: view, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func bottomToTop(of view: Constrainable, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        return bottom(to: view, view.topAnchor, offset: offset, relation: relation, priority: priority, isActive: isActive, shouldOverride: shouldOverride)
    }

    @discardableResult
    public func bottom(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: bottomAnchor, to: view, withAnchor: anchor ?? view.bottomAnchor)
        }
        
        return bottom(to: view, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func centerX(to view: Constrainable, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: centerXAnchor, to: view, withAnchor: anchor ?? view.centerXAnchor)
        }
        
        return centerX(to: view, anchor, offset: offset, priority: priority, isActive: isActive)
    }

    @discardableResult
    public func centerY(to view: Constrainable, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: LayoutPriority = .required, isActive: Bool = true, shouldOverride: Bool = false) -> Constraint {
        if shouldOverride {
            excludeConstraintIfExists(withAnchor: centerYAnchor, to: view, withAnchor: anchor ?? view.centerYAnchor)
        }
        
        return centerY(to: view, anchor, offset: offset, priority: priority, isActive: isActive)
    }

}
