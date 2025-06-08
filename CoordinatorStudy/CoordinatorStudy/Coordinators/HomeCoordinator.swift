import UIKit

class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        homeViewController.coordinatorRef = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
}

extension HomeCoordinator: HomeViewControllerDelegate {
    
    func homeViewController(_ controller: HomeViewController, didTapItem item: HomeItem) {
        let viewController = switch item {
        case .red:
            RedViewController()
        case .blue:
            BlueViewController()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
