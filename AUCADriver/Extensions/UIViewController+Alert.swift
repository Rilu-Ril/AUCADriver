//
//  UIViewController+Alert.swift
//  AUCADriver
//
//  Created by Sanira on 6/29/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showCustomAlert(title:         String,
                   message:             String,
                   okButtonTitle:       String,
                   cancelButtonTitle:   String?,
                   okAction:            (()->())?,
                   cancelAction:        (()->())?,
                   completion:          (()->())?) {
        
        let alertController = UIAlertController(title:          title,
                                                message:        message,
                                                preferredStyle: .alert)
        
        let ok = UIAlertAction(title:   okButtonTitle,
                               style:   .default,
                               handler: { (UIAlertAction) in
            okAction?()
        })
        
        alertController.addAction(ok)
        
        if cancelButtonTitle != nil {
            let cancel = UIAlertAction(title:   cancelButtonTitle,
                                       style:   .default,
                                       handler: { (UIAlertAction) in
                cancelAction?()
            })
            
            alertController.addAction(cancel)
        }
        self.present(alertController, animated: true, completion: completion)
    }
    
    func showCustomActionAlert(title:       String,
                               message:     String,
                               buttons:     [String],
                               actions:     [()->()],
                               completion:  (()->())?) {
        
        let alertController = UIAlertController(title:          title,
                                                message:        message,
                                                preferredStyle: .actionSheet)
        
        for (index, button) in buttons.enumerated() {
            let action = UIAlertAction(title:   button,
                                       style:   .default,
                                       handler: { (UIAlertAction) in
                actions[index]()
            })
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: completion)
    }
    
    func showAlert(_ title: String, message: String) {

        self.showCustomAlert(title:         title,
                       message:             message,
                       okButtonTitle:       "OK",
                       cancelButtonTitle:   nil,
                       okAction:            nil,
                       cancelAction:        nil,
                       completion:          nil)
    }
    
    func showErrorAlert(_ message: String) {
        self.showCustomAlert(title:         "Возникла ошибка",
                       message:             message,
                       okButtonTitle:       "OK",
                       cancelButtonTitle:   nil,
                       okAction:            nil,
                       cancelAction:        nil,
                       completion:          nil)
    }
    
      
}
