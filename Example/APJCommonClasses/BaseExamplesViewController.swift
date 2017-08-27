//
//  BaseExamplesViewController.swift
//  APJCommonClasses
//
//  Created by Pino, Angelo on 21/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import APJCommonClasses

class BaseExamplesViewController: UIViewController {
    
    var type: ExampleType!
    let cellIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = type.title
    }
    
    func initTableView(_ tableView: APJTableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.allowsSelection = false
    }
 
}
