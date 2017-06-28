//
//  DriverLoginVC.swift
//  AUCADriver
//
//  Created by Sanira on 6/27/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class DriverLoginVC: UIViewController {

    private var DRIVER_SIGNUP_ID = "DriverSignUpToFillData"
    private var DRIVER_LOGIN_ID = "DriverLogin"
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
                    self.performSegue(withIdentifier: self.DRIVER_LOGIN_ID, sender: nil)
                    print("LOGIN")
                }
               
            })
        } else {
            alertTheUser(title: "Пустые поля", message: "Заполните поля")
        }
    }
    
    @IBAction func signUp() {
        if txtEmail.text != nil &&
            txtPassowrd.text != nil {
           AuthManager.shared.signUp(with: txtEmail.text!, password: txtPassowrd.text!, loginHandler: { (message) in
                if message !=  nil {
                    self.alertTheUser(title: "problem in creating user", message: "try once more ")
                } else {
                    self.performSegue(withIdentifier: self.DRIVER_SIGNUP_ID, sender: nil)
                }
           })
        } else {
            alertTheUser(title: "Пустые поля", message: "Заполните поля")
        }
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
