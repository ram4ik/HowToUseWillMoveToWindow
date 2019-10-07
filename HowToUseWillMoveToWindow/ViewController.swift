//
//  ViewController.swift
//  HowToUseWillMoveToWindow
//
//  Created by ramil on 07/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import UIKit

class HelloButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        backgroundColor = .green
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        widthAnchor.constraint(equalToConstant: 158).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addTarget(self, action: #selector(down), for: .touchDown)
        addTarget(self, action: #selector(up), for: .touchUpInside)
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        guard let superview = superview else {
            return
        }
        
        //bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -20).isActive = true
        //rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -30).isActive = true
        
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -30).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 20).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func down() {
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
    }
    
    @objc fileprivate func up() {
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.transform = .identity
        })
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = HelloButton(title: "Hello")
        view.addSubview(button)
    }


}

