//
//  ViewController.swift
//  Alto
//
//  Created by Vik Denic on 1/15/18.
//  Copyright © 2018 nekturlabs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var miniPlayerBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.miniPlayerBottomConstraint.constant = -UITabBarController().tabBar.frame.size.height
    }

}

