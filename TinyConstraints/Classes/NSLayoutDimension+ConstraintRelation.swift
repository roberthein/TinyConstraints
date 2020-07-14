//
//  NSLayoutDimension+ConstraintRelation.swift
//  TinyConstraints
//
//  Created by Joan Disho on 16.10.19.
//  Copyright © 2019 Robert-Hein Hooijmans. All rights reserved.
//

import Foundation

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

internal extension NSLayoutDimension {
    func constraint(to dimension: NSLayoutDimension, multiplier: CGFloat, offset: CGFloat, relation: ConstraintRelation) -> NSLayoutConstraint {
        switch relation {
        case .equal: return constraint(equalTo: dimension, multiplier: multiplier, constant: offset)
        case .equalOrLess: return constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: offset)
        case .equalOrGreater: return constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier, constant: offset)
        }
    }

    func constraint(toConstant constant: CGFloat, relation: ConstraintRelation) -> NSLayoutConstraint {
        switch relation {
        case .equal: return constraint(equalToConstant: constant)
        case .equalOrLess: return constraint(lessThanOrEqualToConstant: constant)
        case .equalOrGreater: return constraint(greaterThanOrEqualToConstant: constant)
        }
    }
}
