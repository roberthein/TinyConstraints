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

public extension View {
    
    @discardableResult
    public func stack(_ views: [View], axis: ConstraintAxis = .vertical, width: CGFloat? = nil, height: CGFloat? = nil, spacing: CGFloat = 0) -> Constraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var offset: CGFloat = 0
        var previous: View?
        var constraints: Constraints = []
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            
            switch axis {
            case .vertical:
                constraints.append(view.top(to: previous ?? self, previous?.bottomAnchor ?? topAnchor, offset: offset))
                constraints.append(view.left(to: self))
                constraints.append(view.right(to: self))
                
                if let lastView = views.last, view == lastView {
                    constraints.append(view.bottom(to: self))
                }
            case .horizontal:
                constraints.append(view.top(to: self))
                constraints.append(view.bottom(to: self))
                constraints.append(view.left(to: previous ?? self, previous?.rightAnchor ?? leftAnchor, offset: offset))
                
                if let lastView = views.last, view == lastView {
                    constraints.append(view.right(to: self))
                }
            }
            
            if let width = width {
                constraints.append(view.width(width))
            }
            
            if let height = height {
                constraints.append(view.height(height))
            }
			
            offset = spacing
            previous = view
        }
        
        return constraints
    }
}
