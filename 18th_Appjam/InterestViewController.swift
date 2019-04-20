//
//  InterestViewController.swift
//  18th_Appjam
//
//  Created by KM_TM on 20/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class InterestViewController: UIViewController {

    let url = "http://idoldb.iptime.org:8765/account"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func completionButton(_ sender: Any) {
        let email = SendRegisterData.shared.email
        let username = SendRegisterData.shared.username
        let passwd1 = SendRegisterData.shared.passwd1
        let passwd2 = SendRegisterData.shared.passwd2
        let gender = Int(SendRegisterData.shared.gender!)
        let birth = Int(SendRegisterData.shared.birth!)
        let tel = SendRegisterData.shared.tel
        let favorite = SendRegisterData.shared.favorite
        
        let param = ["email":\(email),"username":\(username),"password1":\(passwd1),"passsword2":\(passwd2),"gender":\(gender)]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
