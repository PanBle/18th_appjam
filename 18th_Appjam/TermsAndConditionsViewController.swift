//
//  TermsAndConditionsViewController.swift
//  18th_Appjam
//
//  Created by baby1234 on 21/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    
    @IBOutlet weak var termsAndConditionsView: UIView!
    @IBOutlet weak var agreeAndLoginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewsinit()
    }
    
    func viewsinit() {
        termsAndConditionsView.makeRoundRadius(cornerRadius: 14)
        termsAndConditionsView.makeShadow(color: "#071640", opacity: 0.16, radius: 12)
        
        
        agreeAndLoginView.layer.shadowColor = UIColor.gray.cgColor
        agreeAndLoginView.layer.shadowRadius = 3
        agreeAndLoginView.layer.shadowOpacity = 12
        agreeAndLoginView.layer.masksToBounds = false
    }
    
    @IBAction func agreeAndStartBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "RegisterSegue", sender: nil)
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
}
