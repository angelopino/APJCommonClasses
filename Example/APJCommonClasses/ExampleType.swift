//
//  ExampleType.swift
//  APJCommonClasses
//
//  Created by Pino, Angelo on 26/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

enum ExampleType {
    case baseTableView
    
    var title: String {
        switch self {
        case .baseTableView: return "TableView"
        }
    }
    
    var segue: String {
        switch self {
        case .baseTableView: return "TableViewSegue"
        }
    }
}
