//
//  AuthManager.swift
//  AUCADriver
//
//  Created by Sanira on 6/27/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

struct LoginErrorCode {
    static let INVALID_EMAIL    = "Неправильно введен адрес электронной почты."
    static let WRONG_PASSWORD   = "Неправильно введен пароль."
    static let USER_NOT_FOUND   = "Пользователь не найден."
    static let EMAIL_IN_USER    = "Пользователь зарегестрирован в системе."
    static let WEAK_PASSWORD    = "Слабый пароль. Введите новый"
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
                if let user = Auth.auth().currentUser {
                    if user.isEmailVerified {
                        loginHandler?(nil)
                    } else {
                        loginHandler!("Email is not varified")
                    }
                }
            }
        }
    }
    
    func signUp(with email: String, password: String, loginHandler: LoginHandler?) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
            } else {
                user?.sendEmailVerification(completion: { (error) in
                    if error != nil {
                        loginHandler?(Constants.SEND_VERIFICATION_MAIL_FAILED)
                    } else {
                        loginHandler?(nil)
                    }
                })
            }
        }
    }
    
    func saveUser(uid: String, email: String, password: String) {
        DBManager.shared.saveUser(with: uid , email: email, password: password)
    }
    
    func logOut() -> Bool {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                return true
            } catch {
                return false
            }
        }
        return true
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
    
    func check(email: String) -> (Bool, String) {
        if !isValidEmail(email) {
            return(false, "Введен нерпавильный формат почты")
        }
        if !email.contains("@auca.kg") {
            return(false, "Введите пожалуйста почту АУЦА: student_s@auca.kg")
        }
        return(true, "")
    }
    
    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
