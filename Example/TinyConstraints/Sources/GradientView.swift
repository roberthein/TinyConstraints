import UIKit

class GradientView: UIView {
    
    open var colors: [UIColor]? {
        didSet {
            updateGradient()
        }
    }
    
    open var locations: [CGFloat]? {
        didSet {
            updateGradient()
        }
    }
    
    override open func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let size = bounds.size
        
        if let gradient = gradient {
            let options: CGGradientDrawingOptions = [.drawsAfterEndLocation]
            
            let startPoint = CGPoint.zero
            let endPoint = CGPoint(x: size.width, y: 0)
            context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: options)
        }
    }
    
    override open func didMoveToWindow() {
        super.didMoveToWindow()
        contentMode = .redraw
    }
    
    fileprivate var gradient: CGGradient?
    
    fileprivate func updateGradient() {
        gradient = nil
        setNeedsDisplay()
        
        if let colors = colors {
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colorSpaceModel = colorSpace.model
            
            let gradientColors = colors.map { (color: UIColor) -> AnyObject in
                let cgColor = color.cgColor
                let cgColorSpace = cgColor.colorSpace ?? colorSpace
                
                if cgColorSpace.model == colorSpaceModel {
                    return cgColor as AnyObject
                }
                
                var red: CGFloat = 0
                var blue: CGFloat = 0
                var green: CGFloat = 0
                var alpha: CGFloat = 0
                color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                return UIColor(red: red, green: green, blue: blue, alpha: alpha).cgColor as AnyObject
                } as NSArray
            
            gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: locations)
        }
    }
}
