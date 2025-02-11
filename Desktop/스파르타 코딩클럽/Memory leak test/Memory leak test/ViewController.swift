//
//  ViewController.swift
//  Memory leak test	
//
//  Created by 박진홍 on 12/24/24.
//

import UIKit

final class ViewController: UIViewController {
    var foo: Foo? = Foo()
    var bar: Bar? = Bar()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButton()
    }
    
    private func setButton() {
        let button: UIButton = {
            let button = UIButton(type: .roundedRect)
            button.setTitle("start memory leak", for: .normal)
            button.backgroundColor = .white
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
     
        
        let memoryLeak: UIAction = UIAction { _ in
            print("memory leak start")
            self.foo!.bar = self.bar
            self.bar!.foo = self.foo
            self.foo = nil
            self.bar = nil
        }
        
        button.addAction(memoryLeak, for: .touchUpInside)
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

final class Foo {
    var bar: Bar?
}

final class Bar {
    var foo: Foo?
}

