//
//  TutorialViewController.swift
//  LureAR
//
//  Created by Andrei Colrev on 16/10/17.
//  Copyright © 2017 Andrei Colrev. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet var textField_Email: UITextField!
    @IBOutlet var textField_Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClicked_Skip(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
