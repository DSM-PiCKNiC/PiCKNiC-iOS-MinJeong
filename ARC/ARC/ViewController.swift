//
//  ViewController.swift
//  ARC
//
//  Created by 김민정 on 4/29/25.
//

import UIKit

class Test {
    
    let label: Int
    
    init(_ label: Int) {
        self.label = label
        print("Test(\(label)) initialized")
    }
    
    deinit {
        print("Test(\(label)) deinitialized")
    }
    
     
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var test1: Test? = Test(1) // Test(1) count = 1, Test(1) initialized
        var test2: Test? = Test(2) // Test(2) count = 1, Test(1) initialized
        
        test2 = test1 // Test(2) count = 0, Test(1) count = 2, Test(2) deinitialized
        
        test1 = nil // Test(1) count = 1
        test2 = nil // Test(1) count = 0, Test(1) deinitialized
    }


}

