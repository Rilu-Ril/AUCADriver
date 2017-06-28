//
//  DriverLoginVC.swift
//  AUCADriver
//
//  Created by Sanira on 6/27/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class DriverLoginVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassowrd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func login() {
        if txtEmail.text != nil &&
            txtPassowrd.text != nil {
            AuthManager.shared.login(email: txtEmail.text!, password: txtPassowrd.text!, loginHandler: { (message) in
                if message != nil {
                    self.alertTheUser(title: "Ошибка при авторизации", message: message!)
                } else {
                    print("LOGIN")
                }
               
            })
        }
    }
    
    @IBAction func signIn() {
        
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: title, style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
