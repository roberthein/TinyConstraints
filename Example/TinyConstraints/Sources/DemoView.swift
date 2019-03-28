import Foundation
import UIKit
import TinyConstraints

class DemoView: GradientView {
    
    lazy var displayLink = CADisplayLink(target: self, selector: #selector(update(_:)))
    
    lazy var widthMetricView = MetricView()
    
    lazy var overlay: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    required init() {
        super.init(frame: .zero)
        
        locations = [0, 1]
        colors = [.tinyBlue, .tinyBlue]
        widthMetricView.arrowColor = .white
        
        clipsToBounds = true
        layer.cornerRadius = 5
        
        addSubview(overlay)
        addSubview(widthMetricView)
        
        overlay.edgesToSuperview(insets: .uniform(3))
        
        widthMetricView.leftToSuperview()
        widthMetricView.rightToSuperview()
        widthMetricView.centerYToSuperview()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        displayLink.add(to: .current, forMode: .common)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func update(_ displayLink: CADisplayLink) {
        let presentation = layer.presentation()!
        
        widthMetricView.label.text = .valueString(for: presentation.frame.width)
        
        let layoutMargin: CGFloat = 20

        let safeArea = superview!.safeAreaInsets
        let leftPosition = layoutMargin + safeArea.left
        let rightPosition = UIScreen.main.bounds.width - ((layoutMargin * 2) + safeArea.left + safeArea.right)

        colors = [
            .blend(ratio: presentation.frame.minX.map(from: leftPosition ... rightPosition, to: 0 ... 1)),
            .blend(ratio: presentation.frame.maxX.map(from: leftPosition ... rightPosition, to: 0 ... 1))
        ]
    }
}
