//
//  APJAlert.swift
//  Pods
//
//  Created by Pino, Angelo on 02/12/2018.
//

import UIKit

public class APJAlert {
    
    public init() {}
    
    // MARK: - Private variable
    private let _emptyBlock = { () -> () in }
    
    private var topController: UIViewController? {
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController
        {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("APJAlert Error: You don't have any views set. You may be calling in viewdidload. Try viewdidappear.")
        }
        return presentedVC
    }

    private var _alertWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    // MARK: - Public Functions
    
    @discardableResult
    public func show(_ title: String?, message: String, acceptMessage: String, acceptBlock: @escaping () -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acceptButton = UIAlertAction(title: acceptMessage, style: .default, handler: { (action: UIAlertAction) in
            acceptBlock()
        })
        alert.addAction(acceptButton)
        _alertWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        return alert
    }
    
    @discardableResult
    public func show(_ title: String?, message: String?, buttons: [String], removePreviousAlerts: Bool = true, tapBlock: ((UIAlertAction, Int) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        return _show(alert: alert, buttons: buttons, removePreviousAlerts: removePreviousAlerts, tapBlock: tapBlock, completion: nil)
    }
    
    @discardableResult
    public func show(_ title: String?, html: NSAttributedString?, buttons: [String], removePreviousAlerts: Bool = true, tapBlock: ((UIAlertAction, Int) -> Void)?) -> UIAlertController {
        let html = html?.mutableCopy() as? NSMutableAttributedString
        let alert = UIAlertController(title: title, html: html, preferredStyle: .alert)
        return _show(alert: alert, buttons: buttons, removePreviousAlerts: removePreviousAlerts, tapBlock: tapBlock, completion: nil)
    }
    
    public func confirm(_ title: String?, message: String?, confirmTitle: String, cancelTitle: String, barButtonItem: UIBarButtonItem?, callbackConfirm: ((UIAlertAction) -> Void)?, callbackCancel: ((UIAlertAction) -> Void)?) {
        
        if UIDevice.current.userInterfaceIdiom != .pad {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet),
            clearAction = UIAlertAction(title: confirmTitle, style: .destructive, handler: { (action) in
                callbackConfirm?(action)
            }),
            cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action) in
                callbackCancel?(action)
            })
            alertController.addAction(clearAction)
            alertController.addAction(cancelAction)
            alertController.popoverPresentationController?.barButtonItem = barButtonItem
            alertController.modalPresentationStyle = .fullScreen
            _alertWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            alertController.view.layoutIfNeeded()
            
        } else {
            show(title, message: message, buttons: [confirmTitle, cancelTitle], tapBlock: { (action: UIAlertAction, index: Int) in
                if index == 0 {
                    callbackConfirm?(action)
                } else {
                    callbackCancel?(action)
                }
            })
        }
    }
    
    public func actionSheet(firstTitle: String, secondTitle: String?, style: UIAlertAction.Style = .destructive, secondStyle: UIAlertAction.Style = .destructive, cancelTitle: String, callbackFirstConfirm: ((UIAlertAction) -> Void)?, callbackSecondConfirm: ((UIAlertAction) -> Void)?, callbackCancel: ((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet),
        firstAction = UIAlertAction(title: firstTitle, style: style, handler: { (action) in
            callbackFirstConfirm?(action)
        }),
        cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action) in
            callbackCancel?(action)
        })
        
        if let secondTitle = secondTitle {
            let secondAction = UIAlertAction(title: secondTitle, style: secondStyle, handler: { (action) in
                callbackSecondConfirm?(action)
            })
            alertController.addAction(secondAction)
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(cancelAction)
        _alertWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
    // MARK: private methods
    
    private func _show(alert: UIAlertController, buttons: [String], removePreviousAlerts: Bool = true, tapBlock: ((UIAlertAction, Int) -> Void)?, completion: ((UIAlertController) -> ())?) -> UIAlertController {
        var buttonIndex = 0
        for buttonTitle in buttons {
            let action = UIAlertAction(title: buttonTitle, preferredStyle: .default, buttonIndex: buttonIndex, tapBlock: { (action: UIAlertAction, idx: Int) in
                tapBlock?(action, idx)
            })
            buttonIndex += 1
            alert.addAction(action)
        }
        
        _alertWindow?.rootViewController?.present(alert, animated: true) {
            completion?(alert)
        }
        return alert
    }
}

extension UIAlertController {
    
    convenience init(title: String?, message: String?, textFieldHint: String?,
                     textFieldValue: String?, preferredStyle: UIAlertController.Style, buttons: [String], tapBlock: ((UIAlertAction, Int, String?) -> Void)?) {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        self.addTextField(configurationHandler: { (textField: UITextField!) in
            textField.placeholder = textFieldHint
            textField.text = textFieldValue
        })
        var buttonIndex = 0
        for buttonTitle in buttons {
            let action = UIAlertAction(title: buttonTitle, preferredStyle: .default, buttonIndex: buttonIndex) {
                (act: UIAlertAction, btnIdx: Int) in
                if let textFields = self.textFields {
                    let textField = textFields[0] as UITextField
                    tapBlock?(act, btnIdx, textField.text)
                }
            }
            buttonIndex += 1
            self.addAction(action)
        }
    }
    
    convenience init(title: String?, html: NSMutableAttributedString?, preferredStyle: UIAlertController.Style) {
        self.init(title: title, message: nil, preferredStyle: preferredStyle)
        self.setValue(html, forKey: "attributedMessage")
    }
}

extension UIAlertAction {
    convenience init(title: String?, preferredStyle: UIAlertAction.Style, buttonIndex: Int, tapBlock: ((UIAlertAction, Int) -> Void)?) {
        self.init(title: title, style: preferredStyle) {
            (action: UIAlertAction) in
            if let block = tapBlock {
                block(action, buttonIndex)
            }
        }
    }
}

