import UIKit

protocol AuthenticatedCoordinatorDelegate: AnyObject {
    
    func authenticatedCoordinatorDidLogOut(_ coordinator: AuthenticatedCoordinator)
    
}

class AuthenticatedCoordinator: Coordinator {
    
    var coordinatorRef: Coordinator?
    weak var delegate: AuthenticatedCoordinatorDelegate?
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = UITabBarController(tabs: [
            UITab(title: "Home", image: UIImage(systemName: "house.fill"), identifier: "home") { _ in
                let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
                homeCoordinator.start()
                return homeCoordinator.navigationController
            },
            UITab(title: "About", image: UIImage(systemName: "book.fill"), identifier: "about") { _ in
                let aboutCoordinator = AboutCoordinator(navigationController: UINavigationController())
                aboutCoordinator.start()
                return aboutCoordinator.navigationController
            },
            UITab(title: "Profile", image: UIImage(systemName: "person.fill"), identifier: "profile") { _ in
                let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
                profileCoordinator.delegate = self
                profileCoordinator.coordinatorRef = self
                
                profileCoordinator.start()
                return profileCoordinator.navigationController
            },
        ])
        
        navigationController.pushViewController(tabBarController, animated: false)
    }
    
}

extension AuthenticatedCoordinator: ProfileCoordinatorDelegate {
    
    func profileCoordinatorDidLogOut(_ coordinator: ProfileCoordinator) {
        delegate?.authenticatedCoordinatorDidLogOut(self)
    }
    
}
