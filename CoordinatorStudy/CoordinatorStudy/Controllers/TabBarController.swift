import UIKit

class TabBarController: UITabBarController {
    
    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let aboutCoordinator = AboutCoordinator(navigationController: UINavigationController())
    let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    
    convenience init() {
        self.init(tabs: [
            UITab(title: "Home", image: UIImage(systemName: "house.fill"), identifier: "home"),
            UITab(title: "About", image: UIImage(systemName: "book.fill"), identifier: "about"),
            UITab(title: "Profile", image: UIImage(systemName: "person.fill"), identifier: "profile"),
        ])
        viewControllers = [
            homeCoordinator.navigationController,
            aboutCoordinator.navigationController,
            profileCoordinator.navigationController,
        ]
    }
    
}
