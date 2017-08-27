//
//  APJTableView.swift
//  Pods
//
//  Created by Pino, Angelo on 21/08/2017.
//
//

import UIKit

public protocol APJTableViewDelegate: UITableViewDelegate, UITableViewDataSource { }

public class APJTableView: UITableView {
    
    public weak var wrapDelegate: APJTableViewDelegate? {
        didSet {
            delegate = wrapDelegate
            dataSource = wrapDelegate
        }
    }

    // MARK: initialization methods
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _initialize()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        _initialize()
    }
    
    
    private func _initialize() {
        rowHeight = UITableViewAutomaticDimension
        estimatedRowHeight = 300
        tableFooterView = UIView(frame: .zero)
        cellLayoutMarginsFollowReadableWidth = false
        separatorInset = .zero
        layoutMargins = .zero
    }
}
