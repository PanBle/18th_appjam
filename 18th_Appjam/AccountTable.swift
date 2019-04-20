//
//  AccountTable.swift
//  18th_Appjam
//
//  Created by KM_TM on 20/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import Foundation


class SendRegisterData {
    static let shared : SendRegisterData = SendRegisterData()
    
    var email:String?
    var username:String?
    var passwd1:String?
    var passwd2:String?
    var gender:String? //int 변환
    var birth:String? //int 변환
    var tel:String?
    var favorite:String? //식별자 |
}

struct Register : Codable {
    let success : Bool
    let token : String
    
}

struct Login : Codable {
    let success : Bool
    let token : String
}
