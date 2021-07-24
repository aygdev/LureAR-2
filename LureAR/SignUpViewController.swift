//
//  SignUpViewController.swift
//  LureAR
//
//  Created by Andrei Colrev on 16/10/17.
//  Copyright © 2017 Andrei Colrev. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var textField_Email: UITextField!
    @IBOutlet var textField_Password: UITextField!
    @IBOutlet var textField_ConfirmPassword: UITextField!
    
    @IBOutlet var btnOutlet_Facebook: UIButton!
    @IBOutlet var btnOutlet_Google: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnOutlet_Facebook.layer.borderColor = UIColor.init(colorLiteralRed: 0/255, green: 0/255, blue: 180/255, alpha: 1).cgColor
        btnOutlet_Google.layer.borderColor = UIColor.init(colorLiteralRed: 223/255, green: 14/255, blue: 0/255, alpha: 1).cgColor
        
        self.setBorderAndLayer(_button: btnOutlet_Facebook)
        self.setBorderAndLayer(_button: btnOutlet_Google)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBorderAndLayer(_button : UIButton) -> Void {
        _button.backgroundColor = .clear
        _button.layer.cornerRadius = 22
        _button.layer.borderWidth = 1
    }
    
    @IBAction func btnClicked_Register(_ sender: Any) {
    }

    @IBAction func btnClicked_Facebook(_ sender: Any) {
    }
    
    @IBAction func btnClicked_Google(_ sender: Any) {
    }

    @IBAction func btnClicked_AlreadyHaveAccount(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
