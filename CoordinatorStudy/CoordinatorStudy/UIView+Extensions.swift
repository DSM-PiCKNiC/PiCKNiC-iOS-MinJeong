import UIKit

extension UIView {
    
    func addSubview(_ view: UIView, withConstraints constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
}
