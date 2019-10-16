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

    func constraint(
        to dimension: NSLayoutDimension,
        multiplier: CGFloat,
        relation: ConstraintRelation = .equal
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: dimension, multiplier: multiplier)
        case .equalOrLess:
            return constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
        }
    }

    func constraint(
        toConstant constant: CGFloat,
        relation: ConstraintRelation = .equal
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalToConstant: constant)
        case .equalOrLess:
            return constraint(lessThanOrEqualToConstant: constant)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualToConstant: constant)
        }
    }
}



