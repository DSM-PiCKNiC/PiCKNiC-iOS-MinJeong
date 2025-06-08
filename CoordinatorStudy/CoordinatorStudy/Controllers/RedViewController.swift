import UIKit

class RedViewController: UIViewController {
    
    private lazy var label = {
        let label = UILabel()
        label.textColor = .lightText
        label.text = "Red"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureSubviews()
    }
    
    func configureSubviews() {
        view.addSubview(label, withConstraints: [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
