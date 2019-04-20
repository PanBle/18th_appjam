//
//  ViewController.swift
//  18th_Appjam
//
//  Created by KM_TM on 20/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func temp() {
        let apiurl: URL = URL(string: "http://idoldb.iptime.org:8765/account/login")!
        
        let email = ""
        let passwd = ""
        
        let param = ["email":"\(email)","password":"\(passwd)"]
        
        let header = ["Content-Type":"application/json", "Accept":"application/json"]
        
        Alamofire.request(apiurl, method: .post, parameters: param, encoding: URLEncoding.default, headers: header).responseJSON(completionHandler: {res in
            switch res.result {
            case .success(let value):
                let tem = JSON(value)
                if tem["success"].bool! {
                    self.view.makeToast("로그인에 성공하였습니다")
                    self.performSegue(withIdentifier: "LoginToMainSegue", sender: nil)
                }else {
                    self.view.makeToast("\(tem["error"].string!)")
                }
            case .failure(let error):
                self.view.makeToast("Network error")
                print("\(error)")
            }
        })
        
    }

}

