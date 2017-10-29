//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Alexey Danilov on 21/10/2017.
//  Copyright © 2017 DanilovDev. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let containerView = UIView()
        self.view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    

    
}

