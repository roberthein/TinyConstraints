//
//  PageIndicator.swift
//  TinyConstraints
//
//  Created by Katie Bogdanska on 05/02/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class PageIndicator: UIView {
    
    var count: Int = 0
    var indicatorViews: [UIView] = []
    
    convenience init(count: Int) {
        self.init()
        self.count = count
        
        var previous: UIView?
        var offset: CGFloat = 0
        
        for i in 0..<count {
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .rgb(240, 240, 240)
            view.clipsToBounds = true
            view.layer.cornerRadius = 5
            addSubview(view)
            
            view.size(CGSize(width: 10, height: 10))
            view.top(to: self)
            view.left(to: previous ?? self, previous?.rightAnchor ?? self.leftAnchor, offset: offset)
            view.bottom(to: self)
            
            if i == count - 1 {
                view.right(to: self)
            }
            
            offset = 5
            indicatorViews.append(view)
            previous = view
        }
    }
    
    var selected: Int = 0 {
        didSet {
            indicatorViews.forEach { $0.backgroundColor = .rgb(240, 240, 240) }
            indicatorViews[safe: selected]?.backgroundColor = UIColor.gradient[safe: 3]
        }
    }
}
