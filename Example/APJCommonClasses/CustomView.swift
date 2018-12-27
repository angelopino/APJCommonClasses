//
//  CustomView.swift
//  APJCommonClasses_Example
//
//  Created by Pino, Angelo on 27/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import APJCommonClasses

class CustomView: APJNibView {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func changeLabelText(_ sender: UIButton) {
        label.text = "Changed"
    }
    
}
