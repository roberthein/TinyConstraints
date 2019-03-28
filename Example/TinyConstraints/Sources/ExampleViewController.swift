import Foundation
import UIKit
import TinyConstraints

class ExampleViewController: UIViewController {
    
    enum LinearType: CaseIterable {
        case horizontal
        case vertical
        case recursive
    }
    
    var type: LinearType = .horizontal {
        didSet {
            [verticalConstraints,
             horizontalConstraints,
             recursiveConstraints].compactMap { $0 }.forEach { $0.deActivate() }
            
            switch type {
            case .horizontal:
                horizontalConstraints?.activate()
            case .vertical:
                verticalConstraints?.activate()
            case .recursive:
                recursiveConstraints?.activate()
            }
            UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    let layoutMargin: CGFloat = 20
    lazy var layoutGuide = UILayoutGuide()
    
    lazy var demoView1 = DemoView()
    lazy var demoView2 = DemoView()
    lazy var demoView3 = DemoView()
    lazy var demoView4 = DemoView()
    
    var demoViews: [DemoView] {
        return [
            demoView1,
            demoView2,
            demoView3,
            demoView4,
        ]
    }
    
    var horizontalConstraints: [Constraint]?
    var verticalConstraints: [Constraint]?
    var recursiveConstraints: [Constraint]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addLayoutGuide(layoutGuide)
        
        demoViews.forEach { demoView in
            view.addSubview(demoView)
        }
        
        horizontalConstraints = createHorizontalConstraints()
        horizontalConstraints?.activate()
        verticalConstraints = createVerticalConstraints()
        recursiveConstraints = createRecursiveConstraints()
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            self.type = self.type.next()
        }
    }
    
    func createHorizontalConstraints() -> Constraints {
        var constraints = Constraints()
        var previous: Constrainable = layoutGuide
        let offset: CGFloat = 4
        
        constraints.append(layoutGuide.left(to: view.safeAreaLayoutGuide, offset: layoutMargin, isActive: false))
        constraints.append(layoutGuide.right(to: view.safeAreaLayoutGuide, offset: -layoutMargin, isActive: false))
        constraints.append(layoutGuide.centerY(to: view.safeAreaLayoutGuide, isActive: false))
        
        demoViews.enumerated().forEach { i, demoView in
            if i == 0 {
                constraints.append(demoView.left(to: previous, isActive: false))
            } else {
                constraints.append(demoView.leftToRight(of: previous, offset: offset, isActive: false))
                constraints.append(demoView.width(to: previous, isActive: false))
            }
            
            constraints.append(demoView.top(to: layoutGuide, isActive: false))
            constraints.append(demoView.bottom(to: layoutGuide, isActive: false))
            constraints.append(demoView.heightToWidth(of: demoView, isActive: false))
            
            if i == demoViews.count - 1 {
                constraints.append(demoView.right(to: layoutGuide, isActive: false))
            }
            
            previous = demoView
        }
        
        return constraints
    }
    
    func createVerticalConstraints() -> Constraints {
        let width: CGFloat = 75
        let offset: CGFloat = 4
        
        var constraints: Constraints = [
            demoView1.topToBottom(of: demoView2, offset: offset, isActive: false),
            demoView1.left(to: layoutGuide, isActive: false),
            demoView1.bottom(to: layoutGuide, isActive: false),
            demoView1.width(width, isActive: false),
            
            demoView2.top(to: layoutGuide, isActive: false),
            demoView2.left(to: layoutGuide, isActive: false),
            demoView2.rightToLeft(of: demoView4, offset: -offset, isActive: false),
            demoView2.height(width, isActive: false),
            
            demoView3.leftToRight(of: demoView1, offset: offset, isActive: false),
            demoView3.height(width, isActive: false),
            demoView3.bottom(to: layoutGuide, isActive: false),
            demoView3.right(to: layoutGuide, isActive: false),
            
            demoView4.top(to: layoutGuide, isActive: false),
            demoView4.right(to: layoutGuide, isActive: false),
            demoView4.width(width, isActive: false),
            demoView4.bottomToTop(of: demoView3, offset: -offset, isActive: false)
        ]
        
        constraints.append(contentsOf: layoutGuide.edges(to: view.safeAreaLayoutGuide, insets: .uniform(layoutMargin), isActive: false))
        
        return constraints
    }
    
    func createRecursiveConstraints() -> Constraints {
        var constraints = Constraints()
        
        constraints.append(contentsOf: demoView1.edgesToSuperview(insets: .uniform(layoutMargin), isActive: false, usingSafeArea: true))
        
        constraints.append(contentsOf: demoView2.origin(to: demoView1, insets: .top(layoutMargin) + .left(layoutMargin), isActive: false))
        constraints.append(contentsOf: demoView2.size(to: demoView1, multiplier: 0.5, insets: CGSize(width: -layoutMargin * 1.5, height: -layoutMargin * 2), isActive: false))
        
        constraints.append(demoView4.top(to: demoView1, offset: layoutMargin, isActive: false))
        constraints.append(demoView4.right(to: demoView1, offset: -layoutMargin, isActive: false))
        constraints.append(contentsOf: demoView4.size(to: demoView2))
        
        constraints.append(contentsOf: demoView3.edges(to: demoView1, excluding: .top, insets: .uniform(layoutMargin), isActive: false))
        constraints.append(demoView3.height(to: demoView1, multiplier: 0.5, offset: -layoutMargin * 2, isActive: false))
        
        return constraints
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return false
    }
}
