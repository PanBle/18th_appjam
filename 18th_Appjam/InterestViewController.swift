//
//  InterestViewController.swift
//  18th_Appjam
//
//  Created by KM_TM on 20/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit
import SwiftyJSON
import Toast_Swift
import Alamofire

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
        
        let apiURL : URL = URL(string: url + "/register")!
        
        let param = ["email":"\(email!)","username":"\(username)","password1":"\(passwd1)","passsword2":"\(passwd2)","gender":gender!, "birth":birth, "tel":"\(tel)", "favorite":"\(favorite)"] as [String : Any]
        
        Alamofire.request(apiURL, method: .post, parameters: param, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"]).responseJSON(completionHandler: {res in
            switch res.result {
            case .success(let value):
                let temJSON = JSON(value)
                if temJSON["success"].bool! {
                    self.view.makeToast("회원가입에 성공했습니다")
                    self.performSegue(withIdentifier: "InterestToMainSegue", sender: nil)
                }
                else{
                    self.view.makeToast("이메일이 겹칩니다")
                }
            case .failure(let value):
                self.view.makeToast("Network error!")
            }
        
        })
        
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
