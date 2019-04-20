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
    @IBOutlet weak var RegisterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewsinit()
    }
    
    func viewsinit() {
        termsAndConditionsView.makeRoundRadius(cornerRadius: 14)
        termsAndConditionsView.makeShadow(color: "#071640", opacity: 0.16, radius: 12)
        
        registerAndLoginBtnView.makeShadow(color: "#071640", opacity: 0.16, radius: 12)
        
        RegisterBtn.makeRoundRadius(cornerRadius: 14)
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "TermsAndConditionsSegue", sender:  nil)
    }
    @IBAction func loginBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
}
