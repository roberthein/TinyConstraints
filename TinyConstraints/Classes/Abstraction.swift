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

import Foundation

#if os(OSX)
    import AppKit
    
    public typealias TinyView = NSView
    public typealias LayoutGuide = NSLayoutGuide
    public typealias ConstraintAxis = NSLayoutConstraint.Orientation
    public typealias LayoutPriority = NSLayoutConstraint.Priority
    public typealias TinyEdgeInsets = NSEdgeInsets
    
    public extension NSEdgeInsets {
        static var zero = NSEdgeInsetsZero
    }
#else
    import UIKit
    
    public typealias TinyView = UIView
    public typealias LayoutGuide = UILayoutGuide
    public typealias ConstraintAxis = NSLayoutConstraint.Axis
    public typealias LayoutPriority = UILayoutPriority
    
    public typealias TinyEdgeInsets = UIEdgeInsets
#endif
