import UIKit
import SnapKit
import RxSwift

class MainViewController: UIViewController {
    
    lazy var button = UIButton(primaryAction: UIAction(title: "Second") { _ in
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        test()
    }
    
    func test() {
    }


}

