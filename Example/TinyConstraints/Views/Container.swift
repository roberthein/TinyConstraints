
import UIKit

class Container: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .rgb(240, 240, 240)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
