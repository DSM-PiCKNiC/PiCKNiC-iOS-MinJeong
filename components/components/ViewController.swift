//
//  ViewController.swift
//  components
//
//  Created by 김민정 on 5/9/25.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var button = UIButton().then {
        $0.setStyle(for: .login)
        $0.setTitle("Login", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubviews()
        setLayout()
    }
    
    func addSubviews() {
        [
            button
        ].forEach { view.addSubview($0) }
    }
    
    func setLayout() {
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }


}

