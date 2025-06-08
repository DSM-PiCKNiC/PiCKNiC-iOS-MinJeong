import UIKit

protocol AuthViewControllerDelegate: AnyObject {
    
    func authViewControllerDidTapLogIn(_ controller: AuthViewController)
    
}

class AuthViewController: UIViewController {
    
    var coordinatorRef: Coordinator?
    weak var delegate: AuthViewControllerDelegate?
    
    private lazy var loginButton = UIButton(
        configuration: .filled(),
        primaryAction: UIAction(title: "Login") { [unowned self] _ in
            delegate?.authViewControllerDidTapLogIn(self)
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleAsLarge("Log in")
        view.backgroundColor = .systemBackground
        configureSubviews()
    }
    
    func configureSubviews() {
        view.addSubview(loginButton, withConstraints: [
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}

