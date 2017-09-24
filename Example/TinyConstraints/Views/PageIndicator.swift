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
        
        (0..<count).forEach { _ in
            indicatorViews.append({
                let view = UIView()
                view.backgroundColor = .rgb(240, 240, 240)
                view.clipsToBounds = true
                view.layer.cornerRadius = 10
                return view
                }()
            )
        }
        
        stack(indicatorViews, axis: .horizontal, width: 20, height: 20, spacing: 10)
    }
    
    var selected: Int = 0 {
        didSet {
            indicatorViews.forEach { $0.backgroundColor = .rgb(240, 240, 240) }
            indicatorViews[safe: selected]?.backgroundColor = UIColor.gradient[safe: selected]
        }
    }
}
