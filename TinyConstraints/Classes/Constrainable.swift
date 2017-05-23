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

#if os(OSX)
    import AppKit
    
    extension View: Constrainable {
        
        public func prepareForLayoutIfNeeded() {
            
            translatesAutoresizingMaskIntoConstraints = false
        }

    }
#else
    import UIKit
    
    extension View: Constrainable {
        
        public func prepareForLayoutIfNeeded() {
            
            translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
#endif

extension View {
    
    func addAsSubview(withEdges directions: [ConstraintDirection], to view: Constrainable) {
        guard let view = view as? View else {return}
        view.addSubview(self)
        edges(directions, to: view)
    }
    
    func addAsSubviewWitEdges(to view: Constrainable) {
        addAsSubview(withEdges: [.top, .bottom, .leading, .trailing], to: view)
    }
    
    func insertAsSubview(withEdges directions: [ConstraintDirection], to view: Constrainable,  at index: Int) {
        guard let view = view as? View else {return}
        view.insertSubview(self, at: index)
        edges(directions, to: view)
    }
    
    func insertAsSubviewWithEdges(to view: Constrainable, at index: Int) {
        insertAsSubview(withEdges: [.top, .bottom, .leading, .trailing], to: view, at: index)
    }
    
    func insertAsSubview(withEdges directions: [ConstraintDirection], to view: Constrainable,  belowSubview subview: View) {
        guard let view = view as? View else {return}
        view.insertSubview(self, belowSubview: subview)
        edges(directions, to: view)
    }
    
    func insertAsSubviewWithEdges(to view: Constrainable, belowSubview subview: View) {
        insertAsSubview(withEdges: [.top, .bottom, .leading, .trailing], to: view, belowSubview: subview)
    }
    
    func insertAsSubview(withEdges directions: [ConstraintDirection], to view: Constrainable,  aboveSubview subview: View) {
        guard let view = view as? View else {return}
        view.insertSubview(self, aboveSubview: subview)
        edges(directions, to: view)
    }
    
    func insertAsSubviewWithEdges(to view: Constrainable, aboveSubview subview: View) {
        insertAsSubview(withEdges: [.top, .bottom, .leading, .trailing], to: view, aboveSubview: subview)
    }
    
    
    func addSubview(withEdges directions: [ConstraintDirection], view: Constrainable) {
        guard let view = view as? UIView else {return}
        addSubview(view)
        view.edges(directions, to: self)
    }
    
    func addSubviewWithEdges(_ view: Constrainable) {
        addSubview(withEdges: [.top, .bottom, .leading, .trailing], view: view)
    }
    
    func insertSubview(withEdges directions: [ConstraintDirection], view: Constrainable, at index: Int) {
        guard let view = view as? UIView else {return}
        insertSubview(view, at: index)
        view.edges(directions, to: self)
    }
    
    func insertSubviewWithEdges(_ view: Constrainable, at index: Int) {
        insertSubview(withEdges: [.top, .bottom, .leading, .trailing], view: view, at: index)
    }
    
    func insertSubview(withEdges directions: [ConstraintDirection], view: Constrainable,  belowSubview subview: UIView) {
        guard let view = view as? UIView else {return}
        insertSubview(view, belowSubview: subview)
        edges(directions, to: view)
    }
    
    func insertSubviewWithEdges(_ view: Constrainable, belowSubview subview: UIView) {
        insertSubview(withEdges: [.top, .bottom, .leading, .trailing], view: view, belowSubview: subview)
    }
    
    func insertSubview(withEdges directions: [ConstraintDirection], view: Constrainable,  aboveSubview subview: UIView) {
        guard let view = view as? UIView else {return}
        insertSubview(view, aboveSubview: subview)
        edges(directions, to: view)
    }
    
    func insertSubviewWithEdges(_ view: Constrainable, aboveSubview subview: UIView) {
        insertSubview(withEdges: [.top, .bottom, .leading, .trailing], view: view, aboveSubview: subview)
    }
}


extension LayoutGuide: Constrainable {
    public func prepareForLayoutIfNeeded() {}
}

public protocol Constrainable {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    
    func prepareForLayoutIfNeeded()
}
