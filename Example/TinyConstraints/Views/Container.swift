
import UIKit

class Container: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .rgb(240, 240, 240)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
