import UIKit

class AboutViewController: UIViewController {
    
    private lazy var label = {
        let label = UILabel()
        label.text = "About page"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleAsLarge("About")
        view.backgroundColor = .systemBackground
        configureSubviews()
    }
    
    func configureSubviews() {
        view.addSubview(label, withConstraints: [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
