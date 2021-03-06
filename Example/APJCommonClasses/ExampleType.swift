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
    case baseAlert
    case baseNibView
    
    var title: String {
        switch self {
        case .baseTableView: return "TableView"
        case .baseAlert: return "Alert"
        case .baseNibView: return "Custom view from nib file"
        }
    }
    
    var segue: String {
        switch self {
        case .baseTableView: return "BaseTableViewViewController"
        case .baseAlert: return "BaseAlertViewController"
        case .baseNibView: return "BaseNibViewViewController"
        }
    }
}
