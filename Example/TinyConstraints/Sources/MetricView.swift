import Foundation
import UIKit
import TinyConstraints

class MetricView: UIView {
    
    var arrowColor: UIColor = .white {
        didSet {
            subviews.forEach {
                $0.tintColor = arrowColor
                $0.layer.sublayers?.compactMap { $0 as? CAShapeLayer }.forEach {
                    $0.strokeColor = arrowColor.cgColor
                }
            }
            label.textColor = arrowColor
            setNeedsDisplay()
        }
    }
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.textColor = arrowColor
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return view
    }()
    
    let imageSize = CGSize(width: 8, height: 10)
    
    required init() {
        super.init(frame: .zero)
        
        let rightArrow = UIImageView(image: UIImage(named: "arrow_right")?.withRenderingMode(.alwaysTemplate))
        rightArrow.tintColor = arrowColor
        
        let leftArrow = UIImageView(image: UIImage(named: "arrow_left")?.withRenderingMode(.alwaysTemplate))
        leftArrow.tintColor = arrowColor
        
        let lineLeft = UIView()
        lineLeft.layer.drawLine(from: CGPoint(x: 0, y: imageSize.height / 2), to: CGPoint(x: 2000, y: imageSize.height / 2), color: arrowColor, dashed: true)
        lineLeft.clipsToBounds = true
        
        let lineRight = UIView()
        lineRight.layer.drawLine(from: CGPoint(x: 0, y: imageSize.height / 2), to: CGPoint(x: 2000, y: imageSize.height / 2), color: arrowColor, dashed: true)
        lineRight.clipsToBounds = true
        
        addSubview(rightArrow)
        addSubview(leftArrow)
        
        addSubview(lineLeft)
        addSubview(lineRight)
        addSubview(label)
        
        rightArrow.size(imageSize)
        rightArrow.rightToSuperview(offset: -2)
        rightArrow.centerYToSuperview()
        
        leftArrow.size(imageSize)
        leftArrow.leftToSuperview(offset: 2)
        leftArrow.centerYToSuperview()
        
        lineLeft.leftToRight(of: leftArrow)
        lineLeft.rightToLeft(of: label, offset: -2)
        lineLeft.height(imageSize.height)
        lineLeft.centerYToSuperview()
        
        lineRight.leftToRight(of: label, offset: 2)
        lineRight.rightToLeft(of: rightArrow)
        lineRight.height(imageSize.height)
        lineRight.centerYToSuperview()
        
        label.topToSuperview()
        label.bottomToSuperview()
        label.centerXToSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
