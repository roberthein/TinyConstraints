//
//  Stack.swift
//  Pods
//
//  Created by Katie Bogdanska on 06/02/17.
//
//

import UIKit

public enum StackDirection {
    case topToBottom
    case leftToRight
}

public extension UIView {
    
    @discardableResult
    public func stack(views: [UIView], direction: StackDirection = .topToBottom, width: CGFloat? = nil, height: CGFloat? = nil, spacing: CGFloat = 0) -> Constraints {
        
        switch direction {
        case .topToBottom: return stackTopToBottom(views: views, width: width, height: height, spacing: spacing)
        case .leftToRight: return stackLeftToRight(views: views, width: width, height: height, spacing: spacing)
        }
    }
    
    fileprivate func stackTopToBottom(views: [UIView], width: CGFloat? = nil, height: CGFloat? = nil, spacing: CGFloat = 0) -> Constraints {
        
        var offset: CGFloat = 0
        var previous: UIView?
        var constraints: Constraints = []
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            
            constraints.append(view.top(to: previous ?? self, previous?.bottomAnchor ?? topAnchor, offset: offset))
            constraints.append(view.left(to: self))
            constraints.append(view.right(to: self))
            
            if let width = width {
                constraints.append(view.width(width))
            }
            
            if let height = height {
                constraints.append(view.height(height))
            }
            
            offset = spacing
            previous = view
        }
        
        if let bottom = previous?.bottom(to: self) {
            constraints.append(bottom)
        }
        
        return constraints
    }
    
    fileprivate func stackLeftToRight(views: [UIView], width: CGFloat? = nil, height: CGFloat? = nil, spacing: CGFloat = 0) -> Constraints {
        
        var offset: CGFloat = 0
        var previous: UIView?
        var constraints: Constraints = []
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            
            constraints.append(view.top(to: self))
            constraints.append(view.bottom(to: self))
            constraints.append(view.left(to: previous ?? self, previous?.rightAnchor ?? leftAnchor, offset: offset))
            
            if let width = width {
                constraints.append(view.width(width))
            }
            
            if let height = height {
                constraints.append(view.height(height))
            }
            
            offset = spacing
            previous = view
        }
        
        if let right = previous?.right(to: self) {
            constraints.append(right)
        }
        
        return constraints
    }
}
