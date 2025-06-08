import UIKit

class BlueViewController: UIViewController {
    
    private lazy var label = {
        let label = UILabel()
        label.text = "Blue"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        configureSubviews()
    }
    
    func configureSubviews() {
        view.addSubview(label, withConstraints: [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
