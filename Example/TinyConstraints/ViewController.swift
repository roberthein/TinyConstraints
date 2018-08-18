import Foundation
import UIKit
import TinyConstraints

protocol Updatable {
    func reset()
    func update()
}

class ViewController: UIViewController {
    
    private let examples: [UIView] = [
        Example.collections.view(),
        Example.basic.view(),
        Example.advanced.view()
    ]
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceHorizontal = true
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        
        return view
    }()
    
    private lazy var contentView = UIView()
    private lazy var indicator = PageIndicator(count: examples.count)
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        view.addSubview(scrollView)
        view.addSubview(indicator)
        scrollView.addSubview(contentView)
        
        scrollView.edgesToSuperview()
        
        contentView.edgesToSuperview()
        contentView.height(to: scrollView, priority: .defaultHigh)
        contentView.stack(examples, axis: .horizontal, width: UIScreen.main.bounds.width)
        
        indicator.centerX(to: view)
        indicator.bottom(to: view, offset: -20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        index = 0
        startTimer()
    }
    
    var index: Int? = nil {
        didSet {
            guard let index = index, index != oldValue else {
                return
            }
            
            examples.compactMap { $0 as? Updatable }.forEach { $0.reset() }
            indicator.selected = index
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let index = self.index, let example = self.examples[safe: index] as? Updatable {
                example.update()
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.invalidate()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        index = Int(scrollView.contentOffset.x / scrollView.frame.width)
        startTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            index = Int(scrollView.contentOffset.x / scrollView.frame.width)
            startTimer()
        }
    }
}
