//
//  NSLayoutAxisAnchor+ConstraintRelation.swift
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

internal extension NSLayoutXAxisAnchor {

    func constraint(
        to anchor: NSLayoutXAxisAnchor,
        relation: ConstraintRelation
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor)
        case .equalOrLess:
            return constraint(lessThanOrEqualTo: anchor)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualTo: anchor)
        }
    }
}

internal extension NSLayoutYAxisAnchor {

    func constraint(
        to anchor: NSLayoutYAxisAnchor,
        relation: ConstraintRelation
        ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor)
        case .equalOrLess:
            return constraint(lessThanOrEqualTo: anchor)
        case .equalOrGreater:
            return constraint(greaterThanOrEqualTo: anchor)
        }
    }
}
