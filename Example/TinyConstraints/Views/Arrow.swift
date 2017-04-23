
import TinyConstraints

enum Orientation {
    case horizontal
    case vertical
    case diagonal
}

class Arrow: UIView {
    
    var orientation: Orientation!
    
    var size: CGSize {
        guard let orientation = orientation else { return .zero }
        
        switch orientation {
        case .horizontal: return CGSize(width: 5, height: 15)
        case .vertical: return CGSize(width: 15, height: 5)
        case .diagonal: return CGSize(width: 15, height: 15)
        }
    }
    
    convenience init(for orientation: Orientation) {
        self.init()
        self.orientation = orientation
        
        switch orientation {
        case .horizontal:
            let up = UIView()
            up.layer.drawLine(from: CGPoint(x: size.width, y: size.height), to: CGPoint(x: 0, y: size.height / 2), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.width, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.height, y: size.height / 2), color: .white)
            addSubview(up)
            
            up.size(size)
            up.top(to: self)
            up.left(to: self)
            up.bottom(to: self)
            
            let down = UIView()
            down.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width, y: size.height / 2), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height / 2), to: CGPoint(x: 0, y: 0), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height / 2), to: CGPoint(x: -size.height + 5, y: size.height / 2), color: .white)
            addSubview(down)
            
            down.size(size)
            down.top(to: self)
            down.right(to: self)
            down.bottom(to: self)
            
            let line = UIView()
            line.layer.drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: 320, y: size.height / 2), color: .white, dashed: true)
            line.clipsToBounds = true
            addSubview(line)
            
            line.leftToRight(of: up)
            line.height(size.height)
            line.centerY(to: self)
            line.rightToLeft(of: down)
        case .vertical:
            let up = UIView()
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width / 2, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width, y: size.height), color: .white)
            up.layer.drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: size.width), color: .white)
            addSubview(up)
            
            up.size(size)
            up.top(to: self)
            up.left(to: self)
            up.right(to: self)
            
            let down = UIView()
            down.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width / 2, y: size.height), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width / 2, y: size.height), to: CGPoint(x: size.width, y: 0), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width / 2, y: size.height), to: CGPoint(x: size.width / 2, y: -size.width + 5), color: .white)
            addSubview(down)
            
            down.size(size)
            down.bottom(to: self)
            down.left(to: self)
            down.right(to: self)
            
            let line = UIView()
            line.layer.drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: 300), color: .white, dashed: true)
            line.clipsToBounds = true
            addSubview(line)
            
            line.topToBottom(of: up)
            line.width(size.width)
            line.centerX(to: self)
            line.bottomToTop(of: down)
        case .diagonal:
            let up = UIView()
            up.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: 0, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width, y: 0), color: .white)
            up.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: size.width, y: size.height), color: .white)
            addSubview(up)
            
            up.size(size)
            up.origin(to: self)
            
            let down = UIView()
            down.layer.drawLine(from: CGPoint(x: 0, y: size.height), to: CGPoint(x: size.width, y: size.height), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height), to: CGPoint(x: size.width, y: 0), color: .white)
            down.layer.drawLine(from: CGPoint(x: size.width, y: size.height), to: CGPoint(x: 0, y: 0), color: .white)
            addSubview(down)
            
            down.size(size)
            down.bottom(to: self)
            down.right(to: self)
            
            let line = UIView()
            line.layer.drawLine(from: CGPoint(x: 0, y: 0), to: CGPoint(x: 300, y: 300), color: .white, dashed: true)
            line.clipsToBounds = true
            addSubview(line)
            
            line.top(to: self, offset: size.height)
            line.left(to: self, offset: size.width)
            line.bottom(to: self, offset: -size.height)
            line.right(to: self, offset: -size.width)
        }
    }
}
