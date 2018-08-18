import Foundation
import UIKit

extension UIColor {
    
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var gradient: [UIColor] {
        return [.rgb(71, 111, 241), .rgb(31, 187, 225), .rgb(6, 236, 193)]
    }
}

enum Example {
    case basic
    case advanced
    case collections
    
    func view() -> UIView {
        switch self {
        case .basic: return Basic()
        case .advanced: return Advanced()
        case .collections: return Collections()
        }
    }
}

extension Collection {
    
    subscript (safe index: Index) -> Iterator.Element? {
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}

protocol EnumCollection: Hashable {
    static var allCases: [Self] { get }
}

extension EnumCollection {
    
    static func cases() -> AnySequence<Self> {
        typealias S = Self
        return AnySequence { () -> AnyIterator<S> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
    
    static var allCases: [Self] {
        return Array(cases())
    }
}

extension CALayer {
    
    func drawLine(from start: CGPoint, to end: CGPoint, color: UIColor, dashed: Bool = false) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let line = CAShapeLayer()
        line.path = path.cgPath
        line.fillColor = nil
        line.opacity = 1.0
        line.strokeColor = color.cgColor
        line.lineCap = kCALineCapRound
        line.lineWidth = 4
        
        if dashed {
            line.lineDashPattern = [0, 10]
        }
        
        addSublayer(line)
    }
}
