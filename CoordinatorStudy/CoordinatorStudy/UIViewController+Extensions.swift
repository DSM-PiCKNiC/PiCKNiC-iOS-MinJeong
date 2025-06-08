import UIKit

extension UIViewController {
    
    func setTitleAsLarge(_ title: String) {
        self.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

