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

public extension UIView {
    
    @discardableResult
    public func center(in view: UIView, offset: CGPoint = .zero, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
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
    public func edges(to view: UIView, insets: UIEdgeInsets = .zero, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
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
    public func size(_ size: CGSize, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
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
    public func width(_ width: CGFloat, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = widthAnchor.constraint(equalToConstant: width).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func width(of view: UIView, _ dimension: NSLayoutDimension? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = widthAnchor.constraint(equalTo: dimension ?? view.widthAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func width(min: CGFloat? = nil, max: CGFloat? = nil, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
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
    public func height(_ height: CGFloat, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = heightAnchor.constraint(equalToConstant: height).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func height(of view: UIView, _ dimension: NSLayoutDimension? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = heightAnchor.constraint(equalTo: dimension ?? view.heightAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func height(min: CGFloat? = nil, max: CGFloat? = nil, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
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
    public func leading(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = leadingAnchor.constraint(equalTo: anchor ?? view.leadingAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func left(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = leftAnchor.constraint(equalTo: anchor ?? view.leftAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func trailing(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = trailingAnchor.constraint(equalTo: anchor ?? view.trailingAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func right(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = rightAnchor.constraint(equalTo: anchor ?? view.rightAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func top(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = topAnchor.constraint(equalTo: anchor ?? view.topAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(equalTo: anchor ?? view.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(lessThan view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(greaterThan view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor ?? view.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerX(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = centerXAnchor.constraint(equalTo: anchor ?? view.centerXAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerY(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = centerYAnchor.constraint(equalTo: anchor ?? view.centerYAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
}
