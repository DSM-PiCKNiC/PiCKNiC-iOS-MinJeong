import UIKit

enum HomeItem {
    
    case red
    case blue
    
    var label: String {
        switch self {
        case .red:
            "Red"
        case .blue:
            "Blue"
        }
    }
    
}

protocol HomeViewControllerDelegate: AnyObject {
    
    func homeViewController(_ controller: HomeViewController, didTapItem item: HomeItem)
    
}

class HomeViewController: UIViewController {
    
    var coordinatorRef: Coordinator?
    weak var delegate: HomeViewControllerDelegate?
    
    private lazy var label = {
        let label = UILabel()
        label.text = "Wow Home"
        return label
    }()
    
    private lazy var containerStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var buttonsStackView = {
        let stackView = UIStackView()
        stackView.spacing = 6
        return stackView
    }()
    
    private func navButton(for item: HomeItem) -> UIButton {
        UIButton(configuration: .filled(), primaryAction: UIAction(title: item.label) { [unowned self] _ in
            delegate?.homeViewController(self, didTapItem: item)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleAsLarge("Home")
        view.backgroundColor = .systemBackground
        configureSubviews()
    }
    
    func configureSubviews() {
        buttonsStackView.addArrangedSubview(navButton(for: .red))
        buttonsStackView.addArrangedSubview(navButton(for: .blue))
        
        containerStackView.addArrangedSubview(label)
        containerStackView.addArrangedSubview(buttonsStackView)
        
        view.addSubview(containerStackView, withConstraints: [
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
