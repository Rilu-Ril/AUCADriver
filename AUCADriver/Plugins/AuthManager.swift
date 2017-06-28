//
//  AuthManager.swift
//  AUCADriver
//
//  Created by Sanira on 6/27/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import Foundation
import FirebaseAuth

struct LoginErrorCode {
    static let INVALID_EMAIL = "Неправильно введен адрес электронной почты."
    static let WRONG_PASSWORD = "Неправильно введен пароль."
    static let USER_NOT_FOUND = "Пользователь не найден."
    static let EMAIL_IN_USER = "Пользователь зарегестрирован в системе."
    static let WEAK_PASSWORD = "Слабый пароль. Введите новый"
    
}

class AuthManager {
    
    typealias LoginHandler = (_ msg: String?) -> ()
    
    class var shared: AuthManager   {
        struct Static {
            static let instance = AuthManager()
        }
        return Static.instance
    }
    
    func login(email: String, password: String, loginHandler: LoginHandler?) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
                
            } else {
                loginHandler?(nil)
            }
        }
    }
    
    private func handleErrors(err: NSError, loginHandler: LoginHandler?) {
        if let errCode = AuthErrorCode(rawValue: err.code) {
            switch errCode {
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD)
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL)
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND)
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_IN_USER)
            case .weakPassword:
                break
            default:
                break
            }
        }
      
    }
}
