import Foundation
import UIKit

class PageIndicator: UIView {
    
    private let count: Int
    private var indicatorViews: [UIView] = []
    
    var selected: Int = 0 {
        didSet {
            indicatorViews.forEach { $0.backgroundColor = .rgb(240, 240, 240) }
            indicatorViews[safe: selected]?.backgroundColor = UIColor.gradient[safe: selected]
        }
    }
    
    required init(count: Int) {
        self.count = count
        super.init(frame: .zero)
        
        (0 ..< count).forEach { _ in
            let view = UIView()
            view.backgroundColor = .rgb(240, 240, 240)
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            
            indicatorViews.append(view)
        }
        
        stack(indicatorViews, axis: .horizontal, width: 20, height: 20, spacing: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
