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

public extension LayoutAnchorProvider {
    
    @discardableResult
    public func center(in anchorProvider: LayoutAnchorProvider, offset: CGPoint = .zero, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
        let constraints = [
            centerXAnchor.constraint(equalTo: anchorProvider.centerXAnchor, constant: offset.x).with(priority),
            centerYAnchor.constraint(equalTo: anchorProvider.centerYAnchor, constant: offset.y).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func edges(to anchorProvider: LayoutAnchorProvider, insets: UIEdgeInsets = .zero, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraints {
        let constraints = [
            topAnchor.constraint(equalTo: anchorProvider.topAnchor, constant: insets.top).with(priority),
            leadingAnchor.constraint(equalTo: anchorProvider.leadingAnchor, constant: insets.left).with(priority),
            bottomAnchor.constraint(equalTo: anchorProvider.bottomAnchor, constant: insets.bottom).with(priority),
            trailingAnchor.constraint(equalTo: anchorProvider.trailingAnchor, constant: insets.right).with(priority)
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
    public func width(to anchorProvider: LayoutAnchorProvider, _ dimension: NSLayoutDimension? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = widthAnchor.constraint(equalTo: dimension ?? anchorProvider.widthAnchor, constant: offset).with(priority)
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
    public func height(to anchorProvider: LayoutAnchorProvider, _ dimension: NSLayoutDimension? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = heightAnchor.constraint(equalTo: dimension ?? anchorProvider.heightAnchor, constant: offset).with(priority)
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
    public func leading(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = leadingAnchor.constraint(equalTo: anchor ?? anchorProvider.leadingAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func left(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = leftAnchor.constraint(equalTo: anchor ?? anchorProvider.leftAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func trailing(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = trailingAnchor.constraint(equalTo: anchor ?? anchorProvider.trailingAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func right(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = rightAnchor.constraint(equalTo: anchor ?? anchorProvider.rightAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func top(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = topAnchor.constraint(equalTo: anchor ?? anchorProvider.topAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(equalTo: anchor ?? anchorProvider.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(lessThan anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor ?? anchorProvider.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(greaterThan anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor ?? anchorProvider.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerX(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = centerXAnchor.constraint(equalTo: anchor ?? anchorProvider.centerXAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func centerY(to anchorProvider: LayoutAnchorProvider, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority = UILayoutPriorityDefaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = centerYAnchor.constraint(equalTo: anchor ?? anchorProvider.centerYAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
}
