//
//  WelcomeViewController.swift
//  18th_Appjam
//
//  Created by KM_TM on 20/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var termsAndConditionsView: UIView!
    @IBOutlet weak var registerAndLoginBtnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewsinit()
    }
    
    func viewsinit() {
        
        termsAndConditionsView.layer.cornerRadius = 14
        termsAndConditionsView.layer.shadowColor = UIColor.gray.cgColor
        termsAndConditionsView.layer.shadowRadius = 3
        termsAndConditionsView.layer.shadowOpacity = 12
        termsAndConditionsView.layer.masksToBounds = false
        
        registerAndLoginBtnView.layer.shadowColor = UIColor.gray.cgColor
        registerAndLoginBtnView.layer.shadowRadius = 3
        registerAndLoginBtnView.layer.shadowOpacity = 12
        registerAndLoginBtnView.layer.masksToBounds = false
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "TermsAndConditionsSegue", sender:  nil)
    }
    @IBAction func loginBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
}
