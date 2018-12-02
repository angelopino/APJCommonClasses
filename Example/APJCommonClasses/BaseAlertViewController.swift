//
//  BaseAlertViewController.swift
//  APJCommonClasses
//
//  Created by Pino, Angelo on 02/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import APJCommonClasses

class BaseAlertViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlertAction(_ sender: UIButton) {
        let alert = APJAlert()
        alert.show("Title", message: "Alert message", acceptMessage: "accept") {
            // nothing
        }
    }
    
}
