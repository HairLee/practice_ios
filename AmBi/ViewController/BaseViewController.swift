//
//  BaseViewController.swift
//  AmBi
//
//  Created by Dreamup on 10/24/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        doAutoLogin()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func  doAutoLogin() {
       print("BaseViewController doAutoLogin ")
        
    }


}
