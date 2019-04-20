//
//  StartUpViewController.swift
//  18th_Appjam
//
//  Created by baby1234 on 21/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit
import Contacts

class StartUpViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func viewsInit() {
        startBtn.makeRoundRadius(cornerRadius: 14)
        startBtn.makeShadow(color: "#415FFF", opacity: 0.5, radius: 12)
    }
    
    @IBAction func startBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "StartUpToMainSegue", sender: nil)
    }
}
