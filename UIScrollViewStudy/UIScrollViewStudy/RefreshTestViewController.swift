import UIKit

class RefreshTestViewController: UIViewController {
    
    var count = 0
    
    lazy var refreshControl = UIRefreshControl().then { control in
        control.addAction(UIAction { _ in
            print("hello refresh")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.count += 1
                control.endRefreshing()
                self.updateUI()
            }
        }, for: .valueChanged)
    }
    
    lazy var scrollView = UIScrollView().then {
        $0.refreshControl = self.refreshControl
        $0.backgroundColor = .gray
    }
    
    lazy var label = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .title1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureSubviews()
        updateUI()
    }
    
    func configureSubviews() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        scrollView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(
            width: scrollView.frame.size.width, height: scrollView.frame.size.height
        )
    }
    
    func updateUI() {
        label.text = "Hello my count is \(count)"
    }
    
    
}
