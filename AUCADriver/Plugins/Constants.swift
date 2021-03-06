//
//  Constants.swift
//  AUCADriver
//
//  Created by Sanira on 6/28/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import Foundation

class Constants {
    //AuthManager
    static let SEND_VERIFICATION_MAIL_FAILED = "Unable to send verification mail"
    // DBManager
    
    static let RIDERS       = "riders"
    static let DRIVERS      = "drivers"
    
    static let EMAIL        = "email"
    static let PASSWORD     = "password"
    static let DATA         = "data"
    static let IS_RIDER     = "isRider"
    static let CAR_REQUEST  = "carRequest"
    static let CAR_ACCEPTED = "carAccepted"
    
    //Car handler
    
    static let NAME         = "name"
    static let LATITUDE     = "latitude"
    static let LONGITUDE    = "longitude"
    
    // Login
    static let LOGIN_CREATE_USER_ERROR  =  "Возникла ошибка при создании аккаунта пользователя. Попробуйте еще раз"
    static let LOGIN_EMPTY_FIELDS_ERROR = "Заполните все поля"
    static let LOGIN_VERIFICATION_SENT = "Вам отправлено письмо на вашу почту с подтверждающей ссылкой. Пожалуйста пройдите по ссылке чтобы подтвердить, в том, что вы действительно студент ауца"

}
