
import UIKit

class Container: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .rgb(240, 250, 255)
        layer.cornerRadius = 20
        clipsToBounds = true
    }
}
