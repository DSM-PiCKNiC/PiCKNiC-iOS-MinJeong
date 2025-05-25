import UIKit

protocol Then {}

extension Then where Self: UIView {
    
    func then(_ block: ((Self) -> Void)? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        block?(self)
        return self
    }
    
}

extension UIView: Then {}

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0) })
    }

}
