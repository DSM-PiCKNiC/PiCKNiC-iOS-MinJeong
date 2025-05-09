import UIKit
import SnapKit
import Then

// UIView 클래스 상속을 통한 컴포넌트
class LoginButton: UIView {
    
    private lazy var button = UIButton().then {
        $0.setTitle("Test", for: .normal)
        $0.backgroundColor = .systemBlue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func addSubviews() {
        [
            button
        ].forEach { addSubview($0) }
    }
    
    func setLayout() {
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
}

// UIButton extension을 통한 컴포넌트
extension UIButton {
    
    enum Style {
        case login
    }
    
    func setStyle(for style: Style) {
        switch style {
        case .login:
            var configuration = UIButton.Configuration.plain()
            
            configuration.baseForegroundColor = .white
            
            var backgroundConfiguration = UIBackgroundConfiguration.clear()
            backgroundConfiguration.backgroundColor = UIColor.accent
            backgroundConfiguration.cornerRadius = 8
            configuration.background = backgroundConfiguration
            
            self.configuration = configuration
        }
    }
    
    
}

// Configuration 확장을 통한 컴포넌트
extension UIButton.Configuration {
    
    static func login() -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        var backgroundConfiguration = UIBackgroundConfiguration.clear()
        backgroundConfiguration.backgroundColor = UIColor.accent
        backgroundConfiguration.cornerRadius = 8
        configuration.background = backgroundConfiguration
        configuration.baseForegroundColor = .white
        return configuration
    }
    
    
}
