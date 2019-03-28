import Foundation
import UIKit

extension String {
    
    static func valueString(for value: CGFloat) -> String {
        return String(format: "%.0f", ceil(value))
    }
}

public extension UIColor {
    
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    class var tinyBlue: UIColor {
        return .rgb(1, 120, 255)
    }
    
    class var tinyGreen: UIColor {
        return .rgb(1, 246, 187)
    }
    
    class func blend(ratio: CGFloat) -> UIColor {
        let first: UIColor = .tinyBlue
        let second: UIColor = .tinyGreen
        
        func blendComponent(from firstValue: CGFloat, to secondValue: CGFloat) -> CGFloat {
            let diff = secondValue - firstValue
            return diff * ratio + firstValue
        }
        
        let firstCIColor = CIColor(color: first)
        let secondCIColor = CIColor(color: second)
        
        let red = blendComponent(from: firstCIColor.red, to: secondCIColor.red)
        let green = blendComponent(from: firstCIColor.green, to: secondCIColor.green)
        let blue = blendComponent(from: firstCIColor.blue, to: secondCIColor.blue)
        let alpha = blendComponent(from: firstCIColor.alpha, to: secondCIColor.alpha)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

public extension CGFloat {
    
    func map(from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        return ((self - from.lowerBound) / (from.upperBound - from.lowerBound)) * (to.upperBound - to.lowerBound) + to.lowerBound
    }
}

public extension CaseIterable where Self: Equatable {
    
    func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
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
        line.strokeColor = color.cgColor
        line.lineCap = .round
        line.lineJoin = .round
        line.lineWidth = 4
        
        if dashed {
            line.lineDashPattern = [0, 10]
        }
        
        addSublayer(line)
    }
}
