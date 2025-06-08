import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var label = UILabel()
    lazy var textField1: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        return textField
    }()
    lazy var textField2: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        return textField
    }()

    override func viewDidLoad() {
        title = "Second"
        view.backgroundColor = .systemBackground
        
        addSubviews()
        setLayout()
        
        test()
    }
    
    func addSubviews() {
        [
            label,
            textField1,
            textField2
        ].forEach { view.addSubview($0) }
    }
    
    func setLayout() {
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-30)
        }
        
        textField1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(30)
            $0.width.equalTo(100)
        }
        
        textField2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(60)
            $0.width.equalTo(100)
        }
    }
    
    func test() {
        let a = textField1.rx.text.orEmpty
        let b = textField2.rx.text.orEmpty
        b.flatMap(<#T##selector: (String) throws -> ObservableConvertibleType##(String) throws -> ObservableConvertibleType#>)
    }
    
}
