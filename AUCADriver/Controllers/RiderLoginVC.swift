//
//  PassengerLoginVC.swift
//  AUCADriver
//
//  Created by Sanira on 6/27/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class RiderLoginVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassowrd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delete this line later of replace
        UserDefaults.standard.set("rider", forKey: "role")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login() {
        
    }
    
    @IBAction func signIn() {
        
    }

}
