import UIKit

class RootCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let coordinator = AuthService.shared.isLoggedIn ? authenticatedCoordinator() : unAuthenticatedCoordinator()
        coordinator.start()
    }
    
    func authenticatedCoordinator() -> Coordinator {
        let coordinator = AuthenticatedCoordinator(navigationController: navigationController)
        coordinator.coordinatorRef = self
        coordinator.delegate = self
        return coordinator
    }
    
    func unAuthenticatedCoordinator() -> Coordinator {
        let coordinator = UnAuthenticatedCoordinator(navigationController: navigationController)
        coordinator.coordinatorRef = self
        coordinator.delegate = self
        return coordinator
    }
    
}

extension RootCoordinator: AuthenticatedCoordinatorDelegate {
    
    func authenticatedCoordinatorDidLogOut(_ coordinator: AuthenticatedCoordinator) {
        navigationController.setViewControllers([], animated: false)
        unAuthenticatedCoordinator().start()
    }
    
}

extension RootCoordinator: UnAuthenticatedCoordinatorDelegate {
    
    func unAuthenticatedCoordinatorDidLogIn(_ coordinator: UnAuthenticatedCoordinator) {
        navigationController.setViewControllers([], animated: false)
        authenticatedCoordinator().start()
    }
    
}
