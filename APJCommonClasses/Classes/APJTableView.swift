//
//  APJTableView.swift
//  Pods
//
//  Created by Pino, Angelo on 21/08/2017.
//
//

import UIKit

public protocol APJTableViewDelegate: UITableViewDelegate, UITableViewDataSource { }

open class APJTableView: UITableView {
    
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
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        _initialize()
    }
    
    
    private func _initialize() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 300
        tableFooterView = UIView(frame: .zero)
        cellLayoutMarginsFollowReadableWidth = false
        separatorInset = .zero
        layoutMargins = .zero
    }
}
