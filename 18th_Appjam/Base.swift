//
//  Base.swift
//  18th_Appjam
//
//  Created by baby1234 on 21/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

extension UIViewController {
    func movePage(segueName: String) {
        self.performSegue(withIdentifier: segueName, sender: nil)
    }
}

extension UIView {
    func makeRoundRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func makeShadow(color: String, opacity: Float, radius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(named: color)?.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
