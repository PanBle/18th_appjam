//
//  RegisterViewController.swift
//  18th_Appjam
//
//  Created by KM_TM on 20/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit

class Register1ViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwdLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwd1TextField: UITextField!
    @IBOutlet weak var passwd2TextField: UITextField!
    @IBOutlet weak var completeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailLabel.text = ""
        self.passwdLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    func viewsInit() {
        completeBtn.makeRoundRadius(cornerRadius: 14)
        completeBtn.makeShadow(color: "#415FFF", opacity: 0.5, radius: 12)
        
        emailTextField.makeRoundRadius(cornerRadius: 14)
        passwd1TextField.makeRoundRadius(cornerRadius: 14)
        passwd2TextField.makeRoundRadius(cornerRadius: 14)
    }
    
    @IBAction func CompleteButton(_ sender: Any) {
        if validateEmail() && passwd1TextField.text! == passwd2TextField.text!
        {
            SendRegisterData.shared.email = emailTextField.text!
            SendRegisterData.shared.passwd1 = passwd1TextField.text!
            SendRegisterData.shared.passwd2 = passwd2TextField.text!
            performSegue(withIdentifier: "InterestSegue", sender: nil)
        }
        else{
            self.emailLabel.text = "이메일을 확인해주세요!"
            self.emailLabel.text = "비밀번호를 확인해주세요!"
        }
        
    }
    
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    @IBAction func PopButton(_ sender: Any) {
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
