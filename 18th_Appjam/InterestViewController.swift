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


class InterestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellcarta:[String] = ["공기계","화장품","신발","케이블","카메라","재능"]
    let cellnumber:[String] = ["2048개", "1024개","512개","256개","128개","64개"]
    let cellID = "InterestCell"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellcarta.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! CustomCell
//        cell.interestImageView.image
        cell.nameLabel.text = cellcarta[indexPath.row]
        cell.numberLabel.text = cellnumber[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        cell.backgroundColor = UIColor.blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var interest: UICollectionView!
    
    @IBAction func CompleteButton(_ sender: Any) {
        let apiurl: URL = URL(string: "http://idoldb.iptime.org:8765/account/register")!
    
        let email = SendRegisterData.shared.email
        let username = SendRegisterData.shared.username
        let passwd1 = SendRegisterData.shared.passwd1
        let passwd2 = SendRegisterData.shared.passwd2
        let gender = Int(SendRegisterData.shared.gender!)
        let birth = Int(SendRegisterData.shared.birth!)
        let tel = SendRegisterData.shared.tel
        let favorite = SendRegisterData.shared.favorite
        
        let param = ["email":"\(email)","username":"\(username)","password1":"\(passwd1)","password2":"\(passwd2)","gender":gender,"birth":birth,"tel":"\(tel)","favorite":"\(favorite)"] as [String : Any]
        
        let header = ["Content-Type":"application/json", "Accept":"application/json"]
        
        Alamofire.request(apiurl, method: .post, parameters: param, encoding: URLEncoding.default, headers: header).responseJSON(completionHandler: {res in
            switch res.result {
            case .success(let value) :
                let temJSON = JSON(value)
                if temJSON["success"].bool! {
                    self.view.makeToast("회원가입에 성공했습니다")
                    self.performSegue(withIdentifier: "InterestToMainSegue", sender: nil)
                }
                else{
                    self.view.makeToast("\(temJSON["error"])")
                }
            case .failure(let error):
                self.view.makeToast("Network Error")
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
class CustomCell: UICollectionViewCell {
    @IBOutlet weak var interestImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
}
