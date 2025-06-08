import UIKit

protocol UnAuthenticatedCoordinatorDelegate: AnyObject {
    
    func unAuthenticatedCoordinatorDidLogIn(_ coordinator: UnAuthenticatedCoordinator)
    
}

class UnAuthenticatedCoordinator: Coordinator {
    
    var coordinatorRef: Coordinator?
    weak var delegate: UnAuthenticatedCoordinatorDelegate?
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let authViewController = AuthViewController()
        authViewController.delegate = self
        authViewController.coordinatorRef = self
        navigationController.pushViewController(authViewController, animated: true)
    }
    
}

extension UnAuthenticatedCoordinator: AuthViewControllerDelegate {
    
    func authViewControllerDidTapLogIn(_ controller: AuthViewController) {
        AuthService.shared.login()
        delegate?.unAuthenticatedCoordinatorDidLogIn(self)
    }
    
}
