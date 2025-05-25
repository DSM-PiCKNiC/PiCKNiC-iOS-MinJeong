import UIKit

class DelegateTestViewController: UIViewController {
    
    lazy var scrollView = UIScrollView().then {
        $0.delegate = self
        $0.backgroundColor = .systemGray
    }
    
    lazy var childView1 = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    lazy var childView2 = UIView().then {
        $0.backgroundColor = .systemRed
    }
    
    lazy var label = UILabel().then {
        $0.text = "Hello this is my label"
        $0.font = .preferredFont(forTextStyle: .largeTitle)
        $0.adjustsFontForContentSizeCategory = true
    }
    
    lazy var slider = UISlider().then { slider in
        slider.addAction(UIAction { [unowned self] _ in
            scrollView.setContentOffset(
                CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentSize.height * CGFloat(slider.value)),
                animated: false
            )
        }, for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSubviews()
    }
    
    func configureSubviews() {
        view.addSubviews(scrollView, slider)
        NSLayoutConstraint.activate([
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            slider.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])
        
        scrollView.addSubviews(childView1, childView2, label)
        NSLayoutConstraint.activate([
            childView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            childView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            childView1.widthAnchor.constraint(equalToConstant: 100),
            childView1.heightAnchor.constraint(equalToConstant: 100),
        ])
            
        NSLayoutConstraint.activate([
            childView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            childView2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 300),
            childView2.widthAnchor.constraint(equalToConstant: 100),
            childView2.heightAnchor.constraint(equalToConstant: 100),
        ])
            
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height * 2)
    }
    
}

extension DelegateTestViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        slider.setValue(Float(scrollView.contentOffset.y / scrollView.contentSize.height), animated: false)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        print("scrollViewShouldScrollToTop")
        return true
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    
}
