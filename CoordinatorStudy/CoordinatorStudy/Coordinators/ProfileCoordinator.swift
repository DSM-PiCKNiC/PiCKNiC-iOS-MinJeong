import UIKit

protocol ProfileCoordinatorDelegate: AnyObject {
    
    func profileCoordinatorDidLogOut(_ coordinator: ProfileCoordinator)
    
}

class ProfileCoordinator: Coordinator {
    
    var coordinatorRef: Coordinator?
    weak var delegate: ProfileCoordinatorDelegate?
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.delegate = self
        profileViewController.coordinatorRef = self
        navigationController.pushViewController(profileViewController, animated: true)
    }
    
}

extension ProfileCoordinator: ProfileViewControllerDelegate {
    
    func profileViewControllerDidTapLogOut(_ controller: ProfileViewController) {
        AuthService.shared.logout()
        delegate?.profileCoordinatorDidLogOut(self)
    }
    
}
