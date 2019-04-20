//
//  Register2ViewController.swift
//  18th_Appjam
//
//  Created by baby1234 on 21/04/2019.
//  Copyright © 2019 KM_TM. All rights reserved.
//

import UIKit

class Register2ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    
    let picker = UIImagePickerController()
    var woman:Bool = false
    var man:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageviewcircler()
        // Do any additional setup after loading the view.
    }
    @IBAction func manButton(_ sender: Any) {
        man = true
        woman = false
    }
    
    @IBAction func womanButton(_ sender: Any) {
        man = false
        woman = true
    }
    
    @IBAction func imageButton(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera =  UIAlertAction(title: "사진 찍기", style: .default) { (action) in self.openCamera()}
        let library =  UIAlertAction(title: "사진 갤러리에서 선택", style: .default) { (action) in self.openLibrary()}
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func imageviewcircler() {
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
        self.imageView.clipsToBounds = true
    }
    
    @IBAction func completeButton(_ sender: Any) {
        SendRegisterData.shared.username = nameTextField.text!
        SendRegisterData.shared.birth = birthTextField.text!
        if man == true {
            SendRegisterData.shared.gender = String(0)
        }else
        {
            SendRegisterData.shared.gender = String(1)
        }
        
        self.performSegue(withIdentifier: "InterestSegue", sender: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            imageView.image = image
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
    func openLibrary() {
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: false, completion: nil)
    }
    func openCamera() {
        picker.sourceType = .camera
        
        self.present(picker, animated: false, completion: nil)
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
