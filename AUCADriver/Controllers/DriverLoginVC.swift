//
//  DriverLoginVC.swift
//  AUCADriver
//
//  Created by Sanira on 6/27/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class DriverLoginVC: UIViewController {

    private var DRIVER_SIGNUP_ID    = "DriverSignUpToFillData"
    private var DRIVER_LOGIN_ID     = "DriverLogin"
    @IBOutlet weak var txtEmail:    UITextField!
    @IBOutlet weak var txtPassowrd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("driver", forKey: "role")
    }
    
    
    @IBAction func login() {
        if txtEmail.text != "" && txtPassowrd.text != "" {
            AuthManager.shared.login(email: txtEmail.text!, password: txtPassowrd.text!, loginHandler: { (message) in
                if message != nil {
                    self.showErrorAlert(message!)
                } else {
                    self.performSegue(withIdentifier: self.DRIVER_LOGIN_ID, sender: nil)
                }
               
            })
        } else {
           showErrorAlert(Constants.LOGIN_EMPTY_FIELDS_ERROR)
        }
    }
    
    @IBAction func signUp() {
        if txtEmail.text != nil &&
            txtPassowrd.text != nil {
           AuthManager.shared.signUp(with: txtEmail.text!, password: txtPassowrd.text!, loginHandler: { (message) in
                if message !=  nil {
                    self.showErrorAlert(Constants.LOGIN_CREATE_USER_ERROR)
                } else {
                    self.performSegue(withIdentifier: self.DRIVER_SIGNUP_ID, sender: nil)
                }
           })
        } else {
            showErrorAlert(Constants.LOGIN_EMPTY_FIELDS_ERROR)
        }
    }
}
