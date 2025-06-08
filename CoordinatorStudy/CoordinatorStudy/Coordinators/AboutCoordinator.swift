import UIKit

class AboutCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let aboutViewController = AboutViewController()
        navigationController.pushViewController(aboutViewController, animated: true)
    }
    
}

