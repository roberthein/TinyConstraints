
import TinyConstraints

protocol Updatable {
    func reset()
    func update()
}

class ViewController: UIViewController {
    
    let examples: [UIView] = [
        Example.collections.view(),
        Example.basic.view(),
        Example.advanced.view()
    ]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = true
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    var indicator: PageIndicator!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.edges(to: view)
        
        scrollView.addSubview(contentView)
        contentView.edges(to: scrollView)
        contentView.height(to: scrollView, priority: .defaultHigh)
        contentView.stack(examples, axis: .horizontal, width: UIScreen.main.bounds.width)
        
        indicator = PageIndicator(count: examples.count)
        view.addSubview(indicator)
        
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
            guard let index = index, index != oldValue else { return }
            examples.flatMap { $0 as? Updatable }.forEach { $0.reset() }
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
