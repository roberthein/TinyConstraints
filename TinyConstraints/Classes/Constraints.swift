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
#else
    import UIKit
#endif

public typealias Constraint = NSLayoutConstraint
public typealias Constraints = [Constraint]

public enum ConstraintRelation: Int {
    case equal = 0
    case equalOrLess = -1
    case equalOrGreater = 1
}

public extension Constraint {
    func activate() {
        Constraint.activate([self])
    }

    func deActivate() {
        Constraint.deactivate([self])
    }
}

public extension Collection where Iterator.Element == Constraint {
    
    func activate() {
        
        if let constraints = self as? Constraints {
            Constraint.activate(constraints)
        }
    }
    
    func deActivate() {
        
        if let constraints = self as? Constraints {
            Constraint.deactivate(constraints)
        }
    }
}

#if os(OSX)
public extension Constraint {
    @objc
    func with(_ p: Constraint.Priority) -> Self {
        priority = p
        return self
    }

    func set(_ active: Bool) -> Self {
        isActive = active
        return self
    }
}
#else
    public extension Constraint {
        @objc
        func with(_ p: LayoutPriority) -> Self {
            priority = p
            return self
        }
        
        func set(_ active: Bool) -> Self {
            isActive = active
            return self
        }
}
#endif

