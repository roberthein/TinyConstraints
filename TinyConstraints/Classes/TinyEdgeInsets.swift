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

extension TinyEdgeInsets {
    
    public static func uniform(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    public static func top(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }
    
    public static func left(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: 0, left: value, bottom: 0, right: 0)
    }
    
    public static func bottom(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
    }
    
    public static func right(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: 0, left: 0, bottom: 0, right: value)
    }
    
    public static func horizontal(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: 0, left: value, bottom: 0, right: value)
    }
    
    public static func vertical(_ value: CGFloat) -> TinyEdgeInsets {
        return TinyEdgeInsets(top: value, left: 0, bottom: value, right: 0)
    }
}

public func + (lhs: TinyEdgeInsets, rhs: TinyEdgeInsets) -> TinyEdgeInsets {
    return .init(top: lhs.top + rhs.top, left: lhs.left + rhs.left, bottom: lhs.bottom + rhs.bottom, right: lhs.right + rhs.right)
}
