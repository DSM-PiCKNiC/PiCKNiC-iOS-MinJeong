import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    
    func profileViewControllerDidTapLogOut(_ controller: ProfileViewController)
    
}

class ProfileViewController: UIViewController {
    
    var coordinatorRef: Coordinator?
    weak var delegate: ProfileViewControllerDelegate?
    
    private lazy var logOutButton = UIButton(
        configuration: .filled(),
        primaryAction: UIAction(title: "Log out") { [unowned self] _ in
            delegate?.profileViewControllerDidTapLogOut(self)
        }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleAsLarge("Profile")
        view.backgroundColor = .systemBackground
        configureSubviews()
    }
    
    func configureSubviews() {
        view.addSubview(logOutButton, withConstraints: [
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
