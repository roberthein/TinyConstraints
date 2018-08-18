import Foundation
import UIKit
import TinyConstraints

enum Orientation {
    case horizontal
    case vertical
    case diagonal
}

class Arrow: UIView {
    
    private var orientation: Orientation!
    
    var size: CGSize {
        guard let orientation = orientation else {
            return .zero
        }
        
        switch orientation {
        case .horizontal: return CGSize(width: 5, height: 15)
        case .vertical: return CGSize(width: 15, height: 5)
        case .diagonal: return CGSize(width: 15, height: 15)
        }
    }
    
    required init(for orientation: Orientation) {
        self.orientation = orientation
        super.init(frame: .zero)
        
        switch orientation {
        case .horizontal:
            let up = UIView()
            up.layer.drawLine(from: CGPoint(x: size.width, y: size.height), to: CGPoint(x: 0, y: size.height / 2), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.width, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.height, y: size.height / 2), color: .white)
            
            let down = UIView()
            down.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width, y: size.height / 2), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height / 2), to: CGPoint(x: 0, y: 0), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height / 2), to: CGPoint(x: -size.height + 5, y: size.height / 2), color: .white)
            
            let line = UIView()
            line.layer.drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: 320, y: size.height / 2), color: .white, dashed: true)
            line.clipsToBounds = true
            
            addSubview(up)
            addSubview(down)
            addSubview(line)
            
            up.size(size)
            up.edgesToSuperview(excluding: .right)
            
            down.size(size)
            down.edgesToSuperview(excluding: .left)
            
            line.leftToRight(of: up)
            line.height(size.height)
            line.centerYToSuperview()
            line.rightToLeft(of: down)
        case .vertical:
            let up = UIView()
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width / 2, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width, y: size.height), color: .white)
            up.layer.drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: size.width), color: .white)
            
            let down = UIView()
            down.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width / 2, y: size.height), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width / 2, y: size.height), to: CGPoint(x: size.width, y: 0), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width / 2, y: size.height), to: CGPoint(x: size.width / 2, y: -size.width + 5), color: .white)
            
            let line = UIView()
            line.layer.drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: 300), color: .white, dashed: true)
            line.clipsToBounds = true
            
            addSubview(up)
            addSubview(down)
            addSubview(line)
            
            up.size(size)
            up.edgesToSuperview(excluding: .bottom)
            
            down.size(size)
            down.edgesToSuperview(excluding: .top)
            
            line.topToBottom(of: up)
            line.width(size.width)
            line.centerXToSuperview()
            line.bottomToTop(of: down)
        case .diagonal:
            let up = UIView()
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: 0, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width, y: size.height), color: .white)
            
            let down = UIView()
            down.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width, y: size.height), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height), to: CGPoint(x: size.width, y: 0), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height), to: CGPoint(x: 0, y: 0), color: .white)
            
            let line = UIView()
            line.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: 300, y: 300), color: .white, dashed: true)
            line.clipsToBounds = true
            
            addSubview(up)
            addSubview(down)
            addSubview(line)
            
            up.size(size)
            up.originToSuperview()
            
            down.size(size)
            down.bottomToSuperview()
            down.rightToSuperview()
            
            line.edgesToSuperview(insets: .horizontal(size.width) + .vertical(size.height))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
